<?php

$localTesting = false;
$testingStaffUser = false;

if($localTesting)
{
  
  //lu links
  $url_sendSMS              = 'http://localhost:8888/FIU%20CLASSES/Senior%20Project%20Stuff/Final%20Deliverables/GO-LOCAL-STAFF-APP/Website/jsonPOST_sms.php';
  $url_sendSMSCode          = 'http://localhost:8888/FIU%20CLASSES/Senior%20Project%20Stuff/Final%20Deliverables/GO-LOCAL-STAFF-APP/Website/jsonPOST_smsCode.php';
  $url_sendMaleRegistration = 'http://localhost:8888/FIU%20CLASSES/Senior%20Project%20Stuff/Final%20Deliverables/GO-LOCAL-STAFF-APP/Website/jsonPOST_registration.php';
  $url_sendLogin            = 'http://localhost:8888/FIU%20CLASSES/Senior%20Project%20Stuff/Final%20Deliverables/GO-LOCAL-STAFF-APP/Website/jsonPOST_login.php';


  // //wil links
  // $url_sendSMS = ' ';
  // $url_sendSMSCode = '';
  // $url_sendMaleRegistration = '';
  // $url_sendLogin = '';

}
else
{
  //sending json
  $url_sendSMS = 'http://45.55.208.175/Website/jsonPOST_sms.php';
  $url_sendSMSCode = 'http://45.55.208.175/Website/jsonPOST_smsCode.php';
  $url_sendMaleRegistration = 'http://45.55.208.175/Website/jsonPOST_registration.php';
  $url_sendLogin = 'http://45.55.208.175/Website/jsonPOST_login.php';


}

?>
