<?php

$localTesting = false;
$testingStaffUser = false;

$urlBody = '';
if($localTesting)
{
   //lu link body
  $urlBody = 'http://localhost:8888/FIU%20CLASSES/Senior%20Project%20Stuff/Final%20Deliverables/GO-LOCAL-STAFF-APP/Website/';

  //wil link body
  // $urlBody = 'localhost:8888/GO-LOCAL-STAFF-APP/Website/';
  
}
else
{
  $urlBody = 'http://192.241.186.107/Website/';
}

  //testing links
  $url_sendSMS                  = $urlBody.'jsonPOST_sms.php';
  $url_sendSMSCode              = $urlBody.'jsonPOST_smsCode.php';

  $url_sendSearchTalent         = $urlBody.'jsonPOST_searchTalent.php';
  $url_getSearchStaffDetailView = $urlBody.'jsonPOST_getSearchStaffDetail.php';

  $url_sendGetTermsAgreements   = $urlBody.'jsonPOST_getTermsAgreements.php';

?>
