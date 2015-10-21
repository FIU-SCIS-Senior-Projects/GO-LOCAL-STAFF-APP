<?php  

include '../urlsettings.php';

//Initiate cURL.
$ch = curl_init($url_sendSearchTalent);
        
  //dependant arrays

  $ethnicities = array(
      "Latino or Hispanic American",
      "South Asian or Indian American",
      "Middle Eastern or Arab American"
    );

  $languages = array(
      "English",
      "Spanish",
      "Italian"
    );



  $jsonData = [
    'ageFrom' => "18",
    'ageTo' => "Any",
    //'email' => "luoandre29@outlook.com",
    //'ethnicities' => $ethnicities,
    // 'eyeColor' => "Any",
    'gender' => "Male",
    // 'hairColor' => "Black",
    'hasPhoto' => "Yes",
    'hasPiercings' => "No",
    'hasTattoos' => "Either",
    'hasWebsite' => "Either",
    // 'height' => "5'3\"",
    // 'heightCondition' => "At most",
    // 'languages' => $languages,
    // 'miles' => "10",
    // 'name' => "Luis Castillo",
    // 'phone' => "3056099250",
    // 'talents' => array(
    //   "Catering Company",
    //   "Dancer",
    //   "DJ"
    // ),
    'weight' => "130",
    'weightCondition' => "atleast",
    // 'willingToTravel' => "No",
    // 'zipcode' => "33016" 
    ];

//Encode the array into JSON.
$jsonDataEncoded = json_encode($jsonData);
 
echo "<p>sending the following JSON:</p>";
print_r($jsonDataEncoded);
echo "<p></p>";

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
