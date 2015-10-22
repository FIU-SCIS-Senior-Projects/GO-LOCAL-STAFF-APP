<html>
<head>
<!-- Adding BOOTSTRAP -->
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<head>
<body>
    <form method ="POST" action="">

    <div class="row">
     <div class="col-md-1"></div>
      <div class="col-lg-10">
            <?php

              require '../API.php';/* adding API */  

              $agreements = retrieveAllTermsAgreement();
              $agreementTypes = array_keys($agreements);
              $totalAgreements = count($agreementTypes);
            
                //iterating thru all agreement
                for( $iter = 0; $iter < $totalAgreements; $iter++ )
                {
                  $currAgreementType = $agreementTypes[$iter];
                  $currAgreement = $agreements[$currAgreementType];

                  $currTitle = str_replace("Agreement"," Agreement", $currAgreementType);
              ?>

                    <div class="container">
                      <h2>
                        <?php print $currTitle; ?>
                      </h2>
                      <form role="form">
                        <div class="form-group">
                          <textarea class="form-control" rows="17" name="<?php echo $currAgreementType; ?>"><?php print $currAgreement; ?></textarea>
                        </div>
                      </form>
                    </div>

                    <p >
                    <button type="submit" class="btn btn-primary pull-right" aria-label="Right Align">
                        <span class="glyphicon glyphicon-save" aria-hidden="true"> Update
                        </span>
                    </button>
                    </p>
                    <br>
                    <hr>

                  <?php
                      }
                  ?>
      </div>
     <div class="col-md-1"></div>
    </div>

    </form>
  
    <div class="row">
    <div class="col-md-1"></div>
      <div class="col-md-10">
        <?php 
              $list = $_POST;
              $totalUpdateRequest = count($list);
             
              //there is something to update
              if($totalUpdateRequest > 0)
              {
                ?>
                  <div class="panel panel-danger">
                  <div class="panel-heading">Update Results</div>
                    <div class="panel-body">
                <?php
                   $agreementToUpdate = array_keys($list);
                   $agreementToUpdate = $agreementToUpdate[0];
                   $updatedAgreement  = $list[$agreementToUpdate];

                   $updateResults     = updateTermsAgreements($agreementToUpdate, $updatedAgreement);
                    if($updateResults > 0)
                    {
                      echo "<p>successfully update '$agreementToUpdate'</p>";
                    }
                    else
                    {
                      echo "<p>unable to update '$agreementToUpdate'</p>";
                    }

                ?>
                  </div>
                  <div class="panel-footer"></div>
                </div>

                <?php
                 //refreshing page every minute
                print '<meta http-equiv="refresh" content="15">';
              }//eo-update request
        ?>
      </div>
      <div class="col-md-1"></div>
      </div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

</html>
