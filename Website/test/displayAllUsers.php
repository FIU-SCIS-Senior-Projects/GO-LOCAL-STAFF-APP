<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;
}
</style>
<h2>Registered Staff</h2>
<table>
  <tr>
    <th>ID</th>
    <th>Username</th> 
    <th>password</th>
    <th>Email</th> 
    <th>Email Validated</th>
  </tr>
  <?php

  require '../webAPI.php';

  $registerStaff = getAllStaff();
  $totalStaff = count($registerStaff);

    //iterating thru all staff
    for( $iter = 0; $iter < $totalStaff; $iter++ )
    {
      $currentRow = $registerStaff[$iter];
  ?>
      <tr>
        <td> <?php echo $currentRow['peopleID']; ?> </td>
        <td> <?php echo $currentRow['username']; ?> </td> 
        <td> <?php echo $currentRow['password']; ?> </td> 
        <td> <?php echo $currentRow['email']; ?> </td>
        <td> <?php echo $currentRow['emailValidated']; ?> </td>
      </tr>
  <?php
    }//eofl
  ?>
</table>

<p></p>
<hr>
<p></p>
<h2>Registered Employer</h2>
<table>
  <tr>
    <th>ID</th>
    <th>Username</th> 
    <th>password</th>
    <th>Email</th> 
    <th>Email Validated</th>
  </tr>

 <?php

  $registerEmployers = getAllEmployers();
  $totalEmployers = count($registerEmployers);

    //iterating thru all staff
    for( $iter = 0; $iter < $totalEmployers; $iter++ )
    {
      $currentRow = $registerEmployers[$iter];
  ?>
      <tr>
        <td> <?php echo $currentRow['companyID']; ?> </td>
        <td> <?php echo $currentRow['username']; ?> </td> 
        <td> <?php echo $currentRow['password']; ?> </td> 
        <td> <?php echo $currentRow['email']; ?> </td>
        <td> <?php echo $currentRow['emailValidated']; ?> </td>
      </tr>
  <?php
    }//eofl
  ?>
</table>

