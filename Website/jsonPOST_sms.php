<?php

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
      require 'API.php';/* adding API */

      $peopleID;
      $responseArray;

      $registrationType = $decoded["registrationType"];
      $username         = $decoded["username"];
      $email            = $decoded["email"];
      $phone            = $decoded["phone"];

        // echo "<p>registration Type: $registrationType</p>";//testing

        //verify user is unique
      $uniqueResult = isUserRegistrationUnique($registrationType, $username, $email);
        echo "<p>should we register this user? $uniqueResult</p>";//testing
      if($uniqueResult == 1)
      {
        //saving user initial information
        $userID = storeUserCredentials( $registrationType, $decoded );
        echo "<p> userID: $userID</p>";//testing
        if($userID > 0)
        {
        //authenticating phone number
          $phoneResult = authenticateUserPhoneNumber($registrationType, $userID, $phone );
        echo "<p> authentication results $phoneResult</p>";//testing
          if($phoneResult > 0)
          {
            $responseArray = [ 
            "message" => "phone number code successfully sent",
            "responseType" => $phoneResult,
            "userID" => $userID,
            ];
          }
          else if($phoneResult == 0)
          {
            $responseArray = [
            "message" => "database not responding",
            "responseType" => $phoneResult,
            ];
          }
          else if($phoneResult == -4)
          {
            $responseArray = [
            "message" => "Unable to store the code to the Database",
            "responseType" => $phoneResult,
            ];
          }
        }
        else if($userID == 0)
        {
          $responseArray = [
          "message" => "database not responding",
          "responseType" => $userID,
          ];
        }
        else if($userID == -2)
        {
          $responseArray = [
          "message" => "Unable to store staff credentials",
          "responseType" => $userID,
          ];
        }
        else if($userID == -3)
        {
          $responseArray = [
          "message" => "Unable to retrieve userID",
          "responseType" => $userID,
          ];
        }
      }
      else if($uniqueResult == 0)
      {
        $responseArray = [
        "message" => "database not responding",
        "responseType" => $uniqueResult,
        ];
      }
      else if($uniqueResult == -1)
      {
        $responseArray = [
        "message" => "Username or Email already exist",
        "responseType" => $uniqueResult,
        ];
      }
      else if($uniqueResult == -10)
      {
        $responseArray = [
        "message" => "not a valid registration type",
        "responseType" => $uniqueResult,
        ];
      }    

        /* 
          reponse returns the following:
              1   phone number code successfully sent
              0   database not responding
              -1  Username or Email already exist
              -2  no registered user found
              -3  Unable to retrieve peopleID
              -4  Unable to store the code to the Database
              -10 not a valid registration type
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

$filename = 'test/SMSDataincoming.json';
file_put_contents($filename, var_export($decoded, true));


header  ('Content-type: application/json');
exit  ($encoded);
