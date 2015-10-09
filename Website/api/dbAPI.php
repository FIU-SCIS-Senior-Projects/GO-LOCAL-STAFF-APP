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

  /* verifies the user credentials are valid credentials 
      returns 
          2   employer account found  - valid credentials provided
          1   staff account found     - valid credentials provided
          0   database not responding
          -1  staff account found     - invalid credentials 
          -2  employer account found  - invalid credentials 
          -3  no user found           - employer or staff
  */
function loginRegisteredUser($username, $email , $password )
{

      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
//        echo "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }
     
        //staff account lookup
          $query = "SELECT * FROM registered_staff WHERE username='".$username."' or email='".$email."'";
          
          $result     = mysqli_query($dbConnection, $query);
          $row        = mysqli_fetch_array( $result, MYSQLI_ASSOC );
          $rowResult  = array_filter($row);
          
          if( !empty($rowResult) )
          {                
            // print_r($row);//testing
            $dbHashedPassword = $row['password'];
            if ( password_verify($password, $dbHashedPassword) ) 
            {
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
          $rowResult = null;
          $dbHashedPassword = null;

          //employer account look up
          $query = "SELECT * FROM registered_employer WHERE username='".$username."' or email='".$email."'";
          
          $result = mysqli_query($dbConnection, $query);
          $row = mysqli_fetch_array( $result, MYSQLI_ASSOC );
          $rowResult = array_filter($row);
          
          if ( $rowResult )
          {
            // print_r($row);//testing
            $dbHashedPassword = $row['password'];

            if ( password_verify($password, $dbHashedPassword) ) 
            {
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

    //making sure user is a unique registration
   if( $registrationType == "Staff")
   {
    $query = "SELECT * FROM registered_staff WHERE username='".$username."' or email='".$email."'";
   }
   else if( $registrationType == "Employer" )
   {
    $query = "SELECT * FROM registered_employer WHERE username='".$username."' or email='".$email."'";
   } 
   else
   {
      return -10;
   }

    $result = mysqli_query($dbConnection, $query);
    $row = mysqli_fetch_array( $result, MYSQLI_ASSOC );
    $rowResult = array_filter($row);
    if (empty($rowResult))
    {
      // print_r($row);
    //  echo "<p>username and email is unique</p>";
      return 1;
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

    $code     = mt_rand(1000, 9999);
    $subject  = "GoLocalApp code authentication\r\n";
    $message  = "code: $code\n";
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
        $query = "SELECT phoneCode, phoneValidated
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
          print_r($userInfo);
          echo $phoneAlreadyValidated;
           if( $phoneAlreadyValidated == 1 )
           {
              return -3; //verification process previously performed, ignoring this request
           }

            //Code verified, updating table
            $query = "UPDATE $tableName
                  SET phoneValidated='1'
                  WHERE $userKey='".$userID."'
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
