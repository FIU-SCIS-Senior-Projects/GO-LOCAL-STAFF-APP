<?php

/************************** Staff methods **********************/

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

      //getting all registered staff
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

      $fname            = $staffInfo["firstName"];//
      $middleInitial    = $staffInfo["middleName"];//
      $lname            = $staffInfo["lastName"];//
      $nickname         = $staffInfo["nickName"];//
      $usernameProvided = $staffInfo["username"];//
      $emailProvided    = $staffInfo["email"];//
      $password         = $staffInfo["password"];//
      $dob              = $staffInfo["dob"];//
      $phone            = $staffInfo["phone"];//

      //Cleaning data (prevent SQL injections)
      $username       = mysqli_real_escape_string($dbConnection, $usernameProvided);
      $email          = mysqli_real_escape_string($dbConnection, $emailProvided);
      $hashCodeEmail  = mysqli_real_escape_string($dbConnection, md5( rand(0, 1000) ));
      $cleanPassword  = mysqli_real_escape_string($dbConnection, $password);

      //hashing password
      $options= array('cost' => 10);
      $passwordHashed = password_hash($cleanPassword, PASSWORD_BCRYPT, $options);

      $query = "INSERT INTO registered_staff ( username, password, email, hashEmail, firstName, middleInitial, lastName, nickname, phone, dateOfBirth)
            VALUES ( '".$username."', '".$passwordHashed."', '".$email."', '".$hashCodeEmail."' , '".$fname."', '".$middleInitial."', '".$lname."', '".$nickname."', '".$phone."', '".$dob."')";
  
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
        1   successfully registered
        0   database not responding
        -1  Unable to register user
        -2 Unable to retrieve staff ID
        -10 invalid registration type
    */
  function registerStaffUser($registrationData)
  {
      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
        // echo "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }


      //these fields were already saved

      $staffID                        = $registrationData['staffID'];
      $username                       = $registrationData['username'];
      $firstName                      = $registrationData['firstName'];
      $middleName                     = $registrationData['middleName'];
      $lastName                       = $registrationData['lastName'];
      $nickname                       = $registrationData['nickname'];
      $email                          = $registrationData['email'];
      $password                       = $registrationData['password'];
      $phone                          = $registrationData['cellphone'];
      $dob                            = $registrationData['dob'];

      //gathering fields to save
      $address                        = $registrationData['address'];
      $city                           = $registrationData['city'];
      $state                          = $registrationData['state'];
      $zipcode                        = $registrationData['zipcode'];
      $ethnicity                      = $registrationData['ethnicity'];
      $ethnicityCode                  = $registrationData['ethnicityCode'];
      $languages                      = $registrationData['languages'];
      $tshirtSize                     = $registrationData['tshirtSize'];
      $tattoos                        = $registrationData['tattoos'];
      $eyeColor                       = $registrationData['eyeColor'];
      $hairColor                      = $registrationData['hairColor'];
      $piercings                      = $registrationData['piercings'];     
      $height                         = $registrationData['height'];
      $weight                         = $registrationData['weight'];
      $gender                         = $registrationData['genderType'];//0 female | 1 male
      if($gender == 0) //females only
      {
        $chestSize                      = $registrationData['chestSize'];
        $waistSize                      = $registrationData['waistSize'];
        $hipSize                        = $registrationData['hipSize'];
        $dressSize                      = $registrationData['dressSize'];
      }
      else
      {
        $chestSize                      = " ";
        $waistSize                      = " ";
        $hipSize                        = " ";
        $dressSize                      = " ";
      }

      $pantSize                       = $registrationData['pantSize'];
      $shoeSize                       = $registrationData['shoeSize'];

      $hasCommercialLicense           = $registrationData['commercialLicense']; 
      $hasDriverLicense               = $registrationData['driverLicense']; 
      if( $hasCommercialLicense == 0 && $hasDriverLicense == 0 )
      {
        $typeOfLicense = -1; //no license
      }
      else if( $hasCommercialLicense == 1 && $hasDriverLicense == 0 )
      {
        $typeOfLicense = 1; //commercial License
      }
      else if( $hasCommercialLicense == 1 && $hasDriverLicense == 1 )
      {
        $typeOfLicense = 1; //commercial License
      }
      else if( $hasCommercialLicense == 0 && $hasDriverLicense == 1 )
      {
        $typeOfLicense = 0; //regular driver License
      }

      $travel                            = $registrationData['travelPercentage'];
      $Incorporated                      = $registrationData['Incorporated'];
      if($Incorporated)
      {
        $ssnOrEin                        = $registrationData['ein'];
        $business_name                   = $registrationData['business_name'];
      }
      else
      {
        $ssnOrEin                        = $registrationData['ssn'];
        $business_name                   = " ";
      }

      $hasProfessionalInsurance          = $registrationData['ProfessionalInsurance'];

      $desiredHourlyRate                = $registrationData['desiredHourlyRate'];
      $desiredWeeklyRate                = $registrationData['desiredWeeklyRate'];

      $DirectDeposit                    = $registrationData['DirectDeposit'];
      if($DirectDeposit)
      {
        $DirectDepositRoutingNumber     = $registrationData['DirectDepositRoutingNumber'];
        $DirectDepositAccountNumber     = $registrationData['DirectDepositAccountNumber'];
      }
      else
      {
        $DirectDepositRoutingNumber     = " ";
        $DirectDepositAccountNumber     = " ";
      }

      //experiences
      $experience                      = $registrationData['experience'];//???????


      // $djSelected                     = $registrationData['djSelected'];//
      // $liveBandSelected               = $registrationData['liveBandSelected'];//
      // $cateringCompanySelected        = $registrationData['cateringCompanySelected'];//
      // $otherServices                  = $registrationData['otherServices'];//
      // $djDescription                  = $registrationData['djDescription'];//
      // $djWebsite                      = $registrationData['djWebsite'];//
      // $djSocialMedia                  = $registrationData['djSocialMedia'];//
      // $liveBandDescription            = $registrationData['liveBandDescription'];//
      // $liveBandWebsite                = $registrationData['liveBandWebsite'];//
      // $liveBandSocialMedia            = $registrationData['liveBandSocialMedia'];//
      // $cateringCompanyDescription     = $registrationData['cateringCompanyDescription'];//
      // $cateringCompanyWebsite         = $registrationData['cateringCompanyWebsite'];//
      // $cateringCompanySocialMedia     = $registrationData['cateringCompanySocialMedia'];//
      // $otherServicesDescription       = $registrationData['otherServicesDescription'];//
      // $otherServicesBandWebsite       = $registrationData['otherServicesBandWebsite'];//
      // $otherServicesBandSocialMedia   = $registrationData['otherServicesBandSocialMedia'];
      
      /*
      `staffID` int(11) NOT NULL,  //PRIMARY KEY
      `staffType` int(11) NOT NULL,
      `pictures` varchar(30) NOT NULL,
      `insuranceDocuments` varchar(30) NOT NULL,
      `resume` varchar(30) NOT NULL,
      `TermsAndAgreements` varchar(255) NOT NULL
      */
      $part1 = "address='".$address."',city='".$city."',zipcode='".$zipcode."',state='".$state."',gender='".$gender."',languages='".$languages."',";
      $part2 = "typeDL='".$typeOfLicense."',ethnicity='".$ethnicity."',ethnicityCode='".$ethnicityCode."',weight='".$weight."',hairColor='".$hairColor."',";
      $part3 = "eyeColor='".$eyeColor."',shirtSize='".$tshirtSize."',chestSize='".$chestSize."',waistSize='".$waistSize."',hipSize='".$hipSize."',";
      $part4 = "dressSize='".$dressSize."',pantSize='".$pantSize."',shoeSize='".$shoeSize."',piercings='".$piercings."',";
      $part5 = "desiredHourlyRate='".$desiredHourlyRate."',desiredWeeklyRate='".$desiredWeeklyRate."',ssnOrEin='".$ssnOrEin."',businessName='".$business_name."',";
      $part6 = "travel='".$travel."',insurance='".$hasProfessionalInsurance."',";
      $part7 = "bankRouting='".$DirectDepositRoutingNumber."',accountNumber='".$DirectDepositAccountNumber."'";


      $query = "UPDATE registered_staff
                SET $part1 $part2 $part3 $part4 $part5 $part6 $part7
                WHERE phone='".$phone."' and staffID = '".$staffID."'";

                echo "<p>".$query."</p>";
      $result = mysqli_query($dbConnection, $query);
      if($result)
      {
        return 1;
      }

      return -1;
  }//eom


  
  /* 
    reponse returns the following:
      userdata   successfully retrieved information
      0   database not responding
      -1  error retriving information
  */
  function searchTalent($inData)
  {
    // print_r($inData);
      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
        // echo "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }



      //gettting all registered staff
      $query = "SELECT * 
                FROM registered_staff";
      $result = mysqli_query($dbConnection, $query);
      if($result)
      {
        return $result;
      }

    return -1;
  }//eom

?>
