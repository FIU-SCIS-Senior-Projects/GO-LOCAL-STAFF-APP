<?php  

include '../../urlsettings.php';

//Initiate cURL.
$ch = curl_init($url_sendSMS);

if($testingStaffUser)
{
      //valid staff user
    $jsonData = [
    'dob' => '07-13-1979',
    'email' => 'Asanz_19@hotmail.com',
    'firstName' => 'Andrea',
    'lastName' => 'Castillo',
    'middleName' => '',
    'nickName' => '',
    'password' => 'mnbvcxz',
    'phone' => '3057765855',
    'registrationType' => 'Staff',
    'username' => 'Asanz19',
    ];
}
else
{
        //valid employer user
    $jsonData = [
      'registrationType' => 'Employer',
      'firstName' => 'Stephanie',
      'middleName' => '', 
      'lastName' => 'Chediak',
      'nickName' => 'Mustard',
      'username' => 'Lovesteph97',
      'password' => 'mnbvcxz',
      'email' => 'Lovesteph97@aol.com',
      'dob' => '10-19-1994',
      'phone' => '2392486846',
      ];
}
 
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
