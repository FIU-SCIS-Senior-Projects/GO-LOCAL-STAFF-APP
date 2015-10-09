<?php

/************************** Staff methods **********************/

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
    //        echo "Unable to connect to MySQL.".PHP_EOL;
            return 0;
          }

          //data
          $username = $registrationData['username'];
          $password = $registrationData['password'];
          $email    = $registrationData['email'];
        
          //hash password for security
          $passwordHashed = password_hash($password, PASSWORD_BCRYPT);
          if(!$passwordHashed)
          {
  //          echo "<p>failure hashing password $password</p>";
            return -2;
          }
          
            // attempting to save user as a 'registered_staff'
            $query = "INSERT INTO registered_staff (username, password, email)
                      VALUES ( '$username', '$passwordHashed', '$email' )";  

            //perform query
            $result = mysqli_query($dbConnection, $query);
//            echo "<p> registered_staff results ".$result."</p>";
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
                $travel             = $registrationData['travel'];

                $experience         = $registrationData['experience'];//?  staffType

                $DirectDepositRoutingNumber   = $registrationData['DirectDepositRoutingNumber'];
                $DirectDepositAccountNumber   = $registrationData['DirectDepositAccountNumber'];

            // query for 'people' table
            $query1 = "INSERT INTO people ( peopleID, staffType, firstName , middleInitial, lastName, nickname, email,address,phone,profession,website,socialMedia, pictures, dateOfBirth,gender,languages,typeDL,ethnicity,height,weight,hairColor,eyeColor,shirtSize,pantSize,chestSize,waistSize,hipSize,dressSize,shoeSize,tattoos,piercings,desiredHourlyRate,desiredWeeklyRate,ssnOrEin,travel,insurance,insuranceDocuments, bankRouting, accountNumber, resume )
                      VALUES ( $resultkey, 0, '$firstName', '$middleName', '$lastName', '$nickname', '$email','$address', '$cellphone', 0,'website','social media', 'pictures', '$dob','$gender','$languages', $typeOfLicense, $ethnicity, $height, $weight, '$hairColor', '$eyeColor','$tshirtSize', $pantSize, $chestSize, $waistSize, $hipSize, $dressSize, $shoeSize, $tattoos, $piercings , 30, 3000, $ssnOrEin, $travel,0,'insuranceDocuments', '$DirectDepositRoutingNumber', '$DirectDepositAccountNumber', 'resume' ) "; 

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
      //  print "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }

      //gettting all registered staff
      $query = "SELECT * FROM registered_staff";
      $result = mysqli_query($dbConnection, $query);

      $totalRows = mysqli_num_rows($result);
      if($totalRows > 0)
      {
        while( $registeredStaffResults = mysqli_fetch_array( $result, MYSQLI_ASSOC ) )
        {
          //adding current user
          array_push($finalList, $registeredStaffResults);
        }//eowl
      }

      return $finalList;
    }//eom

  /*
    Stores the credentials of user in the registered_staff table
    returns 
        staffID
        0   database not responding
        -2  Unable to store staff credentials
        -3  Unable to retrieve staffID
    */
  function storeStaffCredentials( $staffInfo )
  {
      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
        //echo "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }

      $fname            = $staffInfo["firstName"];
      $middleN          = $staffInfo["middleName"];
      $lname            = $staffInfo["lastName"];
      $nickname         = $staffInfo["nickName"];
      $emailProvided    = $staffInfo["email"];
      $usernameProvided = $staffInfo["username"];
      $pasword          = $staffInfo["password"];
      $dob              = $staffInfo["dob"];
      $carrier          = $staffInfo["carrier"];
      $phone            = $staffInfo["phone"];
      $username       = mysqli_real_escape_string($dbConnection, $usernameProvided);
      $email          = mysqli_real_escape_string($dbConnection, $emailProvided);
      $hashCodeEmail  = mysqli_real_escape_string($dbConnection, md5( rand(0, 1000) ));
      $passwordHashed = password_hash($password, PASSWORD_BCRYPT);

      $query = "INSERT INTO registered_staff ( username, password, email, hashEmail, firstName, middleInitial, lastName, nickname, address, phone)
            VALUES ( '".$username."', '".$passwordHashed."', '".$email."', '".$hashCodeEmail."' , '".$fname."', '".$middleInitial."', '".$lname."', '".$nickname."', '".$address."', '".$phone."')";
  
      $result = mysqli_query($dbConnection, $query);
      if($result)
      {
        $staffID  = $dbConnection->insert_id;
        if( isset($staffID) )
        {
          //echo "<p>staff saved with id $staffID</p>";
          return $staffID; 
        }
        else
        {
         // echo "Unable to retrieve staff ID";
          return -3;
        }
      }

     // echo "Unable to store staff credentials";  
      return -2;
      
  }//eom

  /* registers staff user info 
      returns:
        1   successfully register
        0   database not responding
        -1  Unable to register user
        -10 invalid registration type
    */
  function registerStaffUser($staffInfo)
  {
      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
        //echo "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }

      //checking that user already exist

  }//eom

?>
