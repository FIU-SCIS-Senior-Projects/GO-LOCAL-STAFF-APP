<?php

$password = 'password123';


///getting contenst from file
$obtainHashPassword1 = file_get_contents('hashpassword1.txt');
echo $obtainHashPassword1;
echo "<p>length of obtain hashed: ".strlen($obtainHashPassword1)."</p>";
$subHashPassword1 = substr( $obtainHashPassword1, 1, 60 );
echo "<p>$subHashPassword1</p>";
echo "<p>length of obtain sub-hashed: ".strlen($subHashPassword2)."</p>";
echo "<p></p>";
echo "<p>unhashing 1st password</p>";
$results1 = password_verify($password, $subHashPassword1);

if ( $results1 ) {
    echo '1st Password is valid!';
} else {
    echo 'Invalid password.';
}
echo "<br/>";

echo "<br/>";



//getting contenst from file
$obtainHashPassword2 = file_get_contents('hashpassword2.txt');
echo $obtainHashPassword2;
echo "<p>length of obtain hashed: ".strlen($obtainHashPassword2)."</p>";
$subHashPassword2 = substr( $obtainHashPassword2, 1, 60 );
echo "<p>$subHashPassword2</p>";
echo "<p>length of obtain sub-hashed: ".strlen($subHashPassword2)."</p>";

echo "<p></p>";
echo "<p>unhashing 2nd password</p>";
$results2 = password_verify($password, $subHashPassword2);

if ( $results2 ) {
    echo '2nd Password is valid!';
} else {
    echo 'Invalid password.';
}


?>