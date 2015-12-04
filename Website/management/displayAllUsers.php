<?php
    // Start the session
    session_start();

    if( empty($_SESSION["active"]) )
    {
?>
    <script type="text/javascript">location.href = 'http://192.241.186.107/Website/management/managementLogin.php';</script>
    <!--<script type="text/javascript">location.href = 'http://localhost:8888/GO-LOCAL-STAFF-APP/Website/management/managementLogin.php';</script>-->
<?php    
    }
?>

<html>
<head>
<!-- Adding BOOTSTRAP -->
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">


  <nav class="navbar navbar-inverse">
   <div class="container-fluid">
        <ul class="nav navbar-nav navbar-left">
        <li class=active>
          <a>Admin</a>
        </li>
      </ul>
     <!-- HOME -->
     <div class="navbar-header"> 
       <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="navbar-collapse-1">
         <span class="sr-only">Toggle navigation</span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
       </button>
        <!-- <a class="navbar-brand" href="http://smartdevelopercareersearch.mybluemix.net/">Home</a> -->
     </div>

     <div class="collapse navbar-collapse" id="navbar-collapse-1"> 
        <ul class="nav navbar-nav navbar-left">
         <li class="active">
         </li>
       </ul>
       <ul class="nav navbar-nav navbar-right">
         <li class="inactive">
            <a href="http://192.241.186.107/Website/management/managementLogout.php">
            <!--<a href="http://localhost:8888/GO-LOCAL-STAFF-APP/Website/management/managementLogout.php">-->
                Logout
                <span class="sr-only">(current)
                </span>
            </a>
         </li>
       </ul>
     </div>
   </div>
 </nav>



