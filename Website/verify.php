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
            //echo "Get is giving: type: ".$_GET["type"]."  email: ".$_GET["email"]."   hash: ".$_GET["hash"];
            authenticateEmail( $_GET["type"], $_GET["email"], $_GET["hash"] );
        }
    }

    ?>
</body>
</html>