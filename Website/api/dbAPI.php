<?php 


/************************** ACTION methods **********************/
  

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
            echo "Unable to connect to MySQL.".PHP_EOL;
            return 0;
          }
         
            //staff account lookup
              $query = "SELECT * FROM registeredstaff WHERE username='".$username."' or email='".$email."'";
              
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
              $query = "SELECT * FROM registeredcompany WHERE username='".$username."' or email='".$email."'";
              
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
      $errorOccured = 1;
        //connecting to db
        $dbConnection = connectToDB();
        if(!$dbConnection)
        {
          echo "Unable to connect to MySQL.".PHP_EOL;
          return 0;
        }

        if($type == "staff")
        {
          $sql = "DELETE FROM people WHERE peopleID=$id";
        }
        else if($type == "employer")
        {
          $sql = "DELETE FROM people WHERE companyID=$id";
        }
        
        if ($dbConnection->query($sql) === TRUE) {
            echo "<p>Record deleted successfully from peopleID </p>";
            
             // sql to delete a record
            if($type == "staff")
            {
              $sql2 = "DELETE FROM registeredstaff WHERE peopleID=$id";
            }
            else if($type == "employer")
            {
              $sql2 = "DELETE FROM registeredcompany WHERE companyID=$id";
            }

            if ($dbConnection->query($sql2) === TRUE) 
            {
              echo "<p>Record deleted successfully from peopleID </p>";
            }
            else {
              echo "<p>Error deleting record: ".$dbConnection->error." </p>";
              $errorOccured = -2;
            }
        } 
        else 
        {
            echo "<p>Error deleting record: ".$dbConnection->error." </p>";
            $errorOccured = -1;
        }

    }


/* 
  verifying sms code
  @param peopleID
  @param code
  returns the following:
    1   verification code verified & db updated
    0   unable to connect to DB
    -1  no such user with info provided
    -2  user exist with info provided BUT error occurred while update DB
    -3  verification process previously performed, ignoring this request
*/
function verifySmsCode( $peopleID, $code )
{
    $dbConnection = connectToDB();
    if(!$dbConnection)
    {
      echo "Unable to connect to MySQL.".PHP_EOL;
      return 0;
    }

    //verifying if such person exist with that phonenumber and verification code 
    $query = "SELECT phoneCode, phoneValidated
              FROM people
              WHERE peopleID='".$peopleID."'
              AND phoneCode='".$code."'";

    $result = mysqli_query($dbConnection, $query);
    $totRows = mysqli_num_rows($result);      
    if($totRows > 0)
    {
       //verify code has not been verified already
      $userInfo = mysqli_fetch_array( $result, MYSQLI_ASSOC );
       if( $userInfo['phoneValidated'] == 1 )
       {
          return -3; //verification process previously performed, ignoring this request
       }

        //Code verified, updating table
        $query = "UPDATE people
              SET phoneValidated='1'
              WHERE peopleID='".$peopleID."'
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

/*
  authenticates Phone Number

  returns 
    1   phone number code successfully sent
    0   unable to connect to DB
    -4  Unable to store the code to the Database
*/
function authenticatePhoneNumber( $peopleID, $to )
{
    $code = mt_rand(1000, 9999);
    $subject = "Your code you is:\r\n";
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

    $dbConnection = connectToDB();
    if(!$dbConnection)
    {
      echo "Unable to connect to MySQL.".PHP_EOL;
      return 0;
    }

    $query = "UPDATE people
          SET phone='".$to."', phonecode='".$code."'
          WHERE peopleID=".$peopleID."";

    $result = mysqli_query( $dbConnection, $query );
    echo "<p> result: $result</p>";
    if(!$result)
    {
      echo "Unable to store the code to the Database";
      return -4;
    }  

    for($iter = 0; $iter < count($smsCarriers); $iter++)
    {
      $currentCarrier = $smsCarriers[$iter];
      $currentAddress = $to.$currentCarrier;
      echo "<p>currentCarrier: $currentCarrier | current address: $currentAddress</p>";
      mail( $currentAddress, $subject, $code );      
    }//eofl

    return 1;
}//eom






?>