<head>
<body>
    <form method ="POST" action="">

    <div class="row">
     <div class="col-md-1"></div>
      <div class="col-lg-10">

            <!-- creating registered staff list -->
            <?php

              require '../API.php';/* adding API */  

              $registerStaff = getAllStaff();
              $totalStaff = count($registerStaff);
              // print_r($registerStaff[0]);//testing
            ?>

            <!--
            <h2>
                <button type="submit" class="btn btn-primary" aria-label="Left Align">
                    Logout
                    <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>
                    <a href="http://bing.com"></a>
                </button>
            </h2>
            -->

            <h2>
            Registered Staff
            <?php echo "[$totalStaff]"; ?>
            </h2>
            <table class="table table-striped">
              <tr>
                <th>ID</th>
                <th></th>
                <th></th>
                <th>Username</th> 
                <th>Email</th> 
              </tr>
              <?php

                //iterating thru all staff
                for( $iter = 0; $iter < $totalStaff; $iter++ )
                {
                  $currentRow = $registerStaff[$iter];
                  // print_r($currentRow);
                  $peopleID = $currentRow['staffID'];
              ?>
                  <tr>
                    <td> 

                      <?php print '<div id="registeredStaffCollapse_'.$peopleID.'">'; ?>
                      <?php print '<a class="btn btn-primary" href="#registeredStaff'.$peopleID.'" data-toggle="collapse">'; ?> 
                          <?php echo $peopleID; ?> 
                        </a>
                      </div>
                    </td>
                    <td>  
                      <label class="radio-inline">
                        <?php print '<input type="radio"  name="staff" value ="'.$peopleID.'">'; ?>
                      </label>
                    </td>
                    <!-- user image -->
                    <td> 
                        <img src="../uploads/<?php echo $currentRow['imageName']; ?>" 
                             alt="<?php echo $currentRow['imageName']; ?>" 
                             style="width:170px;height:150px;">
                    </td>
                    <td> <?php echo $currentRow['username']; ?> </td> 
                    <td> <?php echo $currentRow['email']; ?> </td>
                    </tr>
                    <!-- rest of registered user data goes below: -->
                    <tr>
                    <td>
                        <?php print '<div id="registeredStaff'.$peopleID.'" class="collapse">'; ?> 
                        <table class="table table-condensed" align="center">
                        <tbody>
                         <tr>
                            <td><b>staffType</b></td> 
                            <td> <?php echo $currentRow['staffType']; ?> </td>  
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>username</b></td> 
                            <td> <?php echo $currentRow['username']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>password</b></td> 
                            <td> <?php echo $currentRow['password']; ?> </td>  
                          </tr>
                           <tr>
                            <td><b>email</b></td> 
                            <td> <?php echo $currentRow['email']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>emailValidated</b></td> 
                            <td> <?php echo $currentRow['emailValidated']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>hashEmail</b></td> 
                            <td> <?php echo $currentRow['hashEmail']; ?> </td>    
                          </tr>
                          <tr>                        
                            <td><b>firstName</b></td> 
                            <td> <?php echo $currentRow['firstName']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>                         
                            <td><b>middleInitial</b></td>      
                            <td> <?php echo $currentRow['middleInitial']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td> 
                            <td><b>lastName</b></td>           
                            <td> <?php echo $currentRow['lastName']; ?> </td> 
                          </tr>
                          <tr>
                            <td><b>nickname</b></td>           
                            <td> <?php echo $currentRow['nickname']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td> 
                          <!-- <td><b>email</b></td>               -->
                            <td><b>address</b></td>            
                            <td> <?php echo $currentRow['address']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>phone</b></td>              
                            <td> <?php echo $currentRow['phone']; ?> </td> 
                            <td></td>
                          </tr>
                          <tr>
                            <td><b>phoneCode</b></td>          
                            <td><?php echo $currentRow['phoneCode']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>                        
                            <td><b>phoneValidated</b></td>  
                            <td><?php echo $currentRow['phoneValidated']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>                         
                            <td><b>profession</b></td> 
                            <td><?php echo $currentRow['profession']; ?> </td>
                            <td></td> 
                           </tr>    
                          <tr>                             
                            <td><b>imageName</b></td> 
                            <td><?php echo $currentRow['imageName'] ?> </td> 
                             <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>                              
                            <td><b>website</b></td> 
                            <td><?php echo $currentRow['website']; ?> </td> 
                             <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>                              
                            <td><b>socialMedia</b></td>
                            <td><?php echo $currentRow['socialMedia']; ?> </td>
                            <td></td> 
                          <!-- <td><b>pictures</b></td>            -->
                          </tr>
                          <tr> 
                            <td><b>dateOfBirth</b></td> 
                            <td><?php echo $currentRow['dateOfBirth']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>age</b></td>  
                            <td>
                                <?php 
                                        echo $currentRow['age'];
                                  ?> 
                            </td> 
                          </tr>
                            <td><b>gender</b></td>  
                            <td>
                                <?php 
                                      $gender = $currentRow['gender'];
                                      if($gender)
                                      {
                                        echo "male";
                                      }
                                      else{
                                        echo "female";
                                      }
                                  ?> 
                            </td> 
                          </tr>
                            <tr>        
                            <td><b>nativeLanguage</b></td>
                            <td><?php echo $currentRow['nativeLanguage']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>            
                            <td><b>secondLanguage</b></td>  
                            <td><?php echo $currentRow['secondLanguage']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>            
                            <td><b>thirdLanguage</b></td>  
                            <td><?php echo $currentRow['thirdLanguage']; ?> </td>
                          </tr> 
                          <tr>        
                            <td><b>typeDL</b></td>
                            <td><?php echo $currentRow['typeDL']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>            
                            <td><b>ethnicity</b></td>  
                            <td><?php echo $currentRow['ethnicity']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>            
                            <td><b>ethnicityCode</b></td>  
                            <td><?php echo $currentRow['ethnicityCode']; ?> </td>
                          </tr> 
                          <tr>      
                            <td><b>height</b></td> 
                            <td><?php echo $currentRow['height']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>            
                            <td><b>weight</b></td> 
                            <td><?php echo $currentRow['weight']; ?> </td> 
                          </tr>
                          <tr>           
                            <td><b>hairColor</b></td>
                            <td><?php echo $currentRow['hairColor']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>eyeColor</b></td>
                            <td><?php echo $currentRow['eyeColor']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>                        
                            <td><b>dressSize</b></td> 
                            <td><?php echo $currentRow['dressSize']; ?> </td>  
                          </tr>
                          <tr>           
                            <td><b>shirtSize</b></td>   
                            <td><?php echo $currentRow['shirtSize']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>       
                            <td><b>pantSize</b></td>
                            <td><?php echo $currentRow['pantSize']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>           
                            <td><b>chestSize</b></td> 
                            <td><?php echo $currentRow['chestSize']; ?> </td>                         
                          </tr>
                          <tr>         
                            <td><b>waistSize</b></td> 
                            <td><?php echo $currentRow['waistSize']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>hipSize</b></td> 
                            <td><?php echo $currentRow['hipSize']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>shoeSize</b></td> 
                            <td><?php echo $currentRow['shoeSize']; ?> </td>  
                          </tr>
                          <tr>        
                            <td><b>tattoos</b></td>  
                            <td><?php echo $currentRow['tattoos']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>piercings</b></td>   
                            <td><?php echo $currentRow['piercings']; ?> </td> 
                          </tr>   
                          <tr>    
                            <td><b>desiredHourlyRate</b></td>  
                            <td><?php echo $currentRow['desiredHourlyRate']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>desiredWeeklyRate</b></td>   
                            <td><?php echo $currentRow['desiredWeeklyRate']; ?> </td> 
                          </tr>
                          <tr>   
                            <td><b>ssnOrEin</b></td> 
                            <td><?php echo $currentRow['ssnOrEin']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>         
                            <td><b>businessName</b></td>
                            <td><?php echo $currentRow['businessName']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>             
                            <td><b>travel</b></td>
                            <td><?php echo $currentRow['travel']; ?> </td> 
                          </tr>
                          <tr>                    
                            <td><b>insurance</b></td>
                            <td><?php echo $currentRow['insurance']; ?> </td>  
                          </tr>
                          <!-- <td><b>insuranceDocuments</b></td>  -->
                          <tr>                       
                            <td><b>bankRouting</b></td>
                            <td><?php echo $currentRow['bankRouting']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>                              
                            <td><b>accountNumber</b></td>
                            <td><?php echo $currentRow['accountNumber']; ?> </td> 
                          </tr>
                            <tr>   
                            <td><b>accountLocked</b></td> 
                            <td><?php echo $currentRow['accountLocked']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>         
                            <td><b>forgotPasswordCode</b></td>
                            <td><?php echo $currentRow['forgotPasswordCode']; ?> </td> 
                          </tr>
                            <tr>   
                            <td><b>loginRequests</b></td> 
                            <td><?php echo $currentRow['loginRequests']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>  
                            <td><b>forgotPasswordRequests</b></td>
                            <td><?php echo $currentRow['forgotPasswordRequests']; ?> </td> 
                          </tr>
                        </tbody>
                        </table>
                    </td>
                    </tr>
                  
              <?php
                }//eofl
              ?>
            </table>

            <button type="submit" class="btn btn-danger" aria-label="Left Align">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"> 
                </span>
              </button>
            <p></p>
            <hr>
            <p></p>
            <?php
              $registerEmployers = getAllEmployers();
              $totalEmployers = count($registerEmployers);
              // print_r($registerEmployers[0]);//testing
            ?>
              <h2>
                Registered Employer
                <?php echo "[$totalEmployers]"; ?>
            </h2>
            <table class="table table-striped">
              <tr>
                <th>ID</th>
                <th></th>
                <th>Username</th> 
                <th>Email</th> 
              </tr>

             <?php

                //iterating thru all staff
                for( $iter = 0; $iter < $totalEmployers; $iter++ )
                {
                  $currentRow = $registerEmployers[$iter];
                  $employerID = $currentRow['employerID'];
              ?>
                  <tr>
                    <td> 
                      <?php print '<div id="registeredEmployerCollapse_'.$employerID.'">'; ?>
                      <?php print '<a class="btn btn-primary" href="#registeredEmployer'.$employerID.'" data-toggle="collapse">'; ?> 
                          <?php echo $employerID; ?> 
                        </a>
                      </div>
                    </td>
                    <td>  
                      <label class="radio-inline">
                        <?php print '<input type="radio"  name="employer" value ="'.$employerID.'">'; ?>
                      </label>
                    </td>                
                    <td> <?php echo $currentRow['username']; ?> </td> 
                    <td> <?php echo $currentRow['email']; ?> </td>
                    </tr>
                    <tr>
                   <td>
                        <?php print '<div id="registeredEmployer'.$employerID.'" class="collapse">'; ?> 
                        <table class="table table-condensed" align="center">
                        <tbody>
                         <tr>
                            <td><b>employerName</b></td> 
                            <td> <?php echo $currentRow['employerName']; ?> </td>  
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>username</b></td> 
                            <td> <?php echo $currentRow['username']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>password</b></td> 
                            <td> <?php echo $currentRow['password']; ?> </td>   
                          </tr>
                           <tr>
                            <td><b>email</b></td> 
                            <td> <?php echo $currentRow['email']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>emailValidated</b></td> 
                            <td> <?php echo $currentRow['emailValidated']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>hashEmail</b></td> 
                            <td> <?php echo $currentRow['hashEmail']; ?> </td>    
                          </tr>
                          <tr>                        
                            <td><b>firstName</b></td> 
                            <td> <?php echo $currentRow['firstName']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>                         
                            <td><b>middleInitial</b></td>      
                            <td> <?php echo $currentRow['middleInitial']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td> 
                            <td><b>lastName</b></td>           
                            <td> <?php echo $currentRow['lastName']; ?> </td> 
                          </tr>
                          <tr>
                            <td><b>typeOfEmployer</b></td>           
                            <td> <?php echo $currentRow['typeOfEmployer']; ?> </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td> 
                            <td><b>email</b></td>              
                            <td><b>address</b></td>            
                            <td> <?php echo $currentRow['address']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>city</b></td>            
                            <td> <?php echo $currentRow['city']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><b>state</b></td>              
                            <td> <?php echo $currentRow['state']; ?> </td> 
                            <td></td>
                            <td><b>zipcode</b></td>              
                            <td> <?php echo $currentRow['zipcode']; ?> </td> 
                            <td></td>
                          </tr>
                          <tr>
                             <td><b>phone</b></td>          
                            <td><?php echo $currentRow['phone']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td> 
                            <td><b>phoneCode</b></td>          
                            <td><?php echo $currentRow['phoneCode']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>                        
                            <td><b>phoneValidated</b></td>  
                            <td><?php echo $currentRow['phoneValidated']; ?> </td>
                           </tr>    
                          <tr>                             
                            <td><b>insurance</b></td> 
                            <td><?php echo $currentRow['insurance']; ?> </td> 
                          </tr>                      
                          <tr>                             
                            <td><b>insuranceDocuments</b></td> 
                            <td><?php echo $currentRow['insuranceDocuments']; ?> </td> 
                          </tr>
                          <tr>   
                            <td><b>accountLocked</b></td> 
                            <td><?php echo $currentRow['accountLocked']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>         
                            <td><b>forgotPasswordCode</b></td>
                            <td><?php echo $currentRow['forgotPasswordCode']; ?> </td> 
                          </tr>
                           <tr>   
                            <td><b>loginRequests</b></td> 
                            <td><?php echo $currentRow['loginRequests']; ?> </td> 
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>         
                            <td><b>forgotPasswordRequests</b></td>
                            <td><?php echo $currentRow['forgotPasswordRequests']; ?> </td> 
                          </tr>

                        </tbody>
                        </table>
                    </td>
                    </tr>
              <?php
                }//eofl
              ?>
            </table> 

              <button type="submit" class="btn btn-danger" aria-label="Left Align">
                  <span class="glyphicon glyphicon-remove" aria-hidden="true"> 
                  </span>
                </button>
               

        </div>
        <div class="col-md-1"></div>
    </div>


    <div class="row">
     <div class="col-md-1"></div>
      <div class="col-lg-10" align="center">
      
            <br>
            <br>
            <button type="submit" class="btn btn-danger">
                <label class="radio-inline">
                    <input type="radio" name="clearAllJSONTestFiles">
                    clear All JSON Test Files
                </label>
            </button>
            <br>
            <br>
            <br>
            <br>
      </div>
     <div class="col-md-1"></div>
    </div>



    <div class="row">
    <div class="col-md-1"></div>
      <div class="col-md-10">
        <?php 
              $list = $_POST;
              $totalDeleteRequest = count($list);
             
              //there is something to delete
              if($totalDeleteRequest > 0)
              {
                ?>
                  <div class="panel panel-danger">
                  <div class="panel-heading">Delete Results</div>
                    <div class="panel-body">
                <?php
                   $listKeys = array_keys($list);
                    for($iter = 0; $iter < $totalDeleteRequest; $iter++)
                    {
                        $currentType = $listKeys[$iter];
                        $currentID = $list[$currentType];

                        if($currentType == 'clearAllJSONTestFiles')
                        {
                            // clearing all jsons files
                            echo "<pre>removing all test files</pre>";
                            $command = "rm ../test/*.json";
                            $result = shell_exec($command);                             

                            //displaying all files
                            $command = "ls ../*/*";
                            $result = shell_exec($command);                             
                            echo "<pre>$result</pre>";
                        }
                        else if($currentType != "employer" || $currentType != "staff" )
                        {
                          $deleteResult = deleteRegisteredUser($currentID, $currentType);
                          // echo "<p>delete result: $deleteResult</p>";
                          if($deleteResult > 0)
                          {
                            echo "<p>Registered $currentType with ID#$currentID successfully delete</p>";
                          }
                          else
                          {
                            echo "<p>unable to delete the registered $currentType with ID#$currentID</p>";
                          }
                        }//eo
                        

                    }//eofl

                ?>
                  </div>
                  <div class="panel-footer"></div>
                </div>

                <?php
                    //refreshing page after a few seconds
                    // print '<meta http-equiv="refresh" content="3">';
              }//eo-delete request

              //refreshing page every minute
              print '<meta http-equiv="refresh" content="30">';

        ?>
      </div>
      <div class="col-md-1"></div>
      </div>

    </form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

</html>
