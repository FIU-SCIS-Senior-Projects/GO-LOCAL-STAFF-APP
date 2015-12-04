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
          
          $emailOrUsername    = $decoded['emailOrUsername'];
          $password           = $decoded['password'];
          //check if valid user and return type of user
          $typeUser = loginRegisteredUser($emailOrUsername, $password);
          if($typeUser == 2)//valid employer user
          {
              $responseArray = array(
                "message"   => "employer user",
                "usertype"  => $typeUser,
              );
          }
          else if($typeUser == 1) //valid staff user
          {
            $responseArray = array(
                "message" => "staff user",
                "usertype"    => $typeUser,
              );
          }
          else if($typeUser == 0) //database not responding
          {
              $responseArray = array(
                "message"   => "database not responding",
                "usertype"  => $typeUser,
              );
          }
          else if($typeUser == -1) //invalid credentials
          {
              $responseArray = array(
                "message"   => "invalid credentials",
                "usertype"  => $typeUser,
              );
          }
          else if($typeUser == -2) //Account locked
          {
              $responseArray = array(
                "message"   => "Account locked",
                "usertype"  => $typeUser,
              );
          }
          else if($typeUser == -3) //no registered user found
          {
              $responseArray = array(
                "message"   => "no registered user found",
                "usertype"  => $typeUser,
              );
          }

          /* 
            reponse returns the following:
              2   employer account found  - valid credentials provided
              1   staff account found     - valid credentials provided
              0   database not responding
              -1  account found           - invalid credentials 
              -2  account locked           
              -3  no user found        
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

  header  ('Content-type: application/json');
  exit  ($encoded);
