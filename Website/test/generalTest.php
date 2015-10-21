<?php

$arr = array(
	"name" => "Wilfredo",
	"last" => "Gomez",
	"nickname" => "",
	 );

// echo $arr["name"]."<br>";

// if( empty($arr["nickname"]) )
// 	echo "empty";
// else
// 	echo "has data";

// $a = "";

if( !strcasecmp($arr["middle"], "gomez") )
	echo "egual";
else
	echo "not equal";

// if( array_key_exists("", $arr) )
// 	echo "exists";
// else
// 	echo "doesn't exist";

?>