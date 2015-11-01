<?php  

include '../urlsettings.php';

//Initiate cURL.
$ch = curl_init($url_sendTESTSearchTalent);
        
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

  $jsonData =  array (
    'hasTattoos' => 'Either',
    'languages' => 
    array (
      0 => 'English',
    ),
    'hasPhoto' => 'Either',
    'eyeColor' => 'Any',
    'ageTo' => 'Any',
    'ethnicities' => 
    array (
      0 => 'All',
    ),
    'hairColor' => 'Any',
    'ageFrom' => 'Any',
    'hasWebsite' => 'Either',
    'hasPiercings' => 'Either',
    'gender' => 'Any',
    'willingToTravel' => 'Maybe',
  );
    
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
