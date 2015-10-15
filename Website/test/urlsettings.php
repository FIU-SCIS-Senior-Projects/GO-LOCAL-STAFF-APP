<?php

$localTesting = false;
$testingStaffUser = true;

$urlBody = '';
if($localTesting)
{
   //lu link body
  $urlBody = 'http://localhost:8888/FIU%20CLASSES/Senior%20Project%20Stuff/Final%20Deliverables/GO-LOCAL-STAFF-APP/Website/';

  //wil link body
  // $urlBody = ' ';
  
}
else
{
  $urlBody = 'http://45.55.208.175/Website/';
}

  //testing links
  $url_sendSMS                  = $urlBody.'jsonPOST_sms.php';
  $url_sendSMSCode              = $urlBody.'jsonPOST_smsCode.php';
  $url_sendMaleRegistration     = $urlBody.'jsonPOST_registration.php';
  $url_sendLogin                = $urlBody.'jsonPOST_login.php';
  $url_sendSMSforgotPassword    = $urlBody.'jsonPOST_smsForgotPassword.php';


  
  $url_sendforgotPassword       = $urlBody.'jsonPOST_forgotPassword.php';

?>
