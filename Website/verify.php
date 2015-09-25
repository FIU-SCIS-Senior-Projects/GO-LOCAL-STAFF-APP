<html>
<header>
  <title>Go Local App</title>
</header>
<body>
    <?php

    ?>
</body>
<html>
<header>
  <title>Go Local App</title>
</header>
<body>
    <?php
    require "functions.php";

    if( $_SERVER["REQUEST_METHOD"] == "GET" )
    {
        if( !empty($_GET["type"]) && !empty($_GET["email"]) && !empty($_GET["hash"]) )
        {
            //verify data
            authenticateEmail( $_GET["type"], $_GET["email"], $_GET["hash"] );
        }
    }
    else
        echo "GET NOT SET!";

    ?>
</body>
</html>