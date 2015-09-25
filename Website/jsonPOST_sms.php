<?php
require "functions.php";

//making sure its  valid POST request
if( $_SERVER["REQUEST_METHOD"] == "POST" )
{
  //getting php post body data
  $jsondata = file_get_contents('php://input');
  if ($jsondata) 
  {
    //converting json to php array
    $decoded = json_decode($jsondata, true);
      switch (json_last_error())
      {
        case JSON_ERROR_NONE:
            $jsonError = ' - No errors';
        break;
        case JSON_ERROR_DEPTH:
            $jsonError = ' - Maximum stack depth exceeded';
        break;
        case JSON_ERROR_STATE_MISMATCH:
            $jsonError = ' - Underflow or the modes mismatch';
        break;
        case JSON_ERROR_CTRL_CHAR:
            $jsonError = ' - Unexpected control character found';
        break;
        case JSON_ERROR_SYNTAX:
            $jsonError = ' - Syntax error, malformed JSON';
        break;
        case JSON_ERROR_UTF8:
            $jsonError = ' - Malformed UTF-8 characters, possibly incorrectly encoded';
        break;
        default:
            $jsonError = ' - Unknown error';
        break;
      }

    //not a valid json value found
    if (is_null ($decoded)) 
    {
      $response['status'] = array(
      'type' => 'error',
      'value' => 'Invalid JSON value found',
      'error' => $jsonError
      );
    }
    else  //valid json values found
    {
        /* communicate to database */
        require 'webAPI.php';

        $peopleID;
        $responseArray;


        $fname = $decoded["firstName"];
        $middleN = $decoded["middleName"];
        $lname = $decoded["lastName"];
        $nickname = $decoded["nickName"];
        $email = $decoded["email"];
        $username = $decoded["username"];
        $pasword = $decoded["password"];
        $dob = $decoded["dob"];

        if( peopleUserExists( $username, $email ) )
        {
          //There is already a regisetred user with at least one of both credentials
          $responseArray = [
            "message" => "Username or Email already exist",
            "responseType" => "3",
            ];
        }
        else
        {
          //User doens't exist. Let's add him/her to the DB
          $peopleID = storeStaffCredentials( $username, $password, $email );

          if( $peopleID == "" )
            echo "There was problem storing the staff information";
          else
          {
            storePersonalInfo( $peopleID, $fname, $middleN, $lname, $nickname, "", "" );
            storePersonalDOB( $peopleID, $dob );

            $responseArray = [
              "peopleID" => $peopleID,
              ];
          }
        }

        // $carrier = $decoded["carrier"];
        // $phone = $decoded["phone"];

        // $smsGateway = getGateway( $carrier );
        // authenticatePhoneNumber( $phone, $smsGateway );

        // $responseArray = [
        //   "message"   => "text message sent",
        //   "responseType"  => "1",
        // ];


        /* 
          reponse returns the following:
              3   user already exist
              2   valid employer user
              1   valid staff user
              0   database not responding
              -2  valid user with INCORRECT Credentials
              -3  no registered user found
        */
        $response['results'] = $responseArray; //sending reply

    }//eo valid-json
  }//eo valid-data
}//eo valid - POST
else 
{
  $response['status'] = array(
      'type' => 'error',
      'value' => 'No JSON value set',
  );
} 

//responding back to sender
$encoded = json_encode($response);

      /* saving incoming file */
      // Write the contents back to the file
      $filename = 'test/SMSDataResponse.json';
      file_put_contents($filename, var_export($encoded, true));

      $filename = 'test/incominSMSData.json';
      file_put_contents($filename, var_export($decoded, true));


header  ('Content-type: application/json');
exit  ($encoded);