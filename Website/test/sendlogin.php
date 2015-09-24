<?php  


// API Url
// $url = 'http://localhost:8888/FIU%20CLASSES/Senior%20Project%20Stuff/Final%20Deliverables/GO-LOCAL-STAFF-APP/Website/jsonPOST_login.php';

$url = 'http://45.55.208.175/Website/jsonPOST_login.php';
 
//Initiate cURL.
$ch = curl_init($url);
 
/*The JSON data */
    // //valid invalid staff user
    // $jsonData = array(
    //     'username' => 'Luoandre29',
    //     'email'    => 'luoandre29@yahoo.com',
    //     'password' => 'password'
    // );

    //valid staff user
    $jsonData = array(
        'username' => 'Luoandre29Uno',
        'email' => 'luoandre29@yahoo.com',
        'password' => 'passwordUno'
    );


   // valid invalid employer user
   //  $jsonData = array(
   //      'username' => 'Luoandre29Dos',
   //      'email' => 'lcast03@fiu.edu',
   //      'password' => 'password'
   //  );


   // //valid employer user
   //  $jsonData = array(
   //      'username' => 'Luoandre29Dos',
   //      'email' => 'lcast03@fiu.edu',
   //      'password' => 'passwordDos'
   //  );
 
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




// //direct test
// /* communicate to database */
//  require '../webAPI.php';

//  echo "<p>testing valid staff</p>\n";
//  $results = loginRegisteredUser("Luoandre29","luoandre29@yahoo.com","passwordUno");//staff user
//  echo $results."\n";

//  echo "<p> - - - - - - - - - - - - </p>\n";
//  echo "<p>testing invalid staff</p>\n";
//  $results = loginRegisteredUser("Luoandre","luoandre@yahoo.com","password123");//staff user
//  echo $results;

//  echo "<p>**********************</p>";
//  echo "<p>testing valid employer</p>";
//  $results = loginRegisteredUser("Luoandre29Dos","lcast053@fiu.edu","passwordDos");//employer user
//  echo $results;

//  echo "<p> - - - - - - - - - - - - </p>";
//  echo "<p>testing invalid employer</p>";
//  $results = loginRegisteredUser("Luoandre29Dos","lcast053@fiu.edu","password123");//employer user
//  echo $results;


?>