<?php 


function LogInServer() {
  echo "<p>testing</p>";

}

function registerStaff()
{

  LogInServer();


      /* error types:
        0 user successfully saved
        -1 un-able to connect to the database
        -2 missing required input fields 
        -3 user with that email or phone number already exist
      */
      $errorOccurred = false;
      $passwordError = ""; 
      $usernameError = "";
      $uniqueUser = false;

      //connect to database
      $db = mysqli_connect("localhost", "root", "fall2015", "golocalapp");

      if( !$db )//un-able to connect to the database
      {
        echo "Unable to connect to MySQL.".PHP_EOL;
        $errorOccurred = true;
      } 
      else //connection to the database establish
      {
        //processing POST request's
        if( $_SERVER["REQUEST_METHOD"] == "POST" )
        {
          // if( empty($_POST["password"]) || empty($_POST["confirmPass"]) )
          // {
          //   $passwordError = "Password is required";
          // }

          //validated required fields
          if( empty($_POST["username"]))
          {
            $usernameError = "username is required";
            echo $usernameError;//testing
            $errorOccurred = true;
          }
          else 
          {
            $username = $_POST["username"];
          }

          // interact with database since all required fields were filled
          if(!$errorOccurred) 
          {
              //preventing sql injections
              $username = trim($username);
              $username = stripcslashes($username);
              $username = htmlspecialchars($username);

              //making sure user is a unique registration
              $query = "select * from registeredstaff where username='".$username."'";
              $result = mysqli_query($db, $query);
              $row = mysqli_fetch_array( $result, MYSQLI_ASSOC );
              $rowResult = array_filter($row);
              if (empty($rowResult)) {

                $uniqueUser = true;

                print_r($row);
                echo "<p>username is unique</p>";
               

                //attempting to register
                // $dbUsername = $row['username'];
                // printf("Select returned %d rows.\n", mysqli_num_rows($result));
              

              }
              else
              {
                $errorOccurred= true; //user is NOT unique
              }


                /* free result set */
                // $result->close();
          }
            
        }        
      }//eo-connection to DB

      //sending reply back
      
          if($errorOccurred)
          {
            echo "<p>error occurred </p>";

          }


}//eom


?>