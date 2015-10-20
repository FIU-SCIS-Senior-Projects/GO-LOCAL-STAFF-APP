<?php

$dob = "11-29-1989";
// $newDOB = substr($dob, 6);
// $newDOB = $newDOB."-".substr($dob, 0, 5);
// $newDOB = date_create($newDOB);
// $today = date_create("today");

// // $age              = date_diff($newDOB, $today)->format("%y");
// $age              = date_diff($newDOB, $today);
// $age = $age->format("%y");


// echo $age;
 
 $result = getAge($dob);
 echo "age is ".$result;

function getAge($dob)
  {
    
    $newDOB = substr($dob, 6);
    $newDOB = $newDOB."-".substr($dob, 0, 5);
    $newDOB = date_create($newDOB);
    $today = date_create("today");

    $age   = date_diff($newDOB, $today);
    $age   = $age->format("%y");

    return $age;
  }//eom



?>