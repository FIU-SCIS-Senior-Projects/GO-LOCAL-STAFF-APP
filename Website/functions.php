<?php

function authenticateEmail( $type, $email, $hash )
{
	$db = mysqli_connect( "localhost", "root", "root", "golocalapp" );

	if( mysqli_connect_errno() )
		echo "Unable to connect to MySQL: ".mysqli_connect_error();

	$userType = mysqli_real_escape_string($type);
	$emailRevised = mysqli_real_escape_string($email);
	$hashRevised = mysqli_real_escape_string($hash);

	$query = "SELECT email, hash, emailValidated
			  FROM ".$userType." 
			  WHERE email='".$emailRevised."'
			  AND hash='".$hashRevised."'
			  AND emailValidated='0'";

	$result = mysqli_query( $db, $query )

	if( mysqli_num_rows > 0 )
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

?>