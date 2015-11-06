<?php

/************************** Staff methods **********************/

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

/************************** Registration methods **********************/
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

      $age = getAge($dob);

      //Cleaning data (prevent SQL injections)
      $username       = mysqli_real_escape_string($dbConnection, $usernameProvided);
      $email          = mysqli_real_escape_string($dbConnection, $emailProvided);
      $hashCodeEmail  = mysqli_real_escape_string($dbConnection, md5( rand(0, 1000) ));
      $cleanPassword  = mysqli_real_escape_string($dbConnection, $password);

      //hashing password
      $options= array('cost' => 10);
      $passwordHashed = password_hash($cleanPassword, PASSWORD_BCRYPT, $options);
      
      $query = "INSERT INTO registered_staff ( username, password, email, hashEmail, firstName, middleInitial, lastName, nickname, phone, dateOfBirth, age)
      VALUES ('".$username."', '".$passwordHashed."', '".$email."', '".$hashCodeEmail."' , '".$fname."', '".$middleInitial."', '".$lname."', '".$nickname."', '".$phone."', '".$dob."', '".$age."')";
      
      // echo "<p>".$query."</p>";
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

    /* calculates the age of the staff user provided */
    function getAge($dob)
    {
      $newDOB = substr($dob, 6);
      $newDOB = $newDOB."-".substr($dob, 0, 5);
      $newDOB = date_create($newDOB);
      $today = date_create("today");

      $age   = date_diff($newDOB, $today);
      $age   = $age->format("%y");


      return $age;
    }//eom

    /* 
    registers staff user info 
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

      //gathering fields to save
      $address                        = $registrationData['address'];
      $city                           = $registrationData['city'];
      $state                          = $registrationData['state'];
      $zipcode                        = $registrationData['zipcode'];
      $ethnicity                      = $registrationData['ethnicity'];
      $ethnicityCode                  = $registrationData['ethnicityCode'];
      $languages                      = $registrationData['languages'];
      
      //preparing language values for DB
      if( count($languages) == 3 )
      {
        $nativeLanguage                 = $languages[0];
        $secondLanguage                 = $languages[1];
        $thirdLanguage                  = $languages[2];
      }
      
      $tshirtSize                     = $registrationData['tshirtSize'];
      $tattoos                        = $registrationData['tattoos'];
      $eyeColor                       = $registrationData['eyeColor'];
      $hairColor                      = $registrationData['hairColor'];
      $piercings                      = $registrationData['piercings'];     
      $height                         = $registrationData['height'];

      //preparing height value for DB
      $height = prepareHeightValueForDBStorage($height);

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
        $chestSize                      = "";
        $waistSize                      = "";
        $hipSize                        = "";
        $dressSize                      = "";
      }

      $pantSize                       = $registrationData['pantSize'];
      $shoeSize                       = $registrationData['shoeSize'];

      $hasCommercialLicense           = $registrationData['commercialLicense']; 
      $hasDriverLicense               = $registrationData['driverLicense']; 
      if( $hasCommercialLicense == 0 && $hasDriverLicense == 0 )
      {
        $typeOfLicense = -1; //no license
      }
      else if( $hasCommercialLicense == 0 && $hasDriverLicense == 1 )
      {
        $typeOfLicense = 0; //regular driver License
      }
      else if( $hasCommercialLicense == 1 && $hasDriverLicense == 0 )
      {
        $typeOfLicense = 1; //commercial License
      }
      else if( $hasCommercialLicense == 1 && $hasDriverLicense == 1 )
      {
        $typeOfLicense = 1; //commercial License
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
        $business_name                   = "";
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
        $DirectDepositRoutingNumber     = "";
        $DirectDepositAccountNumber     = "";
      }

      /*
      missing these fields:
      `staffType` int(11) NOT NULL,
      `pictures` varchar(30) NOT NULL,
      `insuranceDocuments` varchar(30) NOT NULL,
      `resume` varchar(30) NOT NULL
      */
      $part1 = "address='".$address."',city='".$city."',zipcode='".$zipcode."',state='".$state."',";
      $part2 = "gender='".$gender."', nativeLanguage='".$nativeLanguage."', secondLanguage='".$secondLanguage."', thirdLanguage='".$thirdLanguage."',";
      $part3 = "typeDL='".$typeOfLicense."',ethnicity='".$ethnicity."',ethnicityCode='".$ethnicityCode."',";
      $part4 = "height='".$height."' ,weight='".$weight."',hairColor='".$hairColor."',";
      $part5 = "eyeColor='".$eyeColor."',shirtSize='".$tshirtSize."',chestSize='".$chestSize."',waistSize='".$waistSize."',hipSize='".$hipSize."',";
      $part6 = "dressSize='".$dressSize."',pantSize='".$pantSize."',shoeSize='".$shoeSize."',piercings='".$piercings."',";
      $part7 = "desiredHourlyRate='".$desiredHourlyRate."',desiredWeeklyRate='".$desiredWeeklyRate."',ssnOrEin='".$ssnOrEin."',businessName='".$business_name."',";
      $part8 = "travel='".$travel."',insurance='".$hasProfessionalInsurance."',";
      $part9 = "bankRouting='".$DirectDepositRoutingNumber."',accountNumber='".$DirectDepositAccountNumber."'";

      $query = "UPDATE registered_staff
                SET $part1 $part2 $part3 $part4 $part5 $part6 $part7 $part8 $part9
                WHERE staffID = '".$staffID."'";

      // echo "<p>".$query."</p>";
      $result = mysqli_query($dbConnection, $query);
      if($result)
      {
        // //services
        // $services = array (
        //   0 => 'Catering Company',
        //   1 => 'Sales Executive',
        //   2 => 'Live Band',
        //   3 => 'Other',
        // );

        // //Type of experiences
        // $typeOfExperiences = array (
        //   0   => 'Brand Ambassador',
        //   1   => 'Catering Company',
        //   2   => 'Dancer',
        //   3   => 'DJ',
        //   4   => 'Field Marketing Manager',
        //   5   => 'Flyer Distributor',
        //   6   => 'Live Band',
        //   7   => 'Model',
        //   8   => 'Production Assistant',
        //   9   => 'Sales Executive',
        //   10  => 'Waiter/Waitress',
        //   11  => 'Other',
        // );

        /*
          Incoming Data:
            'experience' => 
              array (
                0 => 'Model',
                1 => 'Sales Executive',
              ),

        */

        /*
        DB Keys
            `` int(11) NOT NULL DEFAULT '0',
            ``      int(11) NOT NULL DEFAULT '0',
            ``                 int(11) NOT NULL DEFAULT '0',
            ``   int(11) NOT NULL DEFAULT '0',
            ``        int(11) NOT NULL DEFAULT '0',
            ``        int(11) NOT NULL DEFAULT '0',
        */
          $brandAmbassador        = 0;
          $dancer                 = 0;
          $fieldMarketingManager  = 0;
          $flyerDistributor       = 0;
          $model                  = 0;
          $productionAssistant    = 0;
          $salesExecutive         = 0;
          $waiterWaitress         = 0;

          //experiences
          $experience                      = $registrationData['experience'];//
          $totalTalents = count($experience);
          for($iter = 0; $iter < $totalTalents; $iter++)
          {
            //current talent
            $currTalent = $experience[$iter];

            echo "<p>$currTalent</p>";
            //removing incoming data whitespace
            $currTalent = str_ireplace(" ", "", $currTalent);
            echo "<p>after update: $currTalent</p>";


            if (strcasecmp($currTalent, "BrandAmbassador") == 0) 
            {
                $brandAmbassador = 1;
            }
            if (strcasecmp($currTalent, "dancer") == 0) 
            {
                $dancer = 1;
            }
            if (strcasecmp($currTalent, "fieldMarketingManager") == 0) 
            {
                $fieldMarketingManager = 1;
            }
            if (strcasecmp($currTalent, "flyerDistributor") == 0) 
            {
                $flyerDistributor = 1;
            }
            if (strcasecmp($currTalent, "model") == 0) 
            {
                $model = 1;
            }
            if (strcasecmp($currTalent, "productionAssistant") == 0) 
            {
                $productionAssistant = 1;
            }
            if (strcasecmp($currTalent, "salesExecutive") == 0) 
            {
                $salesExecutive = 1;
            }
            if (strcasecmp($currTalent, "waiter/Waitress") == 0) 
            {
                $waiterWaitress = 1;
            }
          }//eofl
    

          $mainPart               = "('".$staffID."', '".$brandAmbassador."', '".$dancer."', '".$fieldMarketingManager."', '".$flyerDistributor."', '".$model."', '".$productionAssistant."', '".$salesExecutive."', '".$waiterWaitress."',";
          // $djPart               = "`dJ`, `dJDescription`, `dJWebsite`, `dJSocialMedia`,";
          // $cateringCompanyPart  = "`cateringCompany`, `cateringCompanyDescription`, `cateringCompanyWebsite`, `cateringCompanySocialMedia`,";
          // $liveBandPart         = "`liveBand`, `liveBandDescription`, `liveBandWebsite`, `liveBandSocialMedia`,";
          // $otherPart            = "`other`, `otherDescription`, `otherwebsite`, `othersocialMedia`)";

          $djPart               = " '', '', '', '',";
          $cateringCompanyPart  = " '', '', '', '',";
          $liveBandPart         = " '', '', '', '',";
          $otherPart            = " '', '', '', '')";

          $talentQuery = "INSERT INTO `staff_type`(`staffID`, `BrandAmbassador`, `dancer`, `fieldMarketingManager`, `flyerDistributor`, `model`, `productionAssistant`, `salesExecutive`, `waiterWaitress`, `dJ`, `dJDescription`, `dJWebsite`, `dJSocialMedia`, `cateringCompany`, `cateringCompanyDescription`, `cateringCompanyWebsite`, `cateringCompanySocialMedia`, `liveBand`, `liveBandDescription`, `liveBandWebsite`, `liveBandSocialMedia`, `other`, `otherDescription`, `otherwebsite`, `othersocialMedia`) 
          VALUES ".$mainPart." ".$djPart." ".$cateringCompanyPart." ".$liveBandPart." ".$otherPart;
          echo "<p>$talentQuery</p>";
        

   /*
        DB Keys

            `dJ`                    int(11) NOT NULL DEFAULT '0',
            `dJDescription`         int(11) NOT NULL DEFAULT '0',
            `dJWebsite`             int(11) NOT NULL DEFAULT '0',
            `dJSocialMedia`         int(11) NOT NULL DEFAULT '0',
            `cateringCompany`       int(11) NOT NULL DEFAULT '0',
            `cateringCompanyDescription` int(11) NOT NULL DEFAULT '0',
            `cateringCompanyWebsite`     int(11) NOT NULL DEFAULT '0',
            `cateringCompanySocialMedia` int(11) NOT NULL DEFAULT '0',
            `liveBand`              int(11) NOT NULL DEFAULT '0',
            `liveBandDescription`   int(11) NOT NULL DEFAULT '0',
            `liveBandWebsite`       int(11) NOT NULL DEFAULT '0',
            `liveBandSocialMedia`   int(11) NOT NULL DEFAULT '0',
            `other`                 int(11) NOT NULL DEFAULT '0',
            `otherDescription`      int(11) NOT NULL DEFAULT '0',
            `otherwebsite`          int(11) NOT NULL DEFAULT '0',
            `othersocialMedia`      int(11) NOT NULL DEFAULT '0'

        */

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

        return 1;
      }

      return -1;
  }//eom

  /* 
  prepares the height for db storage 
    by adding the char \ in front of ' and " 
    example:
      input   5' 6"
      output  5\' 6\"
   */
  function prepareHeightValueForDBStorage($heightProvided)
  {
      //seperating height values
      $heightSplit  = explode(" ", $heightProvided);
      $heightFeet   = $heightSplit[0];
      $heightInches = $heightSplit[1];

      $heightFeet   = str_replace("'","\'", $heightFeet);
      $heightInches = str_replace('"', '\"', $heightInches);

      $newheight     = $heightFeet.$heightInches;

    return $newheight;
  }//eom

  /* gets the staff information for the search staff detail view 
    returns:
    staff data      successfully retrieved staff information
    0               database not responding
    -1              unable to retrieved staff information
   */
  function getSearchStaffDetail($userID)
  {
    $dbConnection = connectToDB();
    if(!$dbConnection)
    {
        //echo "Unable to connect to MySQL.".PHP_EOL;
      return 0;
    }

      $query = "SELECT *
                FROM registered_staff
                WHERE staffID = '".$userID."'";
      $result = mysqli_query($dbConnection, $query);

      $totalRows = mysqli_num_rows($result);
      if($totalRows > 0)
      {
        $registeredStaffResults = mysqli_fetch_array( $result, MYSQLI_ASSOC );
        return $registeredStaffResults;
      }

      return -1;
  }//eom


/**************************** NOT BEING USED NOW ********************************/

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

?>
