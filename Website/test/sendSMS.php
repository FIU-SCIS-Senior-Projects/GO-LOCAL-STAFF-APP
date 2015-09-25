<?php  


// API Url
// $url = 'http://localhost:8888/FIU%20CLASSES/Senior%20Project%20Stuff/Final%20Deliverables/GO-LOCAL-STAFF-APP/Website/jsonPOST_login.php';

$url = 'http://45.55.208.175/Website/jsonPOST_sms.php';

  //$url = "http://localhost/GO-LOCAL-STAFF-APP/Website/jsonPOST_sms.php";
 
//Initiate cURL.
$ch = curl_init($url);

    //valid staff user
    $jsonData = [
      "firstName" => "Wilfredo",
      "middleName" => "G",
      "lastName" => "Gomez",
      "nickName" => "watermelon",
      "email" => "willyggh@outlook.com",
      "username" => "willyggh",
      "password" => "123",
      "dob" => "04/16/1989",
      "phone" => "7862948736",
      "carrier" => "att",
      ];


   // valid invalid employer user
   //  $jsonData = array(
   //      'username' => 'Luoandre29Dos',
   //      'email' => 'lcast03@fiu.edu',
   //      'password' => 'password'
   //  );


   // //valid employer user
   //  $jsonData = array(
   //      'username' => 'Luoandre29Dos',
   //      'email' => 'lcast03@fiu.edu',
   //      'password' => 'passwordDos'
   //  );
 
//Encode the array into JSON.
$jsonDataEncoded = json_encode($jsonData);
 
echo "<p>sending the following JSON:</p>";
print_r($jsonDataEncoded);

//Tell cURL that we want to send a POST request.
curl_setopt($ch, CURLOPT_POST, 1);
 
//Attach our encoded JSON string to the POST fields.
curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonDataEncoded);
 
//Set the content type to application/json
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json')); 
 
//Execute the request
echo "<p></p>";
echo "<p></p>";
echo "<p>JSON POST Response:</p>";
$result = curl_exec($ch);


?>