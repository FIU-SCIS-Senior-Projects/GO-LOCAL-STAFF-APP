<?php

//Verifies email addressed from the link previously sent
function authenticateEmail( $type, $email, $hash )
{
	$db = mysqli_connect( "localhost", "root", "fall2015", "golocalapp" );

	if( mysqli_connect_errno() )
		echo "Unable to connect to MySQL: ".mysqli_connect_error();

	$userType = mysqli_real_escape_string($db, $type);
	$emailRevised = mysqli_real_escape_string($db, $email);
	$hashRevised = mysqli_real_escape_string($db, $hash);

	$query = "SELECT email, hash, emailValidated FROM ".$userType." 
			 WHERE email='".$emailRevised."' 
			 AND hash='".$hashRevised."' 
			 AND emailValidated='0'";

	if( $result = mysqli_query( $db, $query ) )
	{
		$rows = mysqli_num_rows($result);

		if( $rows > 0 )
		{
			$query = "UPDATE ".$userType." 
					  SET emailValidated = 1 
					  WHERE email='".$emailRevised."' 
					  AND hash='".$hashRevised."' 
					  AND emailValidated='0'";

			$result = mysqli_query( $db, $query );
			echo "Your email has been verified!";
		}
		else
		{
			echo "We're sorry but we weren't able to verify your email";
		}
	}
	else
		echo "Unable to execute the query";
}

function test_input($data)
{
	$data = trim($data);
	$data = stripcslashes($data);
	$data = htmlspecialchars($data);
	return $data;
}

function retrievePeopleID( $username )
{
	$peopleID;

	$db = mysqli_connect( "localhost", "root", "fall2015", "golocalapp" );

	$type = mysqli_real_escape_string( $db, $_GET["type"] );
    // $username = mysqli_real_escape_string( $db, $_GET["username"] );	

    if( mysqli_connect_errno() )
        echo "Unable to connect to MySQL: ".mysqli_connect_error();
    else
    {
    	$query = "SELECT peopleID FROM registeredstaff WHERE username='".$username."'";

	    if( $result = mysqli_query( $db, $query ) )
	    {
	        if( mysqli_num_rows($result) > 0 )
	        {
	            $row = mysqli_fetch_assoc($result);
	            $peopleID = $row["peopleID"];
	        }
	        else
	            header("Location: http://localhost/GO-LOCAL-STAFF-APP/website/");
	    }
	    else
	    {
	        echo "Unable to query the Database!";
	    }
    }

    return $peopleID;
}

function queryDB( $query )
{
	$db = mysqli_connect( "locahot", "root", "fall2015", "golocalapp" );

	if( mysqli_connect_errno() )
		echo "unable to connect to MySQL: ".mysqli_connect_error();
	else
	{
		if( !$result = mysqli_query($db, $query) )
			echo "Unable to query the databse";
	}

	return $result;
}

function storePersonalInfo( $peopleID, $fname, $middleInitial, $lname, $nickname, $address, $phone)
{
	$db = mysqli_connect( "localhost", "root", "fall2015", "golocalapp" );

	if( mysqli_connect_errno() )
		echo "unable to connect to MySQL: ".mysqli_connect_error();
	else
	{
		$email;
		$query = "SELECT email FROM registeredstaff WHERE peopleID='".$peopleID."'";

		if( $result = mysqli_query( $db, $query ) )
		{
			if( mysqli_num_rows($result) > 0 )
			{
				$row = mysqli_fetch_assoc($result);
				$email = $row["email"];
			}
			else
				echo "There is no individual with that ID";
		}
		else
			echo "There was a problem with your query";

		$query = "INSERT INTO people ( peopleID, firstName, middleInitial, lastName, nickname, email, address, phone)
				  VALUES ('".$peopleID."', '".$fname."', '".$middleInitial."', '".$lname."', '".$nickname."', '".$email."', '".$address."', '".$phone."')";

		if( !$result = mysqli_query($db, $query) )
			echo "There was a problem with your query";
	}
}

function authenticatePhoneNumber( $peopleID, $to, $smsGateway )
{
	$code = mt_rand(1000, 9999);

	$db = mysqli_connect( "localhost", "root", "fall2015", "golocalapp" );

	if( mysqli_connect_errno() )
		echo "unable to connect to MySQL: ".mysqli_connect_error();
	else
	{
		//$query = "INSERT INTO people ( phone, phonecode )
		//		  VALUES ('".$to."', '".$code."')";

		$query = "UPDATE people
				  SET phone='".$to."', phonecode='".$code."'
				  WHERE peopleID=".$peopleID."";

		if( !$result = mysqli_query( $db, $query ) )
			echo "Unable to store the code to the Database";
	}

	$subject = "Your code you is:\r\n";
	mail( $to.$smsGateway, $subject, $code );
}

