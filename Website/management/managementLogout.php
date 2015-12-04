<?php
	session_start();

	if( !empty($_SESSION["active"]) )
	{
		// remove all session variables
        session_unset();
        // destroy the session 
        session_destroy();

        header("Location http://192.241.186.107/Website/management/managementLogin.php")
	}
?>