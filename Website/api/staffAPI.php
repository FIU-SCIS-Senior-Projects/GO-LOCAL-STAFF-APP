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
          $passwordHashed = password_hash($password, PASSWORD_BCRYPT);
          if(!$passwordHashed)
          {
            echo "<p>failure hashing password $password</p>";
            return -2;
          }
          
            // attempting to save user as a 'registeredstaff'
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
        print "Unable to connect to MySQL.".PHP_EOL;
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

  /*
    Stores the credentials of user in the registeredstaff table
    returns 
        peopleID
        0   database not responding
        -2  Unable to store staff credentials
        -3  Unable to retrieve peopleID
    */
  function storeStaffCredentials( $username, $password, $email )
  {
      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
        echo "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }

      $peopleID       = "";
      $username       = mysqli_real_escape_string($dbConnection, $username);
      $email          = mysqli_real_escape_string($dbConnection, $email);
      $hashCodeEmail  = mysqli_real_escape_string($dbConnection, md5( rand(0, 1000) ));
      $passwordHashed = password_hash($password, PASSWORD_BCRYPT);

      $query = "INSERT INTO registeredstaff ( username, password, email, hash )
            VALUES ( '".$username."', '".$passwordHashed."', '".$email."', '".$hashCodeEmail."' )";

      $result = mysqli_query($dbConnection, $query);
      if($result)
      {
        $query2 = "SELECT peopleID
            FROM registeredstaff
            WHERE username='".$username."'";
        $result2 = mysqli_query($dbConnection, $query2); 
        $totRows = mysqli_num_rows($result2);      
        if($totRows > 0)
        {
          $row = mysqli_fetch_assoc($result2);
          $peopleID = $row["peopleID"];
          sendEmail( $username, $email, "registeredstaff", $hashCodeEmail );
          return $peopleID; 
        }
        else
        {
          echo "Unable to retrieve peopleID";
          return -3;
        }
      }

      echo "Unable to store staff credentials";  
      return -2;
      
  }//eom

/*
  authenticates Phone Number

  returns 
    1   phone number code successfully sent
    0   unable to connect to DB
    -4  Unable to store the code to the Database
*/
function authenticateStaffPhoneNumber( $peopleID, $to )
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
      // echo "<p>currentCarrier: $currentCarrier | current address: $currentAddress</p>";
      mail( $currentAddress, $subject, $code );      
    }//eofl

    return 1;
}//eom

?>