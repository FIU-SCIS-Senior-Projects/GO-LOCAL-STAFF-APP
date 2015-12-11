<?php

require "../functions.php";

//echo "my dir: ".getcwd();

function registerUser($post)
{
	$errorInFields = 0;
	$existingUser = false;

	if( empty($post["userType"]) )
      $errorInFields = 1;
    else
      $userType = $post["userType"];

    if( empty($post["username"]) )
      $errorInFields = 1;
    else
      $username = $post["username"];

    if( empty($post["password"]) || empty($post["confirmPass"]) )
      $errorInFields = 1;
    else
    {
      if( $post["password"] != $post["confirmPass"] )
        $errorInFields = 1;
    }

    if( empty($_POST["email"]) || empty($_POST["confirmEmail"]) )
    	$errorInFields = 1;
    else
    {
    	if( $_POST["email"] != $_POST["confirmEmail"] )
    		$errorInFields = 1;
    	else
    	{

          	$passwordHashed = password_hash($post['password'], PASSWORD_BCRYPT);
          	echo "HASHED: ".$passwordHashed."<br>";

          	$email = $post["email"];

          	$query = "SELECT username FROM $userType WHERE username='".$username."'";

          	$result = queryDB( $query );

          	if( mysqli_num_rows($result) != 0 )
          	{
          		$existingUser = true;
            	echo "Username is already in use";
          	}

	        $query = "SELECT email FROM $userType WHERE email='".$email."'";

	        $result = queryDB( $query );

	        if( mysqli_num_rows($result) != 0 )
	        {
	        	$existingUser = true;
	            echo "Email is already registered";
	        }

	        if( !$existingUser )
	        {
	        	$hash = md5( rand(0, 1000) );
	        	echo "HASH: ".$hash."<br>";
	            $query = "INSERT INTO ".$post["userType"]. " (username, password, email, hashEmail)
	                      VALUES (
	                        '".$post["username"]."',
	                        '".$passwordHashed."',
	                        '".$post["password"]."',
	                        '".$hash."');";

				$result = queryDB( $query );

	        }

    	}
    }



























    if( $errorInFields )
    	echo "There is an error in the fields";
}





?>