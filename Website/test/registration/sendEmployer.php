<?php  

include '../urlsettings.php';

//Initiate cURL.
$ch = curl_init($url_sendEmployerRegistration);
 
/*The JSON data */

    //valid staff user
    $jsonData = array(
    	'registrationType' => 'Employer',
        'employerID' => '1',
        'employerName' => 'Microsoft',
        'typeOfEmployer' => 'Software',
        'address' => '1 Microsoft Way',
        'city' => 'Redmond',
        'state' => 'Washington',
        'zipCode' => '98052',
        'hasInsurance' => '1',
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