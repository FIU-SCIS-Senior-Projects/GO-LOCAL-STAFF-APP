<?php

/************************** Employer methods **********************/

    /* checks the employer provided is unique - doesnt exist in database
    returns
             1  username is unique
             0  database not responding
            -1  username is not unique
    */
    function isUniqueRegisteredEmployer( $username, $email )
    {
          $dbConnection = connectToDB();
          if(!$dbConnection)
          {
//            echo "Unable to connect to MySQL.".PHP_EOL;
            return 0;
          }

          //making sure user is a unique registration
          $query = "SELECT * from registered_employer WHERE username='".$username."' or email='".$email."'";

          // echo "<p>".$query."</p>";

          $result = mysqli_query($dbConnection, $query);
          $row = mysqli_fetch_array( $result, MYSQLI_ASSOC );
          $rowResult = array_filter($row);
          if (empty($rowResult))
          {
            // echo "<p>employer is unique</p>";
            return 1;
          }
          else
          {
            // print_r($row);
            // echo "<p>employer is NOT unique</p>";
            return -1;
          }
    }//eom

    /* register a staff 
      returns 1 successfully register
      returns 0 database not responding 
      returns -1 unsuccessfully register
    */
    function registerEmployer($registrationData)
    {
      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
        // echo "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }


      //these fields were already saved

      $employerID                     = $registrationData['employerID'];

      //gathering fields to save
      $address                        = $registrationData['address'];
      $city                           = $registrationData['city'];
      $state                          = $registrationData['state'];
      $zipCode                        = $registrationData['zipCode'];
      $employerName                   = $registrationData['employerName'];
      $typeOfEmployer                 = $registrationData['typeOfEmployer'];

      // $travel                            = $registrationData['travelPercentage'];
      // $Incorporated                      = $registrationData['Incorporated'];
      // if($Incorporated)
      // {
      //   $ssnOrEin                        = $registrationData['ein'];
      //   $business_name                   = $registrationData['business_name'];
      // }
      // else
      // {
      //   $ssnOrEin                        = $registrationData['ssn'];
      //   $business_name                   = " ";
      // }

      $hasInsurance          = $registrationData['hasInsurance'];

      // $desiredHourlyRate                = $registrationData['desiredHourlyRate'];
      // $desiredWeeklyRate                = $registrationData['desiredWeeklyRate'];

      // $DirectDeposit                    = $registrationData['DirectDeposit'];
      // if($DirectDeposit)
      // {
      //   $DirectDepositRoutingNumber     = $registrationData['DirectDepositRoutingNumber'];
      //   $DirectDepositAccountNumber     = $registrationData['DirectDepositAccountNumber'];
      // }
      // else
      // {
      //   $DirectDepositRoutingNumber     = " ";
      //   $DirectDepositAccountNumber     = " ";
      // }

      // //experiences
      // $experience                      = $registrationData['experience'];//???????


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
      $part1 = "address='".$address."',city='".$city."',zipcode='".$zipCode."',state='".$state."'";
      $part2 = "employerName='".$employerName."',typeOfEmployer='".$typeOfEmployer."',insurance='".$hasInsurance."'";
      // $part3 = "eyeColor='".$eyeColor."',shirtSize='".$tshirtSize."',chestSize='".$chestSize."',waistSize='".$waistSize."',hipSize='".$hipSize."',";
      // $part4 = "dressSize='".$dressSize."',pantSize='".$pantSize."',shoeSize='".$shoeSize."',piercings='".$piercings."',";
      // $part5 = "desiredHourlyRate='".$desiredHourlyRate."',desiredWeeklyRate='".$desiredWeeklyRate."',ssnOrEin='".$ssnOrEin."',businessName='".$business_name."',";
      // $part6 = "travel='".$travel."',insurance='".$hasProfessionalInsurance."',";
      // $part7 = "bankRouting='".$DirectDepositRoutingNumber."',accountNumber='".$DirectDepositAccountNumber."'";


      $query = "UPDATE registered_employer
                SET $part1, $part2
                WHERE employerID = '".$employerID."'";

                echo "<p>".$query."</p>";
      $result = mysqli_query($dbConnection, $query);
      if($result)
      {
        return 1;
      }

      return -1;
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
      $query = "SELECT * FROM registered_employer";
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


     /*
    Stores the credentials of user in the registered_staff table
    returns 
        staffID
        0   database not responding
        -2  Unable to store staff credentials
        -3  Unable to retrieve staffID
    */
  function storeEmployerCredentials( $employerInfo )
  {
      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
  //      echo "Unable to connect to MySQL.".PHP_EOL;
        return 0;
      }

      $fname            = $employerInfo["firstName"];//
      $middleInitial    = $employerInfo["middleName"];//
      $lname            = $employerInfo["lastName"];//
      $usernameProvided = $employerInfo["username"];//
      $emailProvided    = $employerInfo["email"];//
      $password         = $employerInfo["password"];//
      $phone            = $employerInfo["phone"];//

      //cleaning data
      $username       = mysqli_real_escape_string($dbConnection, $usernameProvided);
      $email          = mysqli_real_escape_string($dbConnection, $emailProvided);
      $hashCodeEmail  = mysqli_real_escape_string($dbConnection, md5( rand(0, 1000) ));
      $cleanPassword  = mysqli_real_escape_string($dbConnection, $password);

      //hashing password
      $options= array('cost' => 10);
      $passwordHashed = password_hash($cleanPassword, PASSWORD_BCRYPT, $options);

      $query = "INSERT INTO registered_employer ( username, password, email, hashEmail, firstName, middleInitial, lastName, phone)
            VALUES ( '".$username."', '".$passwordHashed."', '".$email."', '".$hashCodeEmail."' , '".$fname."', '".$middleInitial."', '".$lname."', '".$phone."')";
  
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
?>
