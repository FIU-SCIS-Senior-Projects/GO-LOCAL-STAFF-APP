<?php 

/************************** DB methods **********************/  

  /* connect to database  */
  function connectToDB()
  {
    $db = mysqli_connect("localhost", "root", "fall2015", "golocalapp");
    return $db;
  }//eom

  /* close connection to database  */
  function closeDB($link)
  {
      mysqli_close($link);
  }//eom


/******************* LOGIN ********************************/

  /* verifies the user credentials are valid credentials 
      returns 
          2   employer account found  - valid credentials provided
          1   staff account found     - valid credentials provided
          0   database not responding
          -1  staff account found     - invalid credentials 
          -2  employer account found  - invalid credentials 
          -3  no user found           - employer or staff
  */
  function loginRegisteredUser($emailOrUsername, $password )
  {
      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
      //        echo "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }

      //staff account lookup
      $query = "SELECT password,accountLocked FROM registered_staff WHERE username='".$emailOrUsername."' or email='".$emailOrUsername."'";
      $result     = mysqli_query($dbConnection, $query);

      //cleaning provided password
      $cleanpass  = mysqli_real_escape_string($dbConnection, $password);

      $row        = mysqli_fetch_array( $result, MYSQLI_ASSOC );
      $rowResult  = array_filter($row);
      
      if( $rowResult )
      {                
        // print_r($row);//testing

        //getting hashed password
        $dbHashedPassword = $row['password'];

        //verifying password is valid
        if ( password_verify($cleanpass, $dbHashedPassword) ) 
        {
            //check if account is locked
            $staffAccountLocked    = $row['accountLocked']; 
            if($staffAccountLocked)
            {
              // echo '<p>staff account is LOCKED!</p>';//testing
              return -4;
            }

            // echo '<p>staff Password is valid!</p>';//testing
            return 1;
        } 
        else 
        {
            // echo '<p> staff Invalid password.</p>';//testing
            return -1;
        }
      }//eo-staff look up

      //freeing vars
      $query = null;
      $result = null;
      $row =  null;
      $rowResult = null;
      $dbHashedPassword = null;

      //employer account look up
      $query = "SELECT password,accountLocked FROM registered_employer WHERE username='".$emailOrUsername."' or email='".$emailOrUsername."'";
      
      $result     = mysqli_query($dbConnection, $query);
      $row        = mysqli_fetch_array( $result, MYSQLI_ASSOC );
      $rowResult  = array_filter($row);
      
      if( $rowResult )
      {
        // print_r($row);//testing
        $dbHashedPassword = $row['password']; 

        if ( password_verify($cleanpass, $dbHashedPassword) ) 
        {
            //check if account is locked
            $employerAccountLocked    = $row['accountLocked'];
            if($employerAccountLocked)
            {
              // echo '<p>employer account is LOCKED!</p>';//testing
              return -4;
            }

            // echo '<p>employer Password is valid!</p>';//testing
            return 2;
        } else {
            // echo '<p>employer Invalid password.</p>';//testing
            return -2;
        }
      }//eo-employer look up

      // echo "<p>no account found</p>";
      return -3; //no account found
            
  }//eom



/******************* FORGOT PASSWORD (RESET PASSWORD) ********************************/


/* checks if the user provided exist in database
  returns
         userdata  username exist
         0  database not responding
        -1  username does not exist     
*/
function UserWithPhoneProvidedExist( $phone )
{
    $dbConnection = connectToDB();
    if(!$dbConnection)
    {
  //    echo "Unable to connect to MySQL.".PHP_EOL;
      return 0;
    }

   // making sure user is a unique registration
    $query      = "SELECT staffID,phone,forgotPasswordRequests,accountLocked  FROM registered_staff WHERE phone='".$phone."'";
    $result     = mysqli_query($dbConnection, $query);
    $row        = mysqli_fetch_array( $result, MYSQLI_ASSOC );
    $rowResult  = array_filter($row);
    if (empty($rowResult))
    {
             // echo "<p>username and email is unique so far (NOT a registered_staff).....</p>";
            $query      = "SELECT employerID,phone,forgotPasswordRequests,accountLocked FROM registered_employer WHERE phone='".$phone."'";
            $result     = mysqli_query($dbConnection, $query);
            $row        = mysqli_fetch_array( $result, MYSQLI_ASSOC );
            $rowResult  = array_filter($row);
            if (empty($rowResult))
            {
              // print_r($row);
              // echo "<p> NO user exist with the information provided (registered_employer or registered_staff)</p>";
              return -1;
            }
            else
            {
              // print_r($row);
              // echo "<p> user exist with information provided, registered_employer</p>";
              return $row;
            }
    }
    else
    {
      // print_r($row);
      // echo "<p> user exist with information provided, registered_staff</p>";
      return $row;
    }
}//eom


