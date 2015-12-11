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
          
          $registrationType     = $decoded['registrationType'];
          $registrationResults  = retrieveTermsAgreement($registrationType);
          if($registrationResults)
          {
            $responseArray  = array(
            "message"       => "user successfully registered",
            "responseType"  => 2,
            "agreement"     => $registrationResults
            );
          }
          else if($registrationResults == 0)
          {
            $responseArray  = array(
            "message"       => "database not responding",
            "responseType"  => $registrationResults,
            );
          }
          else if($registrationResults < 0)
          {
            $responseArray  = array(
            "message"       => "unable to retrieve agreements",
            "responseType"  => $registrationResults,
            );
          }


          /* 
            reponse returns the following:
              1   agreement successfully restored
              0   database not responding
              -1  unable to retrieve agreements           
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
