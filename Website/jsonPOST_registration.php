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

          $registrationType = $decoded['registrationType'];

          $registrationResults = registerUser($registrationType, $decoded);

          if($registrationResults > 0 )
          {
            $responseArray = array(
            "message" => "user successfully registered",
            "responseType"    => $registrationResults,
            );
          }
          else if( $registrationResults == 0 )
          {
            $responseArray = array(
            "message" => "database not responding",
            "responseType"    => $registrationResults,
            );
          }
          else if( ($registrationResults == -1) || ($registrationResults == -2) )
          {
            $responseArray = array(
            "message" => "unable to register user",
            "responseType"    => $registrationResults,
            );
          }
          else if($registrationResults == -10)
          {
            $responseArray = array(
            "message" => "invalid registration type",
            "responseType"    => $registrationResults,
            );
          }

          /* 
          reponse returns the following:
            1   successfully register
            0   database not responding
            -1  Unable to register user
            -10 invalid registration type
          */
          $response['results'] = $responseArray;

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

	// echo getcwd();

      /* saving incoming file */
        // Write the contents back to the file
        $filename = 'test/registration/RegistrationDataResponse.json';
        file_put_contents($filename, var_export($encoded, true));

        $filename = 'test/registration/RegistrationDataIncoming.json';
        file_put_contents($filename, var_export($decoded, true));


  header  ('Content-type: application/json');
  exit  ($encoded);
