<?php
 
include '../urlsettings.php';

//Initiate cURL.
$ch = curl_init($url_sendMaleRegistration);
 
$jsonData = array (

    'staffID' => '1',
    'registrationType' => 'Staff',
    'firstName' => 'Luis',
    'middleName' => 'a', 
    'lastName' => 'Castillo',
    'nickName' => 'Lu',
    'username' => 'Luoandre29',
    'password' => 'poiuytrewq',
    'email' => 'Luoandre29@yahoo.com',
    'dob' => '08-09-1994',
    'cellphone' => '3056099250',
    'address' => '2710 W 64 PL Miami FL 33016',
    'city' => 'Miami',
    'state' => 'FL',
    'zipcode' => '33016',
    'ethnicity' => 'Latino or Hispanic American',
    'ethnicityCode' => '2',
    'languages' => 'English Spanish Italian',
    'experience' => 
    array (
    ),
    'tshirtSize' => 'M',
    'Tattoos' => '0',
    'eyeColor' => 'Brown',
    'hairColor' => 'Black',
    'Piercings' => '0',
    'height' => '5\'5"',
    'weight' => '150',  
    'gender' => 'Male',
    'genderType' => '1',
    'pantSize' => '30',
    'shoeSize' => '9.5',
    'commercialLicense' => '0',
    'driverLicense' => '0',
    'travelPercentage' => '25',
    'Incorporated' => '0',
    'ssn' => '1234567890', 
    'ProfessionalInsurance' => '0',  
    'desiredHourlyRate' => '30',
    'desiredWeeklyRate' => '3000',
    'DirectDeposit' => '0',
    'DirectDepositRoutingNumber' => ' ',
    'DirectDepositAccountNumber' => ' ',
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