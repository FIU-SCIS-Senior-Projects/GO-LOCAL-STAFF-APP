<?php 


/************************** Staff methods **********************/

    /* checks the user provided is unique - doesnt exist in database
      returns
             1  username is unique
             0  database not responding
            -1  username is not unique
            
    */
    function isUniqueRegisteredStaff( $username, $email )
    {
          $dbConnection = connectToDB();
          if(!$dbConnection)
          {
            echo "Unable to connect to MySQL.".PHP_EOL;
            return 0;
          }

          //making sure user is a unique registration
          $query = "SELECT * FROM registeredstaff WHERE username='".$username."' or email='".$email."'";
          
          $result = mysqli_query($dbConnection, $query);
          $row = mysqli_fetch_array( $result, MYSQLI_ASSOC );
          $rowResult = array_filter($row);
          if (empty($rowResult))
          {
            print_r($row);
            echo "<p>username and email is unique</p>";
            return 1;
          }
          else
          {
            print_r($row);
            echo "<p>username and email is NOT unique</p>";
            return -1;
          }
    }//eom

    /* register a staff 
      returns 
            1   successfully register
            0   database not responding
            -2  unsuccessfully register   - unable to hash password
            -3  unsuccessfully register   -
            -6  successfully register   - unable to email user
    */
    function registerStaff($registrationData)
    {
          $dbConnection = connectToDB();
          if(!$dbConnection)
          {
            echo "Unable to connect to MySQL.".PHP_EOL;
            return 0;
          }

          //data
          $username = $registrationData['username'];
          $password = $registrationData['password'];
          $email    = $registrationData['email'];
        
          //hash password for security
          // $password = "";
          $passwordHashed = password_hash($password, PASSWORD_BCRYPT);
          if(!$passwordHashed)
          {
            echo "<p>failure hashing password $password</p>";
            return -2;
          }
          
            // query for 'registeredstaff' table
            $query = "INSERT INTO registeredstaff (username, password, email)
                      VALUES ( '$username', '$passwordHashed', '$email' )";  

            //perform query
            $result = mysqli_query($dbConnection, $query);
            echo "<p> registeredstaff results ".$result."</p>";
            if($result)
            {
                //data
                $resultkey    = $dbConnection->insert_id;
                $firstName    = $registrationData['firstName'];
                $middleName   = $registrationData['middleName'];
                $lastName     = $registrationData['lastName'];
                $nickname     = $registrationData['nickname'];
                $email        = $registrationData['email'];
                $password     = $registrationData['password'];
                $cellphone    = $registrationData['cellphone'];
                $address      = $registrationData['address'];
                $city         = $registrationData['city'];
                $state        = $registrationData['state'];
                $address      = "$address $city, $state";
                $djSelected                     = $registrationData['djSelected'];//
                $liveBandSelected               = $registrationData['liveBandSelected'];//
                $cateringCompanySelected        = $registrationData['cateringCompanySelected'];//
                $otherServices                  = $registrationData['otherServices'];//
                $djDescription                  = $registrationData['djDescription'];//
                $djWebsite                      = $registrationData['djWebsite'];//
                $djSocialMedia                  = $registrationData['djSocialMedia'];//
                $liveBandDescription            = $registrationData['liveBandDescription'];//
                $liveBandWebsite                = $registrationData['liveBandWebsite'];//
                $liveBandSocialMedia            = $registrationData['liveBandSocialMedia'];//
                $cateringCompanyDescription     = $registrationData['cateringCompanyDescription'];//
                $cateringCompanyWebsite         = $registrationData['cateringCompanyWebsite'];//
                $cateringCompanySocialMedia     = $registrationData['cateringCompanySocialMedia'];//
                $otherServicesDescription       = $registrationData['otherServicesDescription'];//
                $otherServicesBandWebsite       = $registrationData['otherServicesBandWebsite'];//
                $otherServicesBandSocialMedia   = $registrationData['otherServicesBandSocialMedia'];
                $dob              = $registrationData['dob'];
                $email            = $registrationData['email'];
                $gender           = $registrationData['gender'];
                $languages        = $registrationData['languages'];
                $typeOfLicense    = $registrationData['typeOfLicense'];
                $ethnicity        = $registrationData['ethnicity'];
                $height           = $registrationData['height'];
                $weight           = $registrationData['weight'];
                $hairColor        = $registrationData['hairColor'];
                $eyeColor         = $registrationData['eyeColor'];
                $tshirtSize       = $registrationData['tshirtSize'];
                $pantSize         = $registrationData['pantSize'];
                $chestSize        = $registrationData['chestSize'];
                $waistSize        = $registrationData['waistSize'];
                $hipSize          = $registrationData['hipSize'];
                $dressSize        = $registrationData['dressSize'];
                $shoeSize         = $registrationData['shoeSize'];

                $tattoos            = $registrationData['tattoos'];
                $piercings          = $registrationData['piercings'];
                $ssn          = $registrationData['ssn'];
                $ein          = $registrationData['ein'];
                $ssnOrEin = $ein;
                if(  is_null($ssnOrEin) )
                {
                  $ssnOrEin = $ssn;
                }
                
                $business_name      = $registrationData['business_name']; //missing in database!!!
                $desiredHourlyRate  = $registrationData['desiredHourlyRate'];//?
                $desiredWeeklyRate  = $registrationData['desiredWeeklyRate'];//?
                $travel              = $registrationData['travel'];

                $DirectDepositRoutingNumber   = $registrationData['DirectDepositRoutingNumber'];
                $DirectDepositAccountNumber   = $registrationData['DirectDepositAccountNumber'];

            // query for 'people' table
            $query1 = "INSERT INTO people ( peopleID, companyID, staffType, firstName , middleInitial, lastName, nickname, email,address,phone,profession,website,socialMedia, pictures, dateOfBirth,gender,languages,typeDL,ethnicity,height,weight,hairColor, eyeColor,shirtSize,pantSize,chestSize,waistSize,hipSize,dressSize,shoeSize, tattoos,piercings,desiredPayRate,ssnOrEin,travel,insurance,insuranceDocuments, bankRouting, accountNumber, resume )
                      VALUES ( $resultkey, 0, 0, '$firstName', '$middleName', '$lastName', '$nickname', '$email','$address', '$cellphone', 0,'website','social media', 'pictures', '$dob','$gender','$languages', $typeOfLicense, $ethnicity, $height, $weight, '$hairColor', '$eyeColor','$tshirtSize', $pantSize, $chestSize, $waistSize, $hipSize, $dressSize, $shoeSize, $tattoos, $piercings , 30, $ssnOrEin, $travel,0,'insuranceDocuments', '$DirectDepositRoutingNumber', '$DirectDepositAccountNumber', 'resume' ) "; 

            echo "<p>$query1</p>";
            //perform query
            $result2 = mysqli_query($dbConnection, $query1);
            echo "<p> people results ".$result2." with id $dbConnection->insert_id</p>";
            }

            /*emailing user */
            $emailResult  = emailStaff($email);
            echo "<p>email results $emailResult</p>";
            if($emailResult != 1)
            {
              echo "email failed";
              return -6;
            }

          return 1; //successfully register
    }//eom

    /* emails staff */
    function emailStaff($email)
    {
      $email_address = $email;
      $email_subject = "GoLocalApp email verification";
      $email_body = "Thanks for signing up!";
      $headers = "From: noreply@golocalpromos.com\n";
      $headers .= "Reply-To: $email_address";
      $result = mail( $email_address, $email_subject , $email_body , $headers );
      return $result;
    }//eom

    /* gets all staff*/
    function getAllStaff()
    {

      $finalList = array();

      //connecting to db
      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
        echo "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }

      //gettting all registered staff
      $query = "SELECT * FROM registeredstaff";
      $result = mysqli_query($dbConnection, $query);

      $totalRows = mysqli_num_rows($result);
      if($totalRows > 0)
      {
        while( $registeredStaffResults = mysqli_fetch_array( $result, MYSQLI_ASSOC ) )
        {
          //attempting to get more info on user
            $currentPeopleID = $registeredStaffResults['peopleID'];//getting current People ID
            //query people table for registeredstaff info
            $query1 = "SELECT * FROM people WHERE peopleID ='".$currentPeopleID."'";
            $result1 = mysqli_query($dbConnection, $query1);
            $totalRows1 = mysqli_num_rows($result1);
            if($totalRows1 > 0)
            {
              //getting info from 'people' table
              $peopleResults = mysqli_fetch_array( $result1, MYSQLI_ASSOC );
  
              //combining information from both tables 'registeredstaff' & 'people'
              $registeredStaffResults = array_merge($registeredStaffResults, $peopleResults);

              //adding only info from registeredStaff and people table
              array_push($finalList, $registeredStaffResults);
            }
            else 
            {
              //adding ONLY info from registeredStaff table
              array_push($finalList, $registeredStaffResults);
            }
        }
      }

      return $finalList;
    }//eom




