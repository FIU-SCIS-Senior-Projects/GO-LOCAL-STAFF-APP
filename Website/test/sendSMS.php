<?php  

include 'urlsettings.php';

//Initiate cURL.
$ch = curl_init($url_sendSMS);

    // //valid staff user
    // $jsonData = [
    //   "firstName" => "Wilfredo",
    //   "middleName" => "G",
    //   "lastName" => "Gomez",
    //   "nickName" => "watermelon",
    //   "email" => "willyggh@outlook.com",
    //   "username" => "willyggh",
    //   "password" => "123",
    //   "dob" => "04/16/1989",
    //   "phone" => "7862948736",
    //   "carrier" => "att",
    //   ];


      //valid staff user
    $jsonData = [
      "registrationType" => "Staff",
      "firstName" => "Luis",
      "middleName" => "A",
      "lastName" => "Castillo",
      "nickName" => "Lu",
      "email" => "luoandre29@outlook.com",
      "username" => "luoandre29",
      "password" => "0987654321",
      "dob" => "11/29/1987",
      "phone" => "3056099250"
      ];

 
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
