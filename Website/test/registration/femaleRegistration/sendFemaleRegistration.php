
<?php
 
include '../urlsettings.php';

//Initiate cURL.
$ch = curl_init($url_sendFemaleRegistration);
    
     $experience = array(
        "Brand Ambassador",
        "Model"
    );

  $jsonData = array (
    'staffID' => '1',
    'registrationType' => 'Staff',
    'firstName' => 'Stephanie',
    'middleName' => '', 
    'lastName' => 'Chediak',
    'nickName' => 'Mustard',
    'username' => 'Lovesteph97',
    'password' => 'mnbvcxz',
    'email' => 'Lovesteph97@aol.com',
    'dob' => '10-19-1994',
    'phone' => '2392486846',
    'address' => '2680 37th Ave Ne Naples FL 34120',
    'city' => 'Naples',
    'state' => 'FL',
    'zipcode' => '34120',
    'ethnicity' => 'Latino or Hispanic American',
    'ethnicityCode' => '3',
    'languages' => 'English Spanish Italian',
    'experience' => $experience,
    'tshirtSize' => 'S',
    'Tattoos' => '1',
    'eyeColor' => 'Brown',
    'hairColor' => 'Black',
    'Piercings' => '1',
    'height' => '5\'5"',
    'weight' => '120',  
    'gender' => 'Female',
    'genderType' => '0',
    'pantSize' => '6',
    'shoeSize' => '7',
    'chestSize' => '1',
    'dressSize' => '2',
    'hipsSize' => '10',
    'waistSize' => '1',
    'commercialLicense' => '0',
    'driverLicense' => '0',
    'travelPercentage' => '25',
    'Incorporated' => '0',
    'ssn' => '1234567890', 
    'ProfessionalInsurance' => '0',  
    'desiredHourlyRate' => '20',
    'desiredWeeklyRate' => '2000',
    'DirectDeposit' => '1',
    'DirectDepositRoutingNumber' => '1234567890',
    'DirectDepositAccountNumber' => '0987654321',
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