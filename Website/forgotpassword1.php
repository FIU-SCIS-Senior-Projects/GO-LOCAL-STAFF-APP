      require 'API.php';/* adding API */

      $peopleID;
      $responseArray;
      $phone            = $decoded["phone"];

      //check if user exist with phone number provided
      $userExist  = UserWithPhoneProvidedExist($phone);
      if($userExist == 0)
      {
        $responseArray = [
        "message" => "database not responding",
        "responseType" => $userExist,
        "part" => "1"
        ];
      }
      else if($userExist == -1)
      {
        $responseArray = [
        "message" => "No Username or Email exist with the information provided",
        "responseType" => $userExist,
        "part" => "1"
        ];
      }   
      else if($userExist)
      {
          //sending user SMS code
          $smsSendResults = sendSMSForgotPasswordCode($userExist);
          if($smsSendResults)
          {
            $user  =  $smsSendResults['userID'];
            $userKey  =  $smsSendResults['userKey'];

            $responseArray = [ 
            "message" => "phone number code successfully sent",
            "responseType" => "1",
            "userID" => $user,
            "userKey" => $userKey,
            "part" => "1"
            ];
          }
          else if($smsSendResults == 0)
          {
            $responseArray = [
            "message" => "database not responding",
            "responseType" => $smsSendResults,
            "part" => "1"
            ];
          }
          else if($smsSendResults == -2)
          {
            $responseArray = [
            "message" => "Unable to save changes to Database",
            "responseType" => $smsSendResults,
            "part" => "1"
            ];
          }
      }


        /* 
          reponse returns the following:
              1   phone number code successfully sent
              0   database not responding
              -1  No Username or Email exist with the information provided 
              -2  Unable to save changes to Database
        */
        $response['results'] = $responseArray; //sending reply
