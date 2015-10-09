<?php

$testing = true;

if($testing)
{
  $url_sendSMS = 'http://localhost:8888/FIU%20CLASSES/Senior%20Project%20Stuff/Final%20Deliverables/GO-LOCAL-STAFF-APP/Website/jsonPOST_sms.php';
  $url_sendSMSCode = 'http://localhost:8888/FIU%20CLASSES/Senior%20Project%20Stuff/Final%20Deliverables/GO-LOCAL-STAFF-APP/Website/jsonPOST_smsCode.php';
  $url_sendMaleRegistration = 'http://localhost:8888/FIU%20CLASSES/Senior%20Project%20Stuff/Final%20Deliverables/GO-LOCAL-STAFF-APP/Website/jsonPOST_registration.php';



}
else
{
  $url_sendSMS = 'http://45.55.208.175/Website/jsonPOST_sms.php';
  $url_sendSMSCode = 'http://45.55.208.175/Website/jsonPOST_smsCode.php';
  $url_sendMaleRegistration = 'http://45.55.208.175/Website/jsonPOST_registration.php';



}

?>