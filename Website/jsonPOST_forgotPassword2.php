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

      //update reset password
      $resetPasswordResults  = forgotPassword($decoded);
      if($resetPasswordResults == 1)
      {
        $responseArray = [
        "message" => "successfully changed password",
        "responseType" => $resetPasswordResults,
        "part" => "2"
        ];
      }
      else if($resetPasswordResults == 0)
      {
        $responseArray = [
        "message" => "database not responding",
        "responseType" => $resetPasswordResults,
        "part" => "2"
        ];
      }
      else if( ($resetPasswordResults == -1) || ($resetPasswordResults == -2) )
      {
        $responseArray = [
        "message" => "Unable to store changes to Database",
        "responseType" => $resetPasswordResults,
        "part" => "2"
        ];
      }   
        /* 
          reponse returns the following:
              1   successfully changed password
              0   database not responding
              -1  Unable to store changes to Database 
              -2  Unknown error happen
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
