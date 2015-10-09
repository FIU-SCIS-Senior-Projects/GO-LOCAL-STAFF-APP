<?php
 
include 'urlsettings.php';

 
// //Initiate cURL.
$ch = curl_init($url_sendMaleRegistration);
 
// //The JSON data.
// $jsonData = array(
//     'registrationType' => 'staff',
//     'firstName' => 'Luis',
//     'middleName' => 'Andres',
//     'lastName' => 'Castillo',
//     'nickname' => 'Lu',
//     'username' => 'Luoandre29',
//     'email' => 'luoandre29@hotmail.com',
//     'password' => 'password123',
//     'cellphone' => '3056099250',
//     'address' => '2710 W 64 PL',
//     'city' => 'Miami',
//     'state' => 'FL',
//     'djSelected' => '1',
//     'liveBandSelected' => '0',
//     'djSelected' => '0',
//     'cateringCompanySelected' => '0',
//     'otherServices' => '0',
//     'djDescription' => 'djDescription',
//     'djWebsite' => 'url',
//     'djSocialMedia' => 'MyPassword',
//     'djDescription' => 'Description',
//     'djWebsite' => 'url',
//     'djSocialMedia' => 'social media',
//     'liveBandDescription' => 'Description',
//     'liveBandWebsite' => 'url',
//     'liveBandSocialMedia' => 'social media',
//     'cateringCompanyDescription' => 'Description',
//     'cateringCompanyWebsite' => 'url',
//     'cateringCompanySocialMedia' => 'social media',
//     'otherServicesDescription' => 'Description',
//     'otherServicesBandWebsite' => 'url',
//     'otherServicesBandSocialMedia' => 'social media',
//     'dob' => '11/29/87',
//     'gender' => 'male',
//     'languages' => 'english,spanish',
//     'ethnicity' => '3',
//     'typeOfLicense' => '0',
//     'height' => '5.4',
//     'weight' => '150',
//     'hairColor' => 'black',
//     'eyeColor' => 'brown',
//     'pantSize' => '30',
//     'shoeSize' => '7',
//     'tshirtSize' => 'M',
//     'desiredHourlyRate' => '25',
//     'desiredWeeklyRate' => '2500',
//     'tattoos' => '0',
//     'piercings' => '0',
//     'chestSize' => 'null',
//     'waistSize' => 'null',
//     'dressSize' => 'null',
//     'ssn' => '67988433',
//     'ein' => 'null',
//     'citiesWillingToWork' => 'Miami, Kendall',
//     'travel' => '1',
//     'professionalInsurance' => '0',
//     'directDepositDesired' => '1',
//     'DirectDepositRoutingNumber' => '777899231',
//     'DirectDepositAccountNumber' => '998763229938',
//     'isModel' => '0',
//     'isBrandAmbassador' => '0',
//     'isFlyerDistributor' => '0',
//     'isFieldMarketingManager' => '0',
//     'isDancer' => '0',
//     'iswaiterOrWaitress' => '0',
//     'isProductionAssistant' => '0',
//     'isSalesExecutive' => '1'
// );
 
$jsonData = array (
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
    'languages' => 'English Spanish ',
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