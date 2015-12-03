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

        $responseArray;
        $registrationType = $decoded["registrationType"];
        $userID           = $decoded["userID"];
        $codeFromUser     = $decoded["code"];
        $phone            = $decoded["phone"];

        $smsResults = verifySmsCode($registrationType, $userID, $codeFromUser, $phone);
        // echo "<p>results: $smsResults</p>";
        if( $smsResults == 1) //phone has been verified
        {
          $responseArray = [
            "message" => "verification code verified & db updated",
            "responseType" => $smsResults,
            ];
        }
        else if( $smsResults == 0)
        {
          //unable to verify the phone.
          $responseArray = [
            "message" => "unable to connect to DB",
            "responseType" => $smsResults,
            ];
        }
        else if($smsResults == -1)
        {
          //unable to verify the phone.
          $responseArray = [
            "message" => "no such user with info provided",
            "responseType" => $smsResults,
            ];
        }
         else if($smsResults == -2)
        {
          //unable to verify the phone.
          $responseArray = [
            "message" => "user exist with info provided BUT error occurred while update DB",
            "responseType" => $smsResults,
            ];
        }
        else if($smsResults == -3)
        {
          //unable to verify the phone.
          $responseArray = [
            "message" => "user exist with info provided BUT error occurred while update DB",
            "responseType" => $smsResults,
            ];
        }
        else if($smsResults == -10)
        {
          //unable to verify the phone.
          $responseArray = [
            "message" => "not a valid registration Type",
            "responseType" => $smsResults,
            ];
        }


        /* 
          reponse returns the following:
            1   verification code verified & db updated
            0   unable to connect to DB
            -1  no such user with info provided
            -2  user exist with info provided BUT error occurred while update DB
            -3  verification process previously performed, ignoring this request
            -10 not a valid registration Type
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
