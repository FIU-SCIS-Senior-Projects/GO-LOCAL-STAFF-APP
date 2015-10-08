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
        $fname            = $decoded["firstName"];
        $middleN          = $decoded["middleName"];
        $lname            = $decoded["lastName"];
        $nickname         = $decoded["nickName"];
        $email            = $decoded["email"];
        $username         = $decoded["username"];
        $pasword          = $decoded["password"];
        $dob              = $decoded["dob"];
        $carrier          = $decoded["carrier"];
        $phone            = $decoded["phone"];

        if( $registrationType == "Staff")
        {
            //verify user is unique
            $uniqueResult = isUniqueRegisteredStaff($username,$email);
            if($uniqueResult == 1)
            {
                //User doens't exist. Let's add him/her to the DB
                $peopleID = storeStaffCredentials( $username, $password, $email );
                echo "<p> peopleID: $peopleID</p>";
                if($peopleID > 0)
                {
                   $phoneResult = authenticateStaffPhoneNumber( $peopleID, $phone );
                   if($phoneResult > 0)
                   {
                      $responseArray = [
                        "message" => "phone number code successfully sent",
                        "responseType" => $phoneResult,
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
                else if($peopleID == 0)
                {
                  $responseArray = [
                    "message" => "database not responding",
                    "responseType" => $peopleID,
                  ];
                }
                else if($peopleID == -2)
                {
                  $responseArray = [
                    "message" => "Unable to store staff credentials",
                    "responseType" => $peopleID,
                  ];
                }
                else if($peopleID == -3)
                {
                  $responseArray = [
                    "message" => "Unable to retrieve peopleID",
                    "responseType" => $peopleID,
                  ];
                }
            }
            else if($uniqueResult == 0)
            {
              $responseArray = [
                "message" => "database not responding",
                "responseType" => "0",
              ];
            }
            else if($uniqueResult == -1)
            {
              $responseArray = [
                "message" => "Username or Email already exist",
                "responseType" => "-1",
              ];
            }
        }
        else if( $registrationType == "Employer")
        {
            //verify user is unique
            $uniqueResult = isUniqueRegisteredEmployer($username,$email);
            if($uniqueResult == 1)
            {
              //User doens't exist. Let's add him/her to the DB
              $peopleID = storeStaffCredentials($username,$password,$email);
              echo "<p> peopleID: $peopleID</p>";
              if($peopleID > 0)
              {
                $phoneResult = authenticateStaffPhoneNumber( $peopleID, $phone );
                if($phoneResult > 0)
               {
                  $responseArray = [
                    "message" => "phone number code successfully sent",
                    "responseType" => $phoneResult,
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
              else if($peopleID == 0)
              {
                $responseArray = [
                  "message" => "database not responding",
                  "responseType" => $peopleID,
                ];
              }
              else if($peopleID == -2)
              {
                $responseArray = [
                  "message" => "Unable to store staff credentials",
                  "responseType" => $peopleID,
                ];
              }
              else if($peopleID == -3)
              {
                $responseArray = [
                  "message" => "Unable to retrieve peopleID",
                  "responseType" => $peopleID,
                ];
              }
            }
            else if($uniqueResult == 0)
            {
              $responseArray = [
                "message" => "database not responding",
                "responseType" => "0",
              ];
            }
            else if($uniqueResult == -1)
            {
              $responseArray = [
                "message" => "Username or Email already exist",
                "responseType" => "-1",
              ];
            }        
        }
        else
        {
              $responseArray = [
                "message" => "not a valid registration type",
                "responseType" => "-10",
              ];
        }


        //     storePersonalInfo( $peopleID, $fname, $middleN, $lname, $nickname, "", "" );
        //     storePersonalDOB( $peopleID, $dob );
     
      
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
