<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>Formulario</title> <!-- Aquí va el título de la página -->

</head>

<body>
<?php

$Nombre = $_POST['Nombre'];
$Email = $_POST['Email'];
$Phone = $_POST['Phone'];
$Birth = $_POST['Birth'];
$Height = $_POST['Height'];
$Weight = $_POST['Weight'];
$Ethnicity = $_POST['Ethnicity'];
$Hair = $_POST['Hair'];
$Eyes = $_POST['Eyes'];
$Chest = $_POST['Chest'];
$Waist = $_POST['Waist'];
$Hips = $_POST['Hips'];
$Dress = $_POST['Dress'];
$Shoes = $_POST['Shoes'];
$City = $_POST['City'];
$City2 = $_POST['City2'];
$Experience = $_POST['Experience'];
$OtherExperience = $_POST['OtherExperience'];
$Bodyart = $_POST['Bodyart'];
$Languages = $_POST['Languages'];
$Web = $_POST['Web'];
$Twitter = $_POST['Twitter'];
$Facebook = $_POST['Facebook'];
$Instagram = $_POST['Instagram'];
$archivo = $_FILES['adjunto'];
$archivo1 = $_FILES['adjunto1'];
$archivo2 = $_FILES['adjunto2'];

if ($Nombre=='' || $Email=='' ){

echo "<script>alert('Los campos marcados con * son obligatorios');location.href ='javascript:history.back()';</script>";

}else{


    require("archivosformulario/class.phpmailer.php");
    $mail = new PHPMailer();

    $mail->From     = $Email;
    $mail->FromName = $Nombre;
    $mail->AddAddress("eddiegp@gmail.com"); // Dirección a la que llegaran los mensajes.
   
// Aquí van los datos que apareceran en el correo que reciba
    //adjuntamos un archivo
        //adjuntamos un archivo
            
    $mail->WordWrap = 50;
    $mail->IsHTML(true);
    $mail->Subject  =  "Applicant";
    $mail->Body     =  "Nombre: $Nombre \n<br />".
    "Email: $Email \n<br />".
    "Phone: $Phone \n<br />".
    "Birth: $Birth \n<br />".
    "Heigt: $Height \n<br />".
    "Weight: $Weight \n<br />".
    "Ethnicity: $Ethnicity \n<br />".
    "Hair: $Hair \n<br />".
    "Eyes: $Eyes \n<br />".
    "Chest: $Chest \n<br />".
    "Waist: $Waist \n<br />".
    "Hips: $Hips \n<br />".
    "Dress: $Dress \n<br />".
    "Shoes: $Shoes \n<br />".
    "City: $City \n<br />".
    "City2: $City2 \n<br />".
    "Experience: $Experience \n<br />".
    "OtherExperience: $OtherExperience \n<br />".
    "Bodyart: $Bodyart \n<br />".
    "Languages: $Languages \n<br />".
    "Web: $Web \n<br />".
    "Twitter: $Twitter \n<br />".
    "Facebook: $Facebook \n<br />".
    "Instagram: $Instagram \n<br />";


    $mail->AddAttachment($archivo['tmp_name'], $archivo['name']);
    $mail->AddAttachment($archivo1['tmp_name'], $archivo1['name']);
    $mail->AddAttachment($archivo2['tmp_name'], $archivo2['name']);

    
    

// Datos del servidor SMTP


    
    if ($mail->Send())
    echo "<script>alert('Thanks for sending your information. We will contact you soon.');location.href ='javascript:history.back()';</script>";
    else
    echo "<script>alert('Error al enviar el formulario');location.href ='javascript:history.back()';</script>";

}

?>
</body>
</html>