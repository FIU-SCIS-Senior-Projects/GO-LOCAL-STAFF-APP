<?php
// echo file_get_contents('php://input');
$testing = false;

  //making sure its  valid POST request
 if( $_SERVER["REQUEST_METHOD"] == "POST" )
  {
    //getting php post body data
    $jsondata = file_get_contents('php://input');
    if ($jsondata) {
  
      //cleaing json data
      $cleanJSONData = stripslashes($jsondata);

      //converting json to php array
      $decoded = json_decode($cleanJSONData, true);
      
      //not a valid json value found
      if (is_null ($decoded)) 
      {
        $response['status'] = array  (
          'type' => 'error',
          'value' => 'Invalid JSON value found',
        );
        $response['request'] = $jsondata;
      }
      else  //valid json values found
      {

        // require_once 'webAPI.php';
        // LogInServer();
        // registerStaff();


        //code will go here



        $response['status'] = array  
        (
          'type' => 'message',
          'value' => 'Valid JSON value found',
        );

        //Send the original message back.
        $response['request'] = $decoded;
      }
    }


    if($testing)
    {
      echo "<p>POST data:</p>";//testing  
      print_r($_SERVER);//testing
      echo "<p></p>";//testing
      echo "<p>POST body:</p>";//testing
      echo $jsondata;//testing
      echo "<p></p>";//testing
      echo "<p>POST body clean data</p>";//testing
      echo $cleanJSONData;
      echo "<p></p>";
      echo "<p>JSON data decoded</p>";//testing
      print_r($decoded);
      echo "<p></p>";
    }

  }
  else {
    $response['sta
    tus'] = array  (
      'type' => 'error',
      'value' => 'No JSON value set',
    );
  }

  $encoded = json_encode  ($response);

    /*saves the json list to a local json file*/
          $file = 'StaffRegistrationSampleIncomingData.json';

          // Open the file to get existing content
          $current = file_get_contents($file);

          // Append a json list to the file
          $current .= $encoded;

          // Write the contents back to the file
          $writeResult = file_put_contents($file, $encoded);
          if($writeResult === FALSE){
            echo "error writing json list to json file";
          }
  

  header  ('Content-type: application/json');
  exit  ($encoded);

//http ://example.com/json.php?json={"a":1,"b":2,"c":3,"d":4,"e":5} 

//http://eosrei.net/articles/2011/12/basic-json-requestresponse-php
