<?php 

/*
  retrieves the terms agreements for all users
  returns 
          agreement
          0   database not responding
          -1  Unable to retrieve agreement
*/
function retrieveAllTermsAgreement()
{
  $dbConnection = connectToDB();
  if(!$dbConnection)
  {
      //echo "Unable to connect to MySQL.".PHP_EOL;
    return 0;
  }


  $query = "SELECT *
            FROM management";

  $result = mysqli_query($dbConnection, $query);
  $totalRows = mysqli_num_rows($result);
  if($totalRows > 0)
  {

    $agreements = mysqli_fetch_array( $result, MYSQLI_ASSOC );
   
    return $agreements;
  }

  return -1;
}//eom

/*
   retrieves the terms agreements only for the user request in the parameter
  returns 
          agreement
          0   database not responding
          -1  Unable to retrieve agreement
*/
function retrieveTermsAgreement($userType)
{

  $dbConnection = connectToDB();
  if(!$dbConnection)
  {
      //echo "Unable to connect to MySQL.".PHP_EOL;
    return 0;
  }

  //checking for invalid type 
  if( ($userType != "Staff") && ($userType != "Employer") )
  {
    return -1;
  }

  //checking which type of user it is
  if(strcasecmp($userType, "Staff") == 0 )
  {
    $key = "staffAgreement";
  }
  else if(strcasecmp($userType, "Employer") == 0 )
  {
    $key  = "employerAgreement";
  }

  $query = "SELECT $key
            FROM management";

  $result             = mysqli_query($dbConnection, $query);
  $row                = mysqli_fetch_array( $result, MYSQLI_ASSOC );
  $agreementResults   = array_filter($row);

  if($agreementResults)
  {
    return $agreementResults;
  }  

  return -1;
}//eom

/* 
  updates the terms aggreements for the user provided in the parameter
    returns 
          1   agreement was succesfully updated
          0   database not responding
          -1  Unable to retrieve agreement
*/
function updateTermsAgreements($key, $updatedAgreement)
{
  $dbConnection = connectToDB();
  if(!$dbConnection)
  {
      //echo "Unable to connect to MySQL.".PHP_EOL;
    return 0;
  }

  $query = "UPDATE management
            SET  $key = '".$updatedAgreement."'";

  // echo "<p>$query</p>";
  $result = mysqli_query($dbConnection, $query);
  if($result)
  {
    return 1;
  } 

  // echo "Unable to store changes to Database";
  return -1;

}//eom

?>