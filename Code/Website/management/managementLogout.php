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
?>
	<!--
    <script type="text/javascript">location.href = 'http://localhost:8888/GO-LOCAL-STAFF-APP/Website/management/managementLogin.php';</script>
	-->

    <script type="text/javascript">location.href = 'http://45.55.240.59/Website/management/managementLogin.php';</script>

<?php
	}

	//echo "SESSION WASN'T ACTIVE";
?>