/************************** Employer methods **********************/

    /* checks the employer provided is unique - doesnt exist in database*/
    function isUniqueRegisteredEmployer( $username, $email )
    {
          $dbConnection = connectToDB();

          //making sure user is a unique registration
          $query = "select * from registeredcompany where username='".$username."' or email='".$email."'";
          
          // echo "<p>".$query."</p>";

          $result = mysqli_query($dbConnection, $query);
          $row = mysqli_fetch_array( $result, MYSQLI_ASSOC );
          $rowResult = array_filter($row);
          if (empty($rowResult))
          {
            // echo "<p>employer is unique</p>";
            return 0;
          }
          else
          {
            print_r($row);
            // echo "<p>employer is NOT unique</p>";
            return -1;
          }
    }//eom

    /* register a staff 
      returns 0 database not responding 
    */
    function registerEmployer($username, $email, $password)
    {
          $dbConnection = connectToDB();

          //hash password for security
          $passwordHashed = password_hash($password, PASSWORD_BCRYPT);

          //prepare query
          $query = "INSERT INTO registeredcompany (username, password, email)
                    VALUES ( '$username', '$passwordHashed', '$email' )";  

          //perform query
          $result = mysqli_query($dbConnection, $query);
          echo "<p>".$result."</p>";
          return $result;

    }//eom

    /* emails employer */
    function emailEmployer($email)
    {
        $to = $email;
        $subject = "GoLocalApp email verification";
        $message = "Thanks for signing up!";
        $headers = "From:noreply@golocalpromos.com"."\r\n";
        $result = mail( $to, $subject, $message, $headers );
        echo $result;
    }//eom

    /* gets all staff*/
    function getAllEmployers()
    {

      $finalList = array();

      //connecting to db
      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
        echo "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }

      //gettting all staff
      $query = "SELECT * FROM registeredcompany";
      $result = mysqli_query($dbConnection, $query);

      $totalRows = mysqli_num_rows($result);
      if($totalRows > 0)
      {
        while( $row = mysqli_fetch_array( $result, MYSQLI_ASSOC ) )
        {
          array_push($finalList, $row);
        }
      }

      return $finalList;
    }//eom



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

?>