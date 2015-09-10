<html>
<header>
  <title>Go Local App</title>
</header>
<body>

  <!-- Create the form -->
  <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
     User Type: <input type="radio" name="userType" value="registeredstaff">Staff
              <input type="radio" name="userType" value="registeredcompany">Company
    <br><br>
    Username: <input type="text" name="username" value="<?php echo $username; ?>">
      <span class="error">*<?php echo $usernameError; ?></span><br><br>
    <span class="error"><?php echo $passwordMatchError; ?></span>
    Password: <input type="password" name="password">
      <span class="error">*<?php echo $passwordError; ?></span><br><br>
    Confirm Password: <input type="password" name="confirmPass">
      <span class="error">*<?php echo $passwordError; ?></span><br><br>
    <span class="error"><?php echo $emailMatchError; ?></span>
    Email: <input type="email" name="email">
      <span class="error">*<?php echo $emailError; ?></span><br><br>
    Confirm Email: <input type="email" name="confirmEmail">
      <span class="error">*<?php echo $emailError; ?></span><br><br>
    <input type="submit" value="Submit">
  </form>

  <?php
  //define variables used in the form
  $username;
  $password;
  $confirmPass;
  $email;
  $confirmEmail;
  $usernameError = "";
  $passwordError = "";
  $emailError = "";
  $passwordMatchError = "";
  $emailMatchError = "";
  $userType = "";
  $userTypeError = "";

  $db = mysqli_connect("localhost", "root", "root", "golocalapp");
  if( !$db )
    echo "Unable to connect to MySQL.".PHP_EOL;
  else
  {
    if( $_SERVER["REQUEST_METHOD"] == "POST" )
    {
      if( empty($_POST["userType"]) )
        $userTypeError = "This field is required";
      else
        $userType = $_POST["userType"];

      if( empty($_POST["username"]) )
        $usernameError = "Username is required";
      else
      {
        $username = test_input($_POST["username"]);
        // //making sure this is a unique registration
        // $query = "select * from registeredstaff where username='".$username."'";
        // $result = mysqli_query($db, $query);

        // // printf("Select returned %d rows.\n", mysqli_num_rows($result));

        
        // $row = mysqli_fetch_array( $result, MYSQLI_ASSOC );

        // //checking there was a result 
        // $rowResult = array_filter($row);
        // if (!empty($rowResult)) {
        //   print_r($row);
          
        //   echo "username is NOT unique";
         

        //   //attempting to register
        // }
      }

      if( empty($_POST["password"]) || empty($_POST["confirmPass"]) )
        $passwordError = "Passowrd is required";
      else
      {
        if( $_POST["password"] != $_POST["confirmPass"] )
          $passwordMatchError = "The passwords don't match<br>";
      }

      if( empty($_POST["email"]) || empty($_POST["confirmEmail"]) )
        $emailError = "Email is required";
      else
      {
        if( $_POST["email"] != $_POST["confirmEmail"] )
          $emailMatchError = "Emails do not match<br>";
        else
        {
          $passwordHashed = password_hash($_POST['password'], PASSWORD_BCRYPT);
          $email = $_POST["email"];

          $query = "INSERT INTO $userType (username, password, email)
                    VALUES ( '$username', '$passwordHashed', '$email' )";          
          $result = mysqli_query($db, $query);

          $to = $email;
          $subject = "GoLocalApp email verification";
          $message = "Thanks for signing up!";
          $from = "noreply@golocalpromos.com";
          mail( $to, $subject, $message );
        }
      }

    }
  }

  function test_input($data)
  {
    $data = trim($data);
    $data = stripcslashes($data);
    $data = htmlspecialchars($data);
    return $data;
  }
  
  ?>
  	
</body>
</html>