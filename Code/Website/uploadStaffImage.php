<html>
  <head>
    <link rel="stylesheet" href="myCSS.css" type="text/css">
    <title>File Upload</title>
  </head>
  <body>
    <div class="fileuploadholder">
      <form action="" method="POST" enctype="multipart/form-data" name="FileUploadForm" id="FileUploadForm">
        <label for="UploadFile"></label>
        <input type="file" name="UploadFile" id="UploadFile"></input>
        <input type="submit" name="UploadButton" id="UploadButton" value="Upload"></input>
      </form>
    </div>
  </body>
</html>

<?php 

  uploadFile();

  function uploadFile()
  {
    if( isset($_FILES['UploadFile']) )
    {
      $UploadName = $_FILES['UploadFile']['name'];
      $UploadName = mt_rand(0,mt_getrandmax()).$UploadName;
      $UploadTmp  = $_FILES['UploadFile']['tmp_name'];
      $UploadType = $_FILES['UploadFile']['type'];
      $FileSize   = $_FILES['UploadFile']['size'];

      //cleaning spaces and characters
      $UploadName = preg_replace("#[^a-z0-9.]#i", "", $UploadName);

      //Upload File Size Limit
      if($FileSize > 525000)
      {
        die("Error - File to Big");
      }

      //Checks a File has been Selected and Uploads them into Directory
      if( !$UploadTmp )
      {
        die("No File Selected, Please Upload Again");
      }
      else
      {
        $directory = "uploads/$UploadName";
        move_uploaded_file($UploadTmp, $directory);
      }
    }
  }//eom

?>