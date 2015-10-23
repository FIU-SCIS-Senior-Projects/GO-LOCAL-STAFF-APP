<?php

// if ( (5 == 5 ? true : false) )
// 	echo "true";
// else
// 	echo "false";

// $arr = array(
// 	"name" => "Wilfredo",
// 	"last" => "Gomez",
// 	"nickname" => "",
// 	 );

// $tempArray = array(
// 	"all",
// 	);

$temp = "5'8\"";

$str = $temp[0]."\\'";

$str.= $temp[2]."\\\"";

echo $str;

// $testArray = array(
// 	"list" => $arr,
// 	);

// $a = "Grabiel";

// $name = "Wilfredo Gomez $a";

// echo $name;

// echo $testArray["list"][0];

// echo count($testArray["list"]);

// $ethnicities = array(
//       "Latino or Hispanic American",
//       "South Asian or Indian American",
//       "Middle Eastern or Arab American"
//     );

// $talents = array(
// 		"Brand Ambassador",
//       	"Catering Company",
//       	"Dancer",
//       	"DJ",
//       	"Field Marketing Manager",
//       	"Flyer Distributor",
//       	"Live Band",
//       	"Model",
//       	"Production Assistant",
//       	"Sales Executive",
//       	"Waiter/Waitress",
//       	"Other",
//     );

// foreach ($talents as $key => $value) 
// {
// 	echo $value."<br>";
// }

// foreach ($talents as $key => $value) 
// {
// 	echo changeNameFormat($value)."<br>";
// }



// function changeNameFormat($field)
// {
// 	$str = str_replace(" ", "", $field);
// 	$str[0] = strtolower($str[0]);
// 	return $str;
// }

// foreach ($ethnicities as $key => $value) 
// {
// 	echo $value."<br>";
// 	$str = str_replace(" ", "", $value);
// 	// echo $str."<br>";
// 	$search = $str[0];
// 	// echo $search."<br>";
// 	$lower = strtolower($search);
// 	// echo $lower."<br>";
// 	// $str = str_replace($search, $lower, $str);
// 	$str[0] = $lower;
// 	echo $str."<br>";
// }

// foreach ($ethnicities as $key => $value) 
// {
// 	if( !strcasecmp($value, "south asian or indian american") )
// 		continue;
// 	echo $value."<br>";
// }

// echo $ethnicities[0];

// echo $arr["name"]."<br>";

// if( empty($ethnicities[5]) )
// 	echo "empty";
// else
// 	echo "has data";

// $a = "";
// $a.= "Willy";

// echo $a;

// if( !strcasecmp($arr["middle"], "gomez") )
// 	echo "egual";
// else
// 	echo "not equal";

// if( array_key_exists("", $arr) )
// 	echo "exists";
// else
// 	echo "doesn't exist";

?>