/*
  send sms code for forgot password

  returns 
    userID   sms code for 'forgot password' successfully sent
    0   unable to connect to DB
    -2  Unable to send forgot password sms code
    -3  account locked
    -4  account has been locked, maximum password resets attempt reached
    -5  Unable to save changes to Database
      
*/
function sendSMSForgotPasswordCode($userData)
{

    $dbConnection = connectToDB();
    if(!$dbConnection)
    {
     // echo "Unable to connect to MySQL.".PHP_EOL;
      return 0;
    }

    //getting user data
    $staffType              = $userData['staffID'];
    $employerType           = $userData['employerID'];
    $phone                  = $userData['phone'];
    $forgotPasswordRequests = $userData['forgotPasswordRequests'] + 1;
    $accountLocked          = $userData['accountLocked'];
    $userKey    = "";
    $userID     = "";
    //checking if account is locked
    if($accountLocked)
    {
      return -3;
    }
    
    //checking which type of user it is
    if($staffType)
    {
      $tableName = "registered_staff";
      $userKey   = "staffID";
      $userID    = $staffType;
    }
    else if($employerType)
    {
      $tableName  = "registered_employer";
      $userKey    = "employerID";
      $userID     = $employerType;
    }

    //checking if account NEEDS to be locked
    if($forgotPasswordRequests > 4)
    {
      lockedUserAccount($dbConnection, $tableName, $userKey, $userID, $forgotPasswordRequests);
      return -4;
    }
    
    //creating random number
    $code                   = mt_rand(1000, 9999);
    $forgotPasswordCode     = $code;


    $query = "UPDATE $tableName
              SET forgotPasswordRequests='".$forgotPasswordRequests."', forgotPasswordCode = '".$forgotPasswordCode."'
              WHERE $userKey='".$userID."'";

    $result = mysqli_query( $dbConnection, $query );
    if(!$result)
    {
      // echo "Unable to store changes to Database";
      return -5;
    }  

    //preparing text message info
    $subject  = "GoLocalApp password reset\r\n";
    $message  = "code: $code\n";

    //list of carriers
    $smsCarriers = [
      "@mms.aiowireless.net",
      "@text.att.net",
      "@myboostmobile.com",
      "@mms.cricketwireless.net",
      "@mymetropcs.com",
      "@pm.sprint.com",
      "@vtext.com",
      "@tmomail.net",
      "@email.uscc.net",
      "@vtext.com",
    ];

    //sending sms code to user
    for($iter = 0; $iter < count($smsCarriers); $iter++)
    {
      $currentCarrier = $smsCarriers[$iter];
      $currentAddress = $phone.$currentCarrier;
      $emailResult = mail( $currentAddress, $subject, $message );    
      // echo "<p>currentCarrier: $currentCarrier | current address: $currentAddress | mail result: $emailResult</p>";  
    }//eofl

    $list = array
    (
      "userID" => $userID,
      "userKey"  =>  $userKey
    );
    return $list;
}//eom


  /* 
    
  */
  function forgotPassword($userData)
  {

      $userID           = $userData["userID"];
      $code             = $userData["code"];
      $newPassword      = $userData["newPassword"];

  }//eom


/*************** LOCKING/ UNLOCKING USER ACCOUNT ********************************/

/* locks user account */
function lockedUserAccount($dbConnection, $tableName, $userKey, $userID, $forgotPasswordRequests)
{
     $query = "UPDATE $tableName
              SET forgotPasswordRequests ='".$forgotPasswordRequests."', accountLocked = '1'
              WHERE $userKey='".$userID."'";

    $result = mysqli_query( $dbConnection, $query );
    return $result;
}//eom


