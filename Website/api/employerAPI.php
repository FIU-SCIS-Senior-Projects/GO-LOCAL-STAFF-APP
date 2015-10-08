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
            echo "Unable to connect to MySQL.".PHP_EOL;
            return 0;
          }

          //making sure user is a unique registration
          $query = "SELECT * from registeredcompany WHERE username='".$username."' or email='".$email."'";

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
?>