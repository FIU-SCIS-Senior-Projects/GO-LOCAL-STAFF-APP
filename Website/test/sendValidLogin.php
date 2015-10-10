<?php  

include 'urlsettings.php';

//Initiate cURL.
$ch = curl_init($url_sendLogin);
 
/*The JSON data */

    //valid staff user
    $jsonData = array(
        'username' => 'luoandre29',
        'email' => 'luoandre29@outlook.com',
        'password' => '0987654321',
    );

 
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