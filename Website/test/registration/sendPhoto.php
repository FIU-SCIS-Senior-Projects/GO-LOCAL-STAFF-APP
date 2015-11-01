<html>
<body>

<form action="" method="post" enctype="multipart/form-data">
    Select image to upload:
    <input type="file" name="fileToUpload" id="fileToUpload">
    <input type="submit" value="UploadImage" name="UploadImage">
    <input type="submit" value="sendImage" name="sendImage">
</form>

</body>
</html>

<?php

    $UploadImage    = $_POST['UploadImage'];
    $sendImage      = $_POST['sendImage'];

    if($UploadImage)
    {
        uploadImageToServer();
    }
    else if($sendImage)
    {
        // sendImageToAsJSONPOST_ToServer();
        sendImageToAsPOST_ToServer();
    }


/*
Uploads Image in Server

    Configure The "php.ini" File
        First, ensure that PHP is configured to allow file uploads.
        In your "php.ini" file, search for the file_uploads directive, and set it to On:
        file_uploads = On
*/
function uploadImageToServer()
{
    $target_dir = "uploads/";
    $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
    $uploadOk = 1;
    $imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);

    // Check if image file is a actual image or fake image
    if(isset($_POST["submit"])) 
    {
        $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
        if($check !== false) 
        {
            echo "File is an image - " . $check["mime"] . ".";
            $uploadOk = 1;
        } else 
        {
            echo "File is not an image.";
            $uploadOk = 0;
        }
    }
    // Check if file already exists
    if (file_exists($target_file)) 
    {
        echo "Sorry, file already exists.";
        $uploadOk = 0;
    }

    // Check file size
    if ($_FILES["fileToUpload"]["size"] > 500000) 
    {
        echo "Sorry, your file is too large.";
        $uploadOk = 0;
    }

    // Allow certain file formats
    if($imageFileType != "jpg" 
        && $imageFileType != "png" 
        && $imageFileType != "jpeg"
        && $imageFileType != "gif" ) 
    {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }
    
    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) 
    {
        echo "Sorry, your file was not uploaded.";
    } 
    // if everything is ok, try to upload file
    else 
    {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) 
        {
            echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
        } 
        else 
        {
            echo "Sorry, there was an error uploading your file.";
        }
    }
}//eom
 


 /* sends image to server as JSON POST 

    http://mobile.cs.fsu.edu/converting-images-to-json-objects/

 */ 
function sendImageToAsPOST_ToServer()
{
    include '../urlsettings.php';

    print_r($_POST);
    print_r($_FILES);

    //image data
    $imageSelected  = $_FILES['fileToUpload'];
    $imageType      = $imageSelected['type'];
    $imageName      = $imageSelected['name'];
    $imageTmp_name  = $imageSelected['tmp_name'];
    $imageSize      = $imageSelected['size'];
    $filename       = $imageTmp_name;

    echo "<p>imageType:".$imageType."</p>"; 
    echo "<p>imageName:".$imageName."</p>"; 
    echo "<p>imageTmp_name:".$imageTmp_name."</p>"; 
    echo "<p>imageSize:".$imageSize."</p>"; 
    echo "<p>filename:".$filename."</p>"; 

    $postValues = array(
        // 'utf8' => $utf8,
        // 'authenticity_token' => $auth_token,
        'title' => $imageName,
        'media_object[source]' => '',
        'media_object[object_type]' => 0,
        'image'=>'@/home/me/images/something.jpg',
        // 'captcha' => $captcha,
    );


    $this->ch = curl_init();
    curl_setopt($this->ch, CURLOPT_URL, $url_sendPhoto);

    curl_setopt($this->ch, CURLOPT_POSTFIELDS, $postValues);
    curl_setopt($this->ch, CURLOPT_POST,1);
    // curl_setopt($this->ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 5.1; rv:14.0) Gecko/20100101 Firefox/14.0.1");
    curl_setopt($this->ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($this->ch, CURLOPT_FOLLOWLOCATION, 1);
    // curl_setopt($this->ch, CURLOPT_COOKIEFILE, TMP.'cookies.txt');
    // curl_setopt($this->ch, CURLOPT_COOKIEJAR, TMP.'cookies.txt');

 
    //Execute the request
    echo "<p></p>";
    echo "<p></p>";
    echo "<p>POST Response:</p>";
    $result = curl_exec($ch);
 
 
} //eom

function sendToServer()
{
    include '../urlsettings.php';

    print_r($_POST);
    print_r($_FILES);

    //image data
    $imageSelected  = $_FILES['fileToUpload'];
    $imageType      = $imageSelected['type'];
    $imageName      = $imageSelected['name'];
    $imageTmp_name  = $imageSelected['tmp_name'];
    $imageSize      = $imageSelected['size'];
    $filename       = $imageTmp_name;

    echo "<p>imageType:".$imageType."</p>"; 
    echo "<p>imageName:".$imageName."</p>"; 
    echo "<p>imageTmp_name:".$imageTmp_name."</p>"; 
    echo "<p>imageSize:".$imageSize."</p>"; 
    echo "<p>filename:".$filename."</p>"; 

    $imageData  = $_POST['image'];
    $tmpfname   = tempnam("cache", "img");
    $file       = fopen($tmpfname, "w");
    fwrite( $file, base64_decode( $imageData ) );
    fclose( $file);

    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url_sendPhoto);
    curl_setopt($curl, CURLOPT_POST, 1);
    curl_setopt($curl, CURLOPT_HTTPHEADER,  array('Expect:'));
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 4);
    curl_setopt($curl, CURLOPT_POSTFIELDS, array('image' => "@$tmpfname;type=image/png"));
    curl_setopt($curl, CURLOPT_VERBOSE, 1);
    curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
    $buffer = curl_exec($curl);
    curl_close($curl);
    // check for success or failure
    unlink($tmpfname);


}


 /* sends image to server as JSON POST 

    http://mobile.cs.fsu.edu/converting-images-to-json-objects/

 */ 
// function sendImageToAsJSONPOST_ToServer()
// {
//     include '../urlsettings.php';

//     //Initiate cURL.
//     $ch = curl_init($url_sendPhoto);

//     print_r($_POST);
//     print_r($_FILES);

//     //image data
//     $imageSelected  = $_FILES['fileToUpload'];
//     $imageType      = $imageSelected['type'];
//     $imageName      = $imageSelected['name'];
//     $imageTmp_name  = $imageSelected['tmp_name'];
//     $imageSize      = $imageSelected['size'];
//     $filename       = $imageTmp_name;

//     $handle         = fopen($filename, "r");
//     $data           = fread($handle, filesize($filename));
//     $pvars          = base64_encode($data);

//     // $image = curl_file_create($filename, $contentType, $imageName);

//     /*The JSON data */
//     $jsonData = array(
//       'registrationType' => 'Staff',
//       'ID' => '1',
//       'name' => $imageName,
//       // 'image' => $image,
//       'image' => $pvars,
//       );


//     //Encode the array into JSON.
//     $jsonDataEncoded = json_encode($jsonData);

//     echo "<p>sending the following JSON:</p>";
//     print_r($jsonDataEncoded);

//     //Tell cURL that we want to send a POST request.
//     curl_setopt($ch, CURLOPT_POST, 1);

//     //Attach our encoded JSON string to the POST fields.
//     curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonDataEncoded);

//     //Set the content type to application/json
//     curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json')); 

//     //Execute the request
//     echo "<p></p>";
//     echo "<p></p>";
//     echo "<p>JSON POST Response:</p>";
//     $result = curl_exec($ch);
 
// } //eom

?>