<?php

$dob = date_create("1987-11-29");
$today = date_create("today");

date_diff($dob, $today)->y;

$dob = "04-16-1989";
$newDOB = substr($dob, 6);
$newDOB = $newDOB."-".substr($dob, 0, 5);

echo $newDOB;

?>