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

	$db = mysqli_connect( "localhost", "root", "root", "golocalapp" );

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
	$db = mysqli_connect( "locahot", "root", "root", "golocalapp" );

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
	$db = mysqli_connect( "localhost", "root", "root", "golocalapp" );

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

function authenticatePhoneNumber( $to, $smsGateway )
{
	$code = mt_rand(1000, 9999);

	$db = mysqli_connect( "localhost", "root", "root", "golocalapp" );

	if( mysqli_connect_errno() )
		echo "unable to connect to MySQL: ".mysqli_connect_error();
	else
	{
		$query = "INSERT INTO people ( phonecode )
				  VALUES ('".$code."')";

		if( !$result = mysqli_query( $db, $query ) )
			echo "Unable to store the code to the Database";
	}

	$subject = "Your code you is:\r\n";
	mail( $to.$smsGateway, $subject, $code );
}

function getGateway( $carrier )
{
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
		return $smsGateways["$carrier"];
	else
		return null;

}

?>