function getGateway( $carrier )
{
	$gateway = "";

	$smsGateways = [
		"aio" => "@mms.aiowireless.net",
		"att" => "@text.att.net",
		"boostMobile" => "@myboostmobile.com",
		"cricket" => "@mms.cricketwireless.net",
		"metropcs" => "@mymetropcs.com",
		"sprint" => "@pm.sprint.com",
		"straightTalk" => "@vtext.com",
		"tmobile" => "@tmomail.net",
		"usCelular" => "@email.uscc.net",
		"verizon" => "@vtext.com",
	];

	if( array_key_exists($carrier, $smsGateways) )
	{
		$gateway = $smsGateways["$carrier"];
	}
	
	return $gateway;

}

/*
	
*/
function peopleUserExists( $username, $email )
{

	$db = mysqli_connect( "localhost", "root", "fall2015", "golocalapp" );

	if( mysqli_connect_errno() )
		echo "Unable to connect to MySQL: ".mysqli_connect_error();
	else
	{
		$username = mysqli_real_escape_string($db, $username);
		$email = mysqli_real_escape_string($db, $email);

		$query = "SELECT username, email
				  FROM registeredstaff
				  WHERE username='".$username."'
				  OR email='".$email."'";

		if( $result = mysqli_query($db, $query) )
		{
			if( mysqli_num_rows($result) == 0 )
				return false;
			else
				return true;
		}
		else
			echo "Unable to query the Database";
	}
}

// /*
// 	Stores the credentials of user in the registeredstaff table
// 	returns 
// 		 peopleID 					
// 	*/
// function storeStaffCredentials( $username, $password, $email )
// {
// 	$db = mysqli_connect( "localhost", "root", "fall2015", "golocalapp" );

// 	$peopleID = "";
// 	$username = mysqli_real_escape_string($db, $username);
// 	$email = mysqli_real_escape_string($db, $email);
// 	$hashCodeEmail = mysqli_real_escape_string($db, md5( rand(0, 1000) ));
// 	$passwordHashed = password_hash($password, PASSWORD_BCRYPT);

// 	if( mysqli_connect_errno() )
// 		echo "Unable to connect to MySQL: ".mysqli_connect_error();
// 	else
// 	{
// 		$query = "INSERT INTO registeredstaff ( username, password, email, hash )
// 				  VALUES ( '".$username."', '".$passwordHashed."', '".$email."', '".$hashCodeEmail."' )";

// 		if( !$result = mysqli_query($db, $query) )
// 			echo "Unable to store staff credentials";

// 		$query = "SELECT peopleID
// 				  FROM registeredstaff
// 				  WHERE username='".$username."'";

// 		if( !$result = mysqli_query($db, $query) )
// 			echo "Unable to retrieve peopleID";
// 		else
// 		{
// 			if( mysqli_num_rows($result) > 0 )
// 			{
// 				$row = mysqli_fetch_assoc($result);
// 				$peopleID = $row["peopleID"];

// 				sendEmail( $username, $email, "registeredstaff", $hashCodeEmail );
// 			}
// 			else
// 				echo "Username doens't exists";
// 		}
// 	}

// 	return $peopleID;
// }

function storePersonalDOB( $peopleID, $dob )
{
	$db = mysqli_connect( "localhost", "root", "fall2015", "golocalapp" );

	$dob = mysqli_real_escape_string($db, $dob);

	if( mysqli_connect_errno() )
		echo "Unable to connect to MySQL: ".mysqli_connect_error();
	else
	{
		$query = "UPDATE people
				  SET dateOfBirth='".$dob."'
				  WHERE peopleID='".$peopleID."'";

		if( !$result = mysqli_query($db, $query) )
			echo "We couldn't update the DOB";
	}
}

function sendEmail( $username, $email, $userType, $hash )
{
	$to = $email;
    $subject = "GoLocalApp email verification";
    //message to be sent to verify the email address.
    $message = "            

      Thanks for signing up!
      Your account has been created, you can login with the following credentials after you have activated your account by pressing the url below.
       
      ------------------------
      Username: ".$username."
      ------------------------
       
      Please click this link to activate your account:
      http://45.55.208.175/Website/verify.php?type=".$userType."&email=".$email."&hash=".$hash."
       
      ";

    $headers = "From:noreply@golocalpromos.com"."\r\n";
    mail( $to, $subject, $message, $headers );
}

?>