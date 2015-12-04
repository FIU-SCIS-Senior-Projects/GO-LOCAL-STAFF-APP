<?php
	session_start();

	//echo "INSIDE LOGOUT"."<br>";

	if( !empty($_SESSION["active"]) )
	{
		//echo "THERE IS A SESSION ACTIVE"."<br>";
		// remove all session variables
        session_unset();
        // destroy the session 
        session_destroy();

        //header("Location http://192.241.186.107/Website/management/managementLogin.php");
        //header("Location http://localhost:8888/GO-LOCAL-STAFF-APP/Website/management/managementLogin.php");
?>
	<!--
    <script type="text/javascript">location.href = 'http://localhost:8888/GO-LOCAL-STAFF-APP/Website/management/managementLogin.php';</script>
	-->

    <script type="text/javascript">location.href = 'http://192.241.186.107/Website/management/managementLogin.php';</script>

<?php
	}

	//echo "SESSION WASN'T ACTIVE";
?>