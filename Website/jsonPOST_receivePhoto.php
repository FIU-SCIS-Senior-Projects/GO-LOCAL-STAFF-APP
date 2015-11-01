<?php


          require 'API.php';/* adding API */


          echo "<p></p>";
          echo "<p></p>";
          echo "<p>Received:</p>";
          print_r($decoded);

          // $registrationType = $decoded['registrationType'];
          // $userID           = $decoded['ID'];
          // $image            = $decoded['image'];
          // $name             = $decoded['name'];

          // $target_file      = getcwd();
          // $target_file      = $target_file."/uploads/";
          // $target_file      = $target_file.basename($name);  

          // //testing
          // echo "<p>registrationType: $registrationType</p>";
          // echo "<p>userID: $userID</p>";
          // echo "<p>image: $image</p>";
          // echo "<p>name: $name</p>";
          // echo "<p>target_file: $target_file</p>";


          // // $myparam          = $_POST['userfile'];     //getting image Here
          // // $mytextLabel      = $_POST['filenames']   //getting textLabe Here
          
          // // echo $myparam;
          // // echo $mytextLabel; 

 
          // if(move_uploaded_file($image, $target_file)) 
          // {
          //     echo "The file ". basename($name) . " has been uploaded";
          // } 
          // else 
          // {
          //     echo "There was an error uploading the file, please try again!";
          // }

          // $registrationType = $decoded['registrationType'];

          // $registrationResults = registerUser($registrationType, $decoded);

          // if($registrationResults > 0 )
          // {
          //   $responseArray = array(
          //   "message" => "user successfully registered",
          //   "responseType"    => 1,
          //   "userID" => $registrationResults
          //   );
          // }
          // else if( $registrationResults == 0 )
          // {
          //   $responseArray = array(
          //   "message" => "database not responding",
          //   "responseType"    => $registrationResults,
          //   );
          // }
          // else if( ($registrationResults == -1) || ($registrationResults == -2) )
          // {
          //   $responseArray = array(
          //   "message" => "unable to register user",
          //   "responseType"    => $registrationResults,
          //   );
          // }
          // else if($registrationResults == -10)
          // {
          //   $responseArray = array(
          //   "message" => "invalid registration type",
          //   "responseType"    => $registrationResults,
          //   );
          // }

          /* 
          reponse returns the following:
            1   successfully register
            0   database not responding
            -1  Unable to register user
            -10 invalid registration type
          */
          // $response['results'] = $responseArray;
            $response['results'] = $decoded;



  //responding back to sender
  $encoded = json_encode($response);


      /* saving incoming file */
        // Write the contents back to the file
        $filename = 'test/receivePhotoDataResponse.json';
        file_put_contents($filename, var_export($encoded, true));

        $filename = 'test/receivePhotoDataIncoming.json';
        file_put_contents($filename, var_export($decoded, true));


  // header  ('Content-type: application/json');
  exit  ($encoded);
