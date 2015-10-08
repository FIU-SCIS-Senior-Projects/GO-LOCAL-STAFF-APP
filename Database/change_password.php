<?php

$db = mysqli_connect("localhost", "root", "NEW PASSWORD", "mysql");
//Check connection
if( mysqli_connect_errno() )
  echo "Unable to connect to MySQL: ".mysqli_connect_error();
else
{
	$query = "UPDATE user 
			  SET Password=PASSWORD('root') 
			  WHERE User='root'";

	if( $result = mysqli_query($db, $query) )
		echo "Query ran successfully";
	else
		echo "Query couldn't run!";


}

?>