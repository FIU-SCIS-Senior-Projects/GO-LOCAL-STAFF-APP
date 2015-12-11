<?php

$name = $_POST['name'];
$mail= $_POST['mail'];
$phone = $_POST['phone'];
$birth = $_POST['birth'];
$ethnicity = $_POST['ethnicity'];
$height = $_POST['height'];
$weight = $_POST['weight'];
$hair = $_POST['hair'];
$eyes = $_POST['eyes'];
$chest = $_POST['chest'];
$waist = $_POST['waist'];
$hips = $_POST['hips'];
$city = $_POST['city'];
$othercity = $_POST['othercity'];
$dress = $_POST['dress'];
$shoe = $_POST['shoe'];
$experience = $_POST['experience'];
$otherexperience = $_POST['otherexperience'];
$body = $_POST['body'];
$language = $_POST['language'];
$web = $_POST['web'];
$facebook = $_POST['facebook'];
$twitter = $_POST['twitter'];
$instagram = $_POST['instagram'];
$about = $_POST['about'];
$namefile = $_FILES['archivo']['name'];
$sizefile = $_FILES['archivo']['size'];
$typefile = $_FILES['archivo']['type'];
$tempfile = $_FILES['archivo']['tmp_name'];

$header = 'From: ' . $mail . " \r\n";
$header .= "X-Mailer: PHP/" . phpversion() . " \r\n";
$header .= "Mime-Version: 1.0 \r\n";
$header .= "Content-Type: multipart/mixed";
$header .= "boundary =´=P=A=L=A=B=R=A=´"
$header .= "boundary =\"=C=T=E=C= \" \r\n";


$mensaje = "Este mensaje fue enviado por " . $name . ", de la ciudad " . $city . " \r\n";
$mensaje .= "Email: " . $mail . " \r\n";
$mensaje .= "Phone: " . $phone . " \r\n";
$mensaje .= "Date of Birth:: " . $birth . " \r\n";
$mensaje .= "Hair color: " . $hair . " \r\n";
$mensaje .= "Chest: " . $chest . " \r\n";
$mensaje .= "Waist: " . $waist . " \r\n";
$mensaje .= "Hips: " . $hips . " \r\n";
$mensaje .= "Other city: " . $othercity . " \r\n";
$mensaje .= "Dress size: " . $dress . " \r\n";
$mensaje .= "Shoe size: " . $shoe . " \r\n";
$mensaje .= "List Your Experience: " . $experience . " \r\n";
$mensaje .= "Other experience: " . $otherexperience . " \r\n";
$mensaje .= "Body art: " . $body . " \r\n";
$mensaje .= "Languages: " . $language . " \r\n";
$mensaje .= "Website: " . $web . " \r\n";
$mensaje .= "Facebook: " . $facebook . " \r\n";
$mensaje .= "Twitter: " . $twitter . " \r\n";
$mensaje .= "Instagram: " . $instagram . " \r\n";
$mensaje .= "How did you hear about us: " . $about . " \r\n";
$mensaje .= "Resume: " . $file . " \r\n";
$mensaje .= "Headshot : " . $file2 . " \r\n";
$mensaje .= "Full Body: " . $file3 . " \r\n";
$mensaje .= "Mensaje: " . $_POST['mensaje'] . " \r\n";
$mensaje .= "Enviado el " . date('d/m/Y', time());

$para = 'abolanos@apdiweb.com';
$asunto = 'Formulario de Contacto';

mail($para, $asunto, utf8_decode($mensaje), $header);

echo 'THE MESAGGE WAS SENT
';
?> - Gracias por Contactarnos