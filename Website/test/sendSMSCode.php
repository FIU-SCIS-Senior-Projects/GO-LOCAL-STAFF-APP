<?php  


$url = 'http://localhost:8888/FIU%20CLASSES/Senior%20Project%20Stuff/Final%20Deliverables/GO-LOCAL-STAFF-APP/Website/jsonPOST_smsCode.php';

//LIVE
// $url = 'http://45.55.208.175/Website/jsonPOST_smsCode.php';


//Initiate cURL.
$ch = curl_init($url);

    //valid staff user
    $jsonData = [
      "registrationType"  => "Staff",
      "userID" => "4",
      "code" => "5850"
      ];

    // //valid staff user
    // $jsonData = [
    //   "registrationType"  => "Employer"
    //   "userID" => "1",
    //   "code" => "8997"
    //   ];

 
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