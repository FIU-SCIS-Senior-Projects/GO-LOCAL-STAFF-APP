<?php 
/*UPDATE `registered_staff` 
SET `height`='5\' 3"' 
WHERE `staffID` = 1
*/


$height = "5\'3\"";



$mystring = 'abc';
$findme   = 'b';
$pos = strpos($mystring, $findme);

// Note our use of ===.  Simply == would not work as expected
// because the position of 'a' was the 0th (first) character.
if ($pos === false) {
    echo "The string '$findme' was not found in the string '$mystring'";
} else {
    echo "The string '$findme' was found in the string '$mystring'";
    echo " and exists at position $pos";
}

?>

