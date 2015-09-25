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
          /* communicate to database */
         require 'webAPI.php';
         $registrationType = $jsonData['registration_type'];
         if( $registrationType == 'staff') //staff registration
         {

            // echo "<p> registering $registrationType </p>";
            // //check if unique user
            // $uniqueResults = isUniqueRegisteredStaff("luoandre29", "luoandre29@hotmail.com");
            //  echo "<p>response '$uniqueResults' </p>";
            // if($uniqueResults ==  1)//unique user
            // {
            //     echo "<p>unique user! lets start registration process </p>";
            //     $registrationResults = registerStaff($jsonData);
            //     echo "<p>registration results $registrationResults</p>";


                

                //updating responce
                $responseArray = array(
                    "message" => "user successfully registered",
                    "usertype"    => "1",
                );
            // }
            // else if($uniqueResults == -1)//user already registered
            // {
            //   echo "<p>user already registered</p>";
            //   $responseArray = array(
            //     "message" => "username and email is NOT unique",
            //     "usertype"    => "-1",
            //   );
            // }
            // else if($uniqueResults == 0)//database not responding
            // {
            //   $responseArray = array(
            //     "message" => "database not responding",
            //     "usertype"    => "0",
            //   );
            // }//eo-conditions
         }//eo staff registration
         else if( $registrationType == 'employer' )//employer registration
         {
            echo "<p>  registering '$registrationType' </p>";
         }//eo employer registration

        //reponding back to sender
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

	echo getcwd();

      /* saving incoming file */
        // Write the contents back to the file
        $filename = 'test/incominRegistrationDataResponse.json';
        file_put_contents($filename, var_export($encoded, true));

        $filename = 'test/incominRegistrationData.json';
        file_put_contents($filename, var_export($decoded, true));


  header  ('Content-type: application/json');
  exit  ($encoded);
