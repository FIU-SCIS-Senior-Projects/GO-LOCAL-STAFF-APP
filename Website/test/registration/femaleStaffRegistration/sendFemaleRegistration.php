
<?php
 
include '../../urlsettings.php';

//Initiate cURL.
$ch = curl_init($url_sendFemaleRegistration);
    
     $experience = array(
        "Brand Ambassador",
        "Model"
    );

  $jsonData = array (
    'staffID' => '2',
    'DirectDeposit' => '0',
    'DirectDepositAccountNumber' => ' ',
    'DirectDepositRoutingNumber' => ' ',
    'Incorporated' => '0',
    'Piercings' => '1',
    'ProfessionalInsurance' => '0',
    'Tattoos' => '0',
    'address' => '2394 SW 26 St Miami FL 33133',
    'chestSize' => '1',
    'city' => 'Miami',
    'commercialLicense' => '0',
    'desiredHourlyRate' => '35',
    'desiredWeeklyRate' => '4000',
    'dressSize' => '1',
    'driverLicense' => '0',
    'ethnicity' => 'Latino or Hispanic American',
    'ethnicityCode' => '3',
    'experience' => $experience,
    'eyeColor' => 'Brown',
    'gender' => 'Female',
    'genderType' => '0',
    'hairColor' => 'Black',
    'height' => "5'3\"",
    'hipsSize' => '1',
    'languages' => 'Spanish English',
    'pantSize' => '4',
    'registrationType' => 'Staff',
    'shoeSize' => '7.5',
    'ssn' => '65472514',
    'state' => 'FL',
    'travelPercentage' => '25',
    'tshirtSize' => 'S',
    'waistSize' => '1',
    'weight' => '145',
    'zipcode' => '33133',
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