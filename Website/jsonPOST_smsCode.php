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

        $responseArray;

        $peopleID = $decoded["peopleID"];
        $codeFromUser = $decoded["code"];

        if( verifySmsCode($peopleID, $codeFromUser) )
        {
          //phone has been verified
          $responseArray = [
            "message" => "Phone number has been verified",
            "responseType" => "4",
            ];
        }
        else
        {
          //unable to verify the phone.
          $responseArray = [
            "message" => "Invalid code",
            "responseType" => "-4",
            ];
        }

        /* 
          reponse returns the following:
              4   valid phone number
              3   user already exist
              2   valid employer user
              1   valid staff user
              0   database not responding
              -2  valid user with INCORRECT Credentials
              -3  no registered user found
              -4  invalid phone number
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
