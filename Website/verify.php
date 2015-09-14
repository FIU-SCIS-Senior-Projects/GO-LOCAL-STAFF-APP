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

    if( $_SERVER["REQUEST_METHOD"] == "GET" )
    {
        if( !empty($_GET["type"]) && !empty($_GET["email"]) && !empty($_GET["hash"]) )
        {
            //verify data
            authenticaEmail();
        }
    }

    ?>
</body>
</html>