/* unlocks user account */
function unlockedAccount($dbConnection, $tableName, $userKey, $userID)
{
    $query = "UPDATE `$tableName`
              SET `accountLocked` = 0, `forgotPasswordRequests` = 0
              WHERE `$userKey` = '".$userID."'";

    $result = mysqli_query( $dbConnection, $query );
    return $result;
}//eom



/******************* INITIAL REGISTRATION W/ SMS AUTHENTICATION *********************/

  /* checks the user provided is unique - doesnt exist in database
    returns
           1  username is unique
           0  database not responding
          -1  username is not unique  
          -10  not a valid registration type   
  */
  function isUserRegistrationUnique( $registrationType, $usernameProvided, $emailProvided )
  {
      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
    //    echo "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }

      $username  = mysqli_real_escape_string($dbConnection, $usernameProvided);
      $email     = mysqli_real_escape_string($dbConnection, $emailProvided);

      //checking for invalid type 
     if( ($registrationType != "Staff") && ($registrationType != "Employer") )
     {
        return -10;
     }

     // making sure user is a unique registration
      $query = "SELECT * FROM registered_staff WHERE username='".$username."' or email='".$email."'";
      $result = mysqli_query($dbConnection, $query);
      $row = mysqli_fetch_array( $result, MYSQLI_ASSOC );
      $rowResult = array_filter($row);
      if (empty($rowResult))
      {
           // echo "<p>username and email is unique so far (NOT a registered_staff).....</p>";
          $query = "SELECT * FROM registered_employer WHERE username='".$username."' or email='".$email."'";
          $result = mysqli_query($dbConnection, $query);
          $row = mysqli_fetch_array( $result, MYSQLI_ASSOC );
          $rowResult = array_filter($row);
          if (empty($rowResult))
          {
            // print_r($row);
            // echo "<p>username and email is unique (NOT a registered_employer or registered_staff).....</p>";
            return 1;
          }
          else
          {
            // print_r($row);
            //echo "<p>username and email is NOT unique</p>";
            return -1;
          }
      }
      else
      {
        // print_r($row);
        //echo "<p>username and email is NOT unique</p>";
        return -1;
      }
  }//eom


  /*
    authenticates Phone Number

    SMS AUTHENTICATION PART 1

    returns 
      1   phone number code successfully sent
      0   unable to connect to DB
      -4  Unable to store the code to the Database
  */
  function authenticateUserPhoneNumber($registrationType, $userID, $to )
  {
      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
       // echo "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }

      //updating sql table Name to the appropiate user
      if( $registrationType == "Staff")
      {
         $tableName =  "registered_staff";
         $userKey   = "staffID";
      }
      else if( $registrationType == "Employer")
      {
          $tableName  =  "registered_employer";
          $userKey    = "employerID";
      }

      $code     = mt_rand(1000, 9999);
      
      $query = "UPDATE $tableName
                SET phonecode='".$code."'
                WHERE $userKey='".$userID."'";

      $result = mysqli_query( $dbConnection, $query );
      //echo "<p> result: $result</p>";
      if(!$result)
      {
       // echo "Unable to store the code to the Database";
        return -4;
      }  

      //list of carriers
      $smsCarriers = [
        "@mms.aiowireless.net",
        "@text.att.net",
        "@myboostmobile.com",
        "@mms.cricketwireless.net",
        "@mymetropcs.com",
        "@pm.sprint.com",
        "@vtext.com",
        "@tmomail.net",
        "@email.uscc.net",
        "@vtext.com",
      ];
      $subject  = "GoLocalApp code authentication\r\n";
      $message  = "code: $code\n";


      for($iter = 0; $iter < count($smsCarriers); $iter++)
      {
        $currentCarrier = $smsCarriers[$iter];
        $currentAddress = $to.$currentCarrier;
        $emailResult = mail( $currentAddress, $subject, $message );    
        // echo "<p>currentCarrier: $currentCarrier | current address: $currentAddress | mail result: $emailResult</p>";  
      }//eofl

      return 1;
  }//eom



  /*   
  SMS AUTHENTICATION PART 2

    verifying sms code
    @param peopleID
    @param code
    returns the following:
      1   verification code verified & db updated
      0   unable to connect to DB
      -1  no such user with info provided
      -2  user exist with info provided BUT error occurred while update DB
      -3  verification process previously performed, ignoring this request
      -10 not a valid registration Type
  */
  function verifySmsCode($registrationType, $userID, $code , $phone)
  {
      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
        //echo "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }

      //updating sql table Name to the appropiate user
      if( $registrationType == "Staff")
      {
         $tableName =  "registered_staff";
         $userKey   = "staffID";
      }
      else if( $registrationType == "Employer")
      {
          $tableName  =  "registered_employer";
          $userKey    = "employerID";
      }
      else
      {
        return -10;
      }

          //verifying if such person exist with that phonenumber and verification code 
          $query = "SELECT phoneValidated
                    FROM $tableName
                    WHERE phone='".$phone."'
                    AND phoneCode='".$code."'";

          $result = mysqli_query($dbConnection, $query);
          $totRows = mysqli_num_rows($result); 
          if($totRows > 0)
          {
             //verify code has not been verified already
            $userInfo = mysqli_fetch_array( $result, MYSQLI_ASSOC );
            $phoneAlreadyValidated  = $userInfo['phoneValidated'];
             if( $phoneAlreadyValidated == 1 )
             {
                return -3; //verification process previously performed, ignoring this request
             }

              //Code verified, updating table
              $query = "UPDATE $tableName
                    SET phoneValidated='1'
                    WHERE phone='".$phone."'
                    AND phonecode='".$code."'";

              $saveResult = mysqli_query($dbConnection, $query);
              if($saveResult)
              {
                return 1; // verification code verified & db updated
              }
              else
              {
                return -2; //user exist with info provided BUT error occurred while update DB
              }
          }

        return -1;  //no such user with info provided
  }//eom


  /*
     Stores the credentials of user in the registered_staff table
      returns 
          userID
          0   database not responding
          -2  Unable to store user credentials
          -3  Unable to retrieve userID
  */
  function storeUserCredentials( $registrationType, $userInfo)
  {
    if( $registrationType == "Staff")
    {
      $staffResults = storeStaffCredentials($userInfo);
      return $staffResults;
    }
    else if( $registrationType == "Employer" )
    {
      $employerResults = storeEmployerCredentials($userInfo);
      return $employerResults;
    }
  }//eom


/**************************** FINAL REGISTRATION ********************************/

  /*
    register the user into the database
    returns:
          1   successfully register
          0   database not responding
          -1  Unable to register user
          -10 invalid registration type
  */
  function registerUser( $registrationType, $userInfo)
  {
    if( $registrationType == "Staff")
    {
      $staffResults = registerStaffUser($userInfo);
      return $staffResults;
    }
    else if( $registrationType == "Employer" )
    {
      $employerResults = registerEmployerUser($userInfo);
      return $employerResults;
    }
    else 
    {
      return -10;
    }
  }//eom


/******************* USER MANAGENT FUNCTIONS ********************************/

  /*
    deletes registered user from people tables and from their respective user type table
    returns 
            1   delete from people and registered table
            0   database not responding
            -1  unable to delete from people table
                   
  */
  function deleteRegisteredUser($id, $type)
  {
      //connecting to db
      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
        echo "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }
          
       // sql to delete a record
      if($type == "staff")
      {
        $sql2 = "DELETE FROM registered_staff WHERE staffID=$id";
      }
      else if($type == "employer")
      {
        $sql2 = "DELETE FROM registered_employer WHERE employerID=$id";
      }

      // echo "<p>id = $id| type = $type| query: $sql2</p>";

      $results = $dbConnection->query($sql2);
      if ($results) 
      {
        echo "<p>Record deleted successfully from staffID </p>";
        return 1;
      }
      else {
        echo "<p>Error deleting record: ".$dbConnection->error." </p>";
        $return -1;
      }
  }//eom



/****************************  ********************************/



  /* sends an email to the user */
  function sendEmail( $username, $email, $userType, $hash )
  {
    $to = $email;
      $subject = "GoLocalApp email verification";
      //message to be sent to verify the email address.
      $message = "            

        Thanks for signing up!
        Your account has been created, you can login with the following credentials after you have activated your account by pressing the url below.
         
        ------------------------
        Username: ".$username."
        ------------------------
         
        Please click this link to activate your account:
        http://45.55.208.175/Website/verify.php?type=".$userType."&email=".$email."&hash=".$hash."
         
        ";

      $headers = "From:noreply@golocalpromos.com"."\r\n";
      mail( $to, $subject, $message, $headers );
  }







?>
