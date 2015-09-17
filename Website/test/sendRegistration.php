<?php
 
//API Url
// $url = 'http://localhost:8888/FIU%20CLASSES/Senior%20Project%20Stuff/Final%20Deliverables/GO-LOCAL-STAFF-APP/Website/jsonPOST_registration.php';

// // $url = 'http://45.55.208.175/Website/jsonReceiver.php';
 
// //Initiate cURL.
// $ch = curl_init($url);
 
//The JSON data.
$jsonData = array(
    'registration_type' => 'staff',
    'firstName' => 'Luis',
    'middleName' => 'Andres',
    'lastName' => 'Castillo',
    'nickname' => 'Lu',
    'username' => 'Luoandre29',
    'email' => 'luoandre29@hotmail.com',
    'password' => 'password123',
    'cellphone' => '3056099250',
    'address' => '2710 W 64 PL',
    'city' => 'Miami',
    'state' => 'FL',
    'djSelected' => '1',
    'liveBandSelected' => '0',
    'djSelected' => '0',
    'cateringCompanySelected' => '0',
    'otherServices' => '0',
    'djDescription' => 'djDescription',
    'djWebsite' => 'url',
    'djSocialMedia' => 'MyPassword',
    'djDescription' => 'Description',
    'djWebsite' => 'url',
    'djSocialMedia' => 'social media',
    'liveBandDescription' => 'Description',
    'liveBandWebsite' => 'url',
    'liveBandSocialMedia' => 'social media',
    'cateringCompanyDescription' => 'Description',
    'cateringCompanyWebsite' => 'url',
    'cateringCompanySocialMedia' => 'social media',
    'otherServicesDescription' => 'Description',
    'otherServicesBandWebsite' => 'url',
    'otherServicesBandSocialMedia' => 'social media',
    'dob' => '11/29/87',
    'gender' => 'male',
    'languages' => 'english,spanish',
    'ethnicity' => '3',
    'typeOfLicense' => '0',
    'height' => '5.4',
    'weight' => '150',
    'hairColor' => 'black',
    'eyeColor' => 'brown',
    'pantSize' => '30',
    'shoeSize' => '7',
    'tshirtSize' => 'M',
    'desiredHourlyRate' => '25',
    'desiredWeeklyRate' => '2500',
    'tattoos' => '0',
    'piercings' => '0',
    'chestSize' => 'null',
    'waistSize' => 'null',
    'dressSize' => 'null',
    'ssn' => '67988433',
    'ein' => 'null',
    'citiesWillingToWork' => 'Miami, Kendall',
    'travel' => '1',
    'professionalInsurance' => '0',
    'directDepositDesired' => '1',
    'DirectDepositRoutingNumber' => '777899231',
    'DirectDepositAccountNumber' => '998763229938',
    'isModel' => '0',
    'isBrandAmbassador' => '0',
    'isFlyerDistributor' => '0',
    'isFieldMarketingManager' => '0',
    'isDancer' => '0',
    'iswaiterOrWaitress' => '0',
    'isProductionAssistant' => '0',
    'isSalesExecutive' => '1'
);
 
// //Encode the array into JSON.
// $jsonDataEncoded = json_encode($jsonData);
 
// echo "<p>sending the following JSON:</p>";
// print_r($jsonDataEncoded);

// //Tell cURL that we want to send a POST request.
// curl_setopt($ch, CURLOPT_POST, 1);
 
// //Attach our encoded JSON string to the POST fields.
// curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonDataEncoded);
 
// //Set the content type to application/json
// curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json')); 
 
// //Execute the request
// echo "<p></p>";
// echo "<p></p>";
// echo "<p>JSON POST Response:</p>";
// $result = curl_exec($ch);


    $username = $jsonData['username'];
    $email    = $jsonData['email'];
    $password = $jsonData['password'];


// direct test
/* communicate to database */
 include '../webAPI.php';
 $registrationType = $jsonData['registration_type'];
 if( $registrationType == 'staff')
 {

    echo "<p> registering $registrationType </p>";
    //check if unique user
    $uniqueResults = isUniqueRegisteredStaff("luoandre29", "luoandre29@hotmail.com");
     echo "<p>response '$uniqueResults' </p>";
    if($uniqueResults ==  1)//unique user
    {
        echo "<p>unique user! lets start registration process </p>";
        $registrationResults = registerStaff($jsonData);
        echo "<p>registration results $registrationResults</p>";

        $responseArray = array(
            "message" => "user successfully registered",
            "usertype"    => "1",
        );
    }
    else if($uniqueResults == -1)//user already registered
    {
      echo "<p>user already registered</p>";
      $responseArray = array(
        "message" => "username and email is NOT unique",
        "usertype"    => "-1",
      );
    }
    else if($uniqueResults == 0)//database not responding
    {
      $responseArray = array(
        "message" => "database not responding",
        "usertype"    => "0",
      );
    }//eo-conditions


 }//eo staff registration
 else if( $registrationType == 'employer' )
 {
    echo "<p>  registering '$registrationType' </p>";
 }//eo employer registration



    /*
        reponse returns the following:
            0   database not responding
            -1  user already registered
    */
    $response['results'] = $responseArray; //sending reply



?>