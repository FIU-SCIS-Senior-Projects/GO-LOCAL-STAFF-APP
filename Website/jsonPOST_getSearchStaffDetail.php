<?php

//making sure its  valid POST request
if( $_SERVER["REQUEST_METHOD"] == "POST" )
{
  //getting php post body data
  $jsondata = file_get_contents('php://input');
  if ($jsondata) 
  {
    //converting json to php array
    $decoded = json_decode($jsondata, true);
      switch (json_last_error())
      {
        case JSON_ERROR_NONE:
            $jsonError = ' - No errors';
        break;
        case JSON_ERROR_DEPTH:
            $jsonError = ' - Maximum stack depth exceeded';
        break;
        case JSON_ERROR_STATE_MISMATCH:
            $jsonError = ' - Underflow or the modes mismatch';
        break;
        case JSON_ERROR_CTRL_CHAR:
            $jsonError = ' - Unexpected control character found';
        break;
        case JSON_ERROR_SYNTAX:
            $jsonError = ' - Syntax error, malformed JSON';
        break;
        case JSON_ERROR_UTF8:
            $jsonError = ' - Malformed UTF-8 characters, possibly incorrectly encoded';
        break;
        default:
            $jsonError = ' - Unknown error';
        break;
      }

    //not a valid json value found
    if (is_null ($decoded)) 
    {
      $response['status'] = array(
      'type' => 'error',
      'value' => 'Invalid JSON value found',
      'error' => $jsonError
      );
    }
    else  //valid json values found
    {
        require 'API.php';/* adding API */

        $responseArray;
        $userID           = $decoded["userID"];

        $staffSearchResults = getSearchStaffDetail($userID);
       
        // echo "<p>results:";
        // print_r($staffSearchResults);
        // echo "</p>";

        if($staffSearchResults == -1)
        {
          //unable to verify the phone.
          $responseArray = [
            "message" => "no such user with info provided",
            "responseType" => $staffSearchResults,
            ];
        }
        else if( $staffSearchResults == 0)
        {
          //unable to verify the phone.
          $responseArray = [
            "message" => "unable to connect to DB",
            "responseType" => $staffSearchResults,
            ];
        }
        else if($staffSearchResults)
        {
          $responseArray = [
            "message" => "successfully retrieved staff information",
            "data" => $staffSearchResults,
            ];
        }


        /* 
          reponse returns the following:
             staff data       successfully retrieved staff information
              0               database not responding
              -1              unable to retrieved staff information
        */
        $response['results'] = $responseArray; //sending reply

    }//eo valid-json
  }//eo valid-data
}//eo valid - POST
else 
{
  $response['status'] = array(
      'type' => 'error',
      'value' => 'No JSON value set',
  );
} 

//responding back to sender
$encoded = json_encode($response);

      /* saving incoming file */
      // Write the contents back to the file
      $filename = 'test/getSearchStaffDetailResponse.json';
      file_put_contents($filename, var_export($encoded, true));

      $filename = 'test/getSearchStaffDetailIncoming.json';
      file_put_contents($filename, var_export($decoded, true));


header  ('Content-type: application/json');
exit  ($encoded);
