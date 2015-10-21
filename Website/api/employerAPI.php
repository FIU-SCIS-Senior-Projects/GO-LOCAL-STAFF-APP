<?php

/************************** Employer methods **********************/

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


/************************** Registration methods **********************/

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
            //  echo "Unable to connect to MySQL.".PHP_EOL;
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

    /* register a employer 
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

      $hasInsurance                   = $registrationData['hasInsurance'];
 
      $part1 = "address='".$address."',city='".$city."',zipcode='".$zipCode."',state='".$state."'";
      $part2 = "employerName='".$employerName."',typeOfEmployer='".$typeOfEmployer."',insurance='".$hasInsurance."'";


      $query = "UPDATE registered_employer
                SET $part1, $part2
                WHERE employerID = '".$employerID."'";

      //echo "<p>".$query."</p>";
      $result = mysqli_query($dbConnection, $query);
      if($result)
      {
        return 1;
      }

      return -1;
    }//eom


    /*
    Stores the credentials of user in the registered_staff table
    returns 
        staffID
        0   database not responding
        -2  Unable to store staff credentials
        -3  Unable to retrieve staffID
    */
  function storeEmployerCredentials($employerInfo)
  {
      $dbConnection = connectToDB();
      if(!$dbConnection)
      {
       // echo "Unable to connect to MySQL.".PHP_EOL;
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



/************************** Operations methods **********************/

  /*
    Searches staff based on the below, 
    returns the following:
       staffResults   an array of all the users that fit the search criteria
        0             database not responding
        -1            no data found


    sample input:

    ageFrom = 18;
    ageTo = Any;
    email = "luoandre29@outlook.com";
    ethnicities =     (
        "Latino or Hispanic American",
        "South Asian or Indian American",
        "Middle Eastern or Arab American"
    );
    eyeColor = Any;
    gender = Male;
    hairColor = Black;
    hasPhoto = Yes;
    hasPiercings = No;
    hasTattoos = Either;
    hasWebsite = Either;
    height = "5'3\"";
    heightCondition = "At most";
    languages =     (
        English,
        Spanish,
        Italian
    );
    miles = 10;
    name = "Luis Castillo";
    phone = 3056099250;
    talents =     (
        "Catering Company",
        Dancer,
        DJ
    );
    weight = 130;
    weightCondition = atleast;
    willingToTravel = No;
    zipcode = 33016;
  */  
  function searchTalent($searchCriteria)
  {
    $finalList = array();

    $dbConnection = connectToDB();
    if(!$dbConnection)
    {
      // echo "Unable to connect to MySQL.".PHP_EOL;
      return 0;
    }

    $whereClause = "";

    /* 
      hasPhoto
      the options are: 
      @"Either",
      @"Yes",
      @"No",
    */
    if( !empty($searchCriteria["hasPhoto"]) )
    {
      if( strcasecmp($searchCriteria["hasPhoto"], "either") )
      {
        $whereClause.= "hasPhoto='".$searchCriteria[$hasPhoto]."' AND ";
      }
    }

    /* 
      hasWebsite
      the options are:
      @"Either",
      @"Yes",
      @"No",
    */
    if( !empty($searchCriteria["hasWebsite"]) )
    {
      if( strcasecmp($searchCriteria["hasWebsite"], "either") )
      {
        $whereClause.= "hasWebsite='".$searchCriteria["hasWebsite"]."' AND ";
      }
    }

    /* 
      hasTattoos
      the options are: 
      @"Either",
      @"Yes",
      @"No",
    */
    if( !empty($searchCriteria["hasTattoos"]) )
    {
      if( strcasecmp($searchCriteria["hasTattoos"], "either") )
      {
        $whereClause.= "hasTattoos='".$searchCriteria["hasTattoos"]."' AND ";
      }
    }

    /* 
      hasPiercings
      the options are: 
      @"Either",
      @"Yes",
      @"No",
    */
    if( !empty($searchCriteria["hasPiercings"]) )
    {
      if( strcasecmp($searchCriteria["hasPiercings"], "either") )
      {
        $whereClause.= "hasPiercings='".$searchCriteria["hasPiercings"]."' AND ";
      }
    }

    /* 
      gender
      options:
        @"Any",
        @"Male",
        @"Female",
    */
    if( !empty($searchCriteria["gender"]) )
    {
      if( strcasecmp($searchCriteria["gender"], "any") )
      {
        $whereClause.= "gender='".$searchCriteria["gender"]."' AND ";
      }
    }

    /* 
      age

      options:
      @"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",
      @"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",
      @"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45+",
    */
    if( !empty($searchCriteria["ageFrom"]) )
    {
      // ageFrom = 18;
      // ageTo = Any;

      if( !empty($searchCriteria["ageTo"]) )
      {
        $whereClause.= "age>='".$searchCriteria["ageFrom"]."' AND age<='".$searchCriteria["ageTo"]."' AND ";
      }
      else
      {
        $whereClause.= "age='".$searchCriteria["ageFrom"]."' AND ";
      }

    }

    /* 
      weight

      options:
      @"Any",
      @"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",
      @"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",
      @"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45+",

      conditions:
      @"at most",
      @"equal",
      @"atleast",
      @"any",
    */
    if( !empty($searchCriteria[""]) )
    {
      if( !empty($searchCriteria["weightCondition"]) )
      {
        if( !strcasecmp($searchCriteria["weightCondition", "at most") )
        {
          $whereClause.= "weight<='".$searchCriteria["weight"]."' AND ";
        }
        elseif ( !strcasecmp($searchCriteria["weightCondition", "equal") )
        {
          $whereClause.= "weight='".$searchCriteria["weight"]."' AND ";
        }
        elseif ( !strcasecmp($searchCriteria["weightCondition"], "at least") ) 
        {
          $whereClause.= "weight>='".$searchCriteria["weight"]."'";
        }
      }
    }

    /* 
      height

      feet options:
      2'
      3'
      4'
      5'
      6'
      7'

      inches options:
      0"
      1"
      2"
      3"
      4"
      5"
      6"
      7"
      8"
      9"

      conditions:
      @"At most",
      @"equal",
      @"atleast",
      @"Any",
    */ 


    /* 
      hair color

      options:
      @"Any",
      @"Auburn",
      @"Black",
      @"Blonde",
      @"Brown",
      @"Grey",
      @"Red",
      @"White",
      @"Other",
    */ 


    /* 
      eye color

      options:
      @"Any",
      @"Amber",
      @"Blue",
      @"Brown",
      @"Gray",
      @"Green",
      @"Hazel",
      @"Other",
    */ 

    /* 
      miles

      options:
      @"5",
      @"10",
      @"15",
      @"25",
      @"50",
      @"100+",
    */ 


      /*
        ethnicity

        options:
        @"All",
        @"Non-Hispanic White or Euro-American",
        @"Black, Afro-Caribbean, or African American",
        @"Latino or Hispanic American",
        @"East Asian or Asian American",
        @"South Asian or Indian American",
        @"Middle Eastern or Arab American",
        @"Native American or Alaskan Native",
        @"Other",
      */


      /*
        talents

        options:
        @"Brand Ambassador",
        @"Catering Company",
        @"Dancer",
        @"DJ",
        @"Field Marketing Manager",
        @"Flyer Distributor",
        @"Live Band",
        @"Model",
        @"Production Assistant",
        @"Sales Executive",
        @"Waiter/Waitress",
        @"Other",
      */


      /*
        languages:

        options:

        @"English",
        @"Spanish",
        @"Arabic",
        @"French",
        @"German",
        @"Italian",
        @"Japanese",
        @"Madarin",
        @"Portuguese",
        @"Russian",
      */


      /*
        willing to travel:

        options:
        @"Maybe",
        @"Yes",
        @"No",
      */

    

    $query = "SELECT * 
              FROM registered_staff";

    $result     = mysqli_query($dbConnection, $query);
    $totalRows  = mysqli_num_rows($result);
    if($totalRows > 0)
    {
      while( $row = mysqli_fetch_array( $result, MYSQLI_ASSOC ) )
      {
        array_push($finalList, $row);
      }

      return $finalList;
    }

    return -1;
  }//eom


/**************************** NOT BEING USED NOW ********************************/
  
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


/*************** Helper Methods ***************************/

?>
