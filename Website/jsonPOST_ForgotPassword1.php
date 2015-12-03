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
      $phone            = $decoded["phone"];

      //check if user exist with phone number provided
      $userExist  = UserWithPhoneProvidedExist($phone);
      if($userExist == 0)
      {
        $responseArray = [
        "message" => "database not responding",
        "responseType" => $userExist,
        "part" => "1"
        ];
      }
      else if($userExist == -1)
      {
        $responseArray = [
        "message" => "No Username or Email exist with the information provided",
        "responseType" => $userExist,
        "part" => "1"
        ];
      }   
      else if($userExist)
      {
          //sending user SMS code
          $smsSendResults = sendSMSForgotPasswordCode($userExist);
          if($smsSendResults)
          {
            $user  =  $smsSendResults['userID'];
            $userKey  =  $smsSendResults['userKey'];

            $responseArray = [ 
            "message" => "phone number code successfully sent",
            "responseType" => "1",
            "userID" => $user,
            "userKey" => $userKey,
            "part" => "1"
            ];
          }
          else if($smsSendResults == 0)
          {
            $responseArray = [
            "message" => "database not responding",
            "responseType" => $smsSendResults,
            "part" => "1"
            ];
          }
          else if($smsSendResults == -2)
          {
            $responseArray = [
            "message" => "Unable to save changes to Database",
            "responseType" => $smsSendResults,
            "part" => "1"
            ];
          }
      }


        /* 
          reponse returns the following:
              1   phone number code successfully sent
              0   database not responding
              -1  No Username or Email exist with the information provided 
              -2  Unable to save changes to Database
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

header  ('Content-type: application/json');
exit  ($encoded);
