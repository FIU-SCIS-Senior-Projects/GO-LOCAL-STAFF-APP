<?php
//Start Session
session_start();
?>

<html>
<header>
  <title>Go Local App</title>
</header>
<body>

    <?php
    require "functions.php";

    $globalError  = false;
    $type = "";
    $peopleID = "";
    $fname = $fnameError = "";
    $middleI = "";
    $lname = $lnameError = "";
    $nickname = "";
    $address = $addressError = "";
    $phone = $phoneError = "";
    $dj = $djError = $djDescription = $djWebsite = $djSocialMedia = "";
    $liveBand = $liveBandError = $liveBandDescription = $liveBandWebsite = $liveBandSocialMedia = "";
    $caterCompany = $caterError = $caterDescription = $caterWebsite = $caterSocialMedia = "";
    $otherProfession = $otherProfessionError = $otherDescription = $otherWebsite = $otherSocialMedia = "";
    $bday = $bdayError = "";
    $gender = $genderError = "";
    $languages = $languagesError = "";
    $dl = $dlError = "";
    $ethnicity = $ethnicityError = "";
    $height = $heightError = "";
    $weight = $weightError = "";
    $hairColor = $hairColorError = "";
    $eyesColor = $eyesColorError = "";
    $shirtSize = $shirtSizeError = "";
    $pantSize = $pantSizeError = "";
    $chestSize = $chestSizeError = "";
    $waistSize = $waistSizeError = "";
    $hipSize = $hipSizeError = "";
    $dressSize = $dressSizeError = "";
    $shoeSize = $shoeSizeError = "";
    $ssn = $ein = $ssnOReinError = "";
    $travel = $travelError = "";
    $insurance = $insuranceError = "";
    $insuranceDocs = $insuranceDocsError = "";
    $resume = $resumeError = "";
    $workExperienceError = "";
    
    // if( !empty($_GET["type"]) && !empty($_GET["username"]) )
    // {      
    //     $peopleID = retrievePeopleID( $_GET["type"], $_GET["username"] );
    // }
    if( !empty($_SESSION["username"]) )
    {
        $_SESSION["peopleID"] = retrievePeopleID( $_SESSION["username"] );
    }

    if( $_SERVER["REQUEST_METHOD"] == "POST" )
    {
        //Form has been submitted
        if( empty($_POST["fname"]) )
        {
            $fnameError = "You must enter a name";
            $globalError = true;
        }
        else
            $fname = test_input( $_POST["fname"] );

        if( empty($_POST["lname"]) )
        {
            $lnameError = "You must enter a last name";
            $globalError = true;
        }
        else
            $lname = test_input( $_POST["lname"] );

        if( empty($_POST["address"]) )
        {
            $addressError = "You must enter an address";
            $globalError = true;
        }
        else
            $address = test_input( $_POST["address"] );

        if( empty($_POST["phone"]) )
        {
            $phoneError = "You must enter a phone number";
            $globalError = true;
        }
        else
            $phone = test_input( $_POST["phone"] );

        // if( !empty($_POST["dj"]) )
        //     if( empty(_POST["djDescription"]) || empty($_POST["djWebsite"]) || empty($_POST["djSocialMedia"]) )
        //     {
        //         $djError = "You must fill out all of the DJ fields";
        //         $globalError = true;
        //     }

        // if( !empty($_POST["liveBand"]) )
        //     if( empty($_POST["liveBandDescription"]) || empty($_POST["liveBandWebsite"]) || empty($_POST["liveBandSocialMedia"]) )
        //     {
        //         $liveBandError = "You must fill out all of the Live Band fields";
        //         $globalError = true;
        //     }

        // if( !empty($_POST["caterCompany"]) )
        //     if( empty($_POST["caterDescription"]) || empty($_POST["caterWebsite"]) || empty($_POST["caterSocialMedia"]) )
        //     {
        //         $caterError = "You must fill out all of the Cater Company fields";
        //         $globalError = true;
        //     }

        // if( !empty($_POST["otherProfession"]) )
        //     if( empty($_POST["otherDescription"]) || empty($_POST["otherWebsite"]) || empty($_POST["otherSocialMedia"]) )
        //     {
        //         $otherProfessionError = "You must fill out all of these fields";
        //         $globalError = true;
        //     }

        // if( empty($_POST["bday"]) )
        // {
        //     $bdayError = "You must enter yor date of birth";
        //     $globalError = true;
        // }
        // else
        //     $bday = test_input($_POST["bday"]);

        // if( empty($_POST["gender"]) )
        // {
        //     $genderError = "You must seelct your gender";
        //     $globalError = true;
        // }
        // else
        //     $gender = test_input($_POST["gender"]);

        // if( empty($_POST["languages"]) )
        // {
        //     $languagesError = "You must at least add one language";
        //     $globalError = true;
        // }
        // else
        //     $languages = test_input($_POST["languages"]);

        // if( empty($_POST["dl"]) )
        // {
        //     $dlError = "You must specify what type of Driver's License you have";
        //     $globalError = true;
        // }
        // else
        //     $dl = $_POST["dl"];

        // if( empty($_POST["ethnicity"]) )
        // {
        //     $ethnicityError = "Please select what ethnicity group you belong to";
        //     $globalError = true;
        // }
        // else
        //     $ethnicity = $_POST["ethnicity"];

        // if( empty($_POST["height"]) )
        // {
        //     $heightError = "You must enter your height";
        //     $globalError = true;
        // }
        // else
        //     $height = test_input($_POST["height"]);

        // if( empty($_POST["weight"]) )
        // {
        //     $weightError = "You must enter your weight";
        //     $globalError = true;
        // }
        // else
        //     $weight = test_input($_POST["weight"]);

        // if( empty($_POST["hairColor"]) )
        // {
        //     $hairColorError = "You must enter your hair color";
        //     $globalError = true;
        // }
        // else
        //     $hairColor = test_input($_POST["hairColor"]);

        // if( empty($_POST["eyesColor"]) )
        // {
        //     $eyesColorError = "You must enter your eyes' color";
        // }
        // else
        //     $eyesColor = test_input($_POST["eyesColor"]);

        // if( empty($_POST["shirtSize"]) )
        // {
        //     $shirtSizeError = "You must enter your shirt size";
        // }
        // else
        //     $shirtSize = test_input($_POST["shirtSize"]);

        // if( empty($_POST["pantSize"]) )
        // {
        //     $pantSizeError = "You must enter your pants' size";
        //     $globalError = true;
        // }
        // else
        //     $pantSize = test_input($_POST["pantSize"]);

        // if( empty($_POST["chestSize"]) )
        // {
        //     $chestSizeError = "You must enter your chest size";
        //     $globalError = true;
        // }
        // else
        //     $chestSize = test_input($_POST["chestSize"]);

        // if( empty($_POST["waistSize"]) )
        // {
        //     $waistSizeError = "You must enter your waist size";
        // }
        // else
        //     $waistSize = test_input($_POST["waistSize"]);

        // if( empty($_POST["hipSize"]) )
        // {
        //     $hipSizeError = "You must enter your hips size";
        //     $globalError = true;
        // }
        // else
        //     $hipSize = test_input($_POST["hipSize"]);

        // if( empty($_POST["dressSize"]) )
        // {
        //     $dressSizeError = "You must enter your dress size";
        // }
        // else
        //     $dressSize = test_input($_POST["dressSize"]);

        // if( empty($_POST["shoeSize"]) )
        // {
        //     $shoeSizeError = "You must enter your shoe size";
        //     $globalError = true;
        // }
        // else
        //     $shoeSize = test_input($_POST["shoeSize"]);

        // if( empty($_POST["ssn"]) || empty($_POST["ein"]) )
        // {
        //     $ssnOReinError = "You must provide either your ssn or your ein";
        //     $globalError = true;
        // }
        // elseif ( !empty($_POST["ssn"]) )
        // {
        //     $ssn = test_input($_POST["ssn"]);
        // }
        // else
        // {
        //     $ein = test_input($_POST["ein"]);
        // }

        // if( empty($_POST["travel"]) )
        // {
        //     $travelError = "Please select if you're willing to travel or not";
        //     $globalError = true;
        // }
        // else
        //     $travel = $_POST["travel"];

        // if( empty($_POST["insurance"]) )
        // {
        //     $insuranceError = "You must answer this question";
        //     $globalError = true;
        // }
        // else
        //     $insurance = $_POST["insurance"];

        // if( empty($_POST["resume"]) )
        // {
        //     $resumeError = "You must upload a resume";
        //     $globalError = true;
        // }

        // if( empty($_POST["brandAmbassador"]) && empty($_POST["flyerDistributor"]) && empty($_POST["fieldMarketingManager"]) 
        //     && empty($_POST["dancer"]) && empty($_POST["bartender"]) && empty($_POST["waiter"]) 
        //     && empty($_POST["productionAssistant"]) && empty($_POST["salesExecutive"]) 
        //     && empty($_POST["djExperince"]) && empty($_POST["liveBandExperience"]) 
        //     && empty($_POST["cateringExperience"]) )
        // {
        //     $workExperienceError = "You must select at least one";
        //     $globalError = true;
        // }

        if( !$globalError )
        {
            //All the required fields have been filled out.
            $middleI = test_input($_POST["middleI"]);
            $nickname = test_input($_POST["nickname"]);
            storePersonalInfo( $_SESSION["peopleID"], $fname, $middleI, $lname, $nickname, $address, $phone);

            header("Location: http://45.55.208.175/Website/registration_success.php");
        }

    }

    ?>

    <!-- Create the form -->
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
        1. Name: 
        <input type="text" name="fname">
        <span class="error" style="color:red">*<?php echo $fnameError; ?></span><br><br>
        2. Middle Initial: 
        <input type="text" name="middleI"><br><br>
        3. Last Name:
        <input type="text" name="lname">
        <span class="error" style="color:red">*<?php echo $lnameError; ?></span><br><br>
        4. Nickname:
        <input type="text" name="nickname"><br><br>
        5. Address:
        <input type="text" name="address">
        <span class="error" style="color:red">*<?php echo $addressError; ?></span><br><br>
        6. Phone:
        <input type="text" name="phone">
        <span class="error" style="color:red">*<?php echo $phoneError; ?></span><br><br>
        
        <span style="font-weight:bold">Please check at least one type of job:</span><br><br>
        7. Are you a a DJ?
        <input type="checkbox" name="dj" value="dj">
        <span class="error" style="color:red">*<?php echo $djError; ?></span><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If so, please answer fill out a, b and c.<br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Describe genre:
        <textarea name="djDescription" rows="5" cols="10"></textarea>
        <span class="error" style="color:red">*</span><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Website:
        <input type="text" name="djWebsite">
        <span class="error" style="color:red">*</span><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Social Medias:
        <textarea name="djSocialMedia" rows="4" cols="20"></textarea>
        <span class="error" style="color:red">*</span><br><br>
        8. Are you a Live Band?
        <input type="checkbox" name="liveBand" value="liveBand">
        <span class="error" style="color:red">*<?php echo $liveBandError; ?></span><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If so, please answer fill out a, b and c.<br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Describe genre:
        <textarea name="liveBandDescription" rows="5" cols="10"></textarea>
        <span class="error" style="color:red">*</span><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Website:
        <input type="text" name="liveBandWebsite">
        <span class="error" style="color:red">*</span><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Social Medias:
        <textarea name="liveBandSocialMedia" rows="4" cols="20"></textarea>
        <span class="error" style="color:red">*</span><br><br>
        9. Are you a Catring Company?
        <input type="checkbox" name="caterCompany" value="caterCompany">
        <span class="error" style="color:red">*<?php echo $caterError; ?></span><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If so, please answer fill out a, b and c.<br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Describe:
        <textarea name="caterDescription" rows="5" cols="10"></textarea>
        <span class="error" style="color:red">*</span><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Website:
        <input type="text" name="caterWebsite">
        <span class="error" style="color:red">*</span><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Social Medias:
        <textarea name="caterSocialMedia" rows="4" cols="20"></textarea>
        <span class="error" style="color:red">*</span><br><br>
        10. Do you provide other service?
        <input type="checkbox" name="otherProfession" value="other">
        <span class="error" style="color:red">*<?php echo $otherProfessionError; ?></span><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If so, please answer fill out a, b and c.<br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a. Describe:
        <textarea name="otherDescription" rows="5" cols="10"></textarea>
        <span class="error" style="color:red">*</span><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;b. Website:
        <input type="text" name="otherWebsite">
        <span class="error" style="color:red">*</span><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c. Social Medias:
        <textarea name="otherSocialMedia" rows="4" cols="20"></textarea>
        <span class="error" style="color:red">*</span><br><br>
        <span style="font-weight:bold">
            If you are at least one of the previous type of companies, please skip 15-37
        </span><br><br>
        11. Date of Birth:
        <input type"date" name="bday" placeholder="MM/DD/YYYY">
        <span class="error" style="color:red">*<?php echo $bdayError; ?></span><br><br>
        12. Gender:
        <span class="error" style="color:red">*<?php echo $genderError; ?></span>
        <input type="radio" name="gender" value="0">Female
        <input type="radio" name="gender" value="1">Male<br><br>
        13. Languages:
        <textarea name="languages" rows="5" cols="10"></textarea>
        <span class="error" style="color:red">*<?php echo $languagesError; ?></span><br><br>
        14. Driver's License:
        <span class="error" style="color:red">*<?php echo $dlError; ?></span>
        <input type="radio" name="dl" value="0">Personal
        <input type="radio" name="dl" value="1">Commercial<br><br>
        15. Ethnicity:
        <span class="error" style="color:red">*<?php echo $ethnicityError; ?></span><br>
        <input type="radio" name="ethnicity" value="0">Non-Hispanic White or Euro-American<br>
        <input type="radio" name="ethnicity" value="1">Black, Afro-Caribbean, or African American<br>
        <input type="radio" name="ethnicity" value="2">Latino or Hispanic American<br>
        <input type="radio" name="ethnicity" value="3">East Asian or Asian American<br>
        <input type="radio" name="ethnicity" value="4">South Asian or Indian American<br>
        <input type="radio" name="ethnicity" value="5">Middle Eastern or Arab American<br>
        <input type="radio" name="ethnicity" value="6">Native American or Alaskan Native<br>
        <input type="radio" name="ethnicity" value="7">Other<br><br>
        16. Height:
        <input type="text" name="height" placeholder="e.g. 5'8''">
        <span class="error" style="color:red">*<?php echo $heightError; ?></span><br><br>
        17. Weight (lbs):
        <input type="number" name="weight">
        <span class="error" style="color:red">*<?php echo $weightError; ?></span><br><br>
        18. Hair Color:
        <input type="text" name="hairColor">
        <span class="error" style="color:red">*<?php echo $hairColorError; ?></span><br><br>
        19. Eyes Color:
        <input type="text" name="eyesColor">
        <span class="error" style="color:red">*<?php echo $eyesColorError; ?></span><br><br>
        20. T-Shirt Size:
        <input type="text" name="shirtSize">
        <span class="error" style="color:red">*<?php echo $shirtSizeError; ?></span><br><br>
        21. Pant Size:
        <input type="number" name="pantSize">
        <span class="error" style="color:red">*<?php echo $pantSizeError; ?></span><br><br>
        22. Chest Size (Female):
        <input type="number" name="chestSize">
        <span class="error" style="color:red">*<?php echo $chestSizeError; ?></span><br><br>
        23. Waist Size (Female):
        <input type="number" name="waistSize">
        <span class="error" style="color:red">*<?php echo $waistSizeError; ?></span><br><br>
        24. Hips Size (Female):
        <input type="number" name="hipSize">
        <span class="error" style="color:red">*<?php echo $waistSizeError; ?></span><br><br>
        25. Dress Size (Female):
        <input type="text" name="dressSize">
        <span class="error" style="color:red">*<?php echo $dressSizeError; ?></span><br><br>
        26. Shoe Size:
        <input type="number" name="shoeSize">
        <span class="error" style="color:red">*<?php echo $shoeSizeError; ?></span><br><br>
        27. Tattoos
        <input type="checkbox" name="tattoos" value="tattoos">
        Piercings
        <input type="checkbox" name="piercings" value="piercings"><br><br>
        28. Desired Hourly Rate:
        <input type="number" name="hourlyRate"><br><br>
        29. Desired Weekly Rate:
        <input type="number" name="weeklyRate"><br><br>
        30. Please enter either your Social or your Employer Identification Number:
        <span class="error" style="color:red">*<?php echo $ssnOReinError; ?></span><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Social Security Number:
        <input type="number" name="ssn"><br><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Employer Identification Number:
        <input type="number" nam="ein"><br><br>
        31. Willing to travel?
        <span class="error" style="color:red">*<?php echo $travelError; ?></span>
        <input type="radio" name"travel" value="yes">Yes
        <input type="radio" name"travel" value="No">No<br><br>
        32. Do you have professional insurance?
        <span class="error" style="color:red">*<?php echo $insuranceError; ?></span>
        <input type="radio" name"insurance" value="yes">Yes
        <input type="radio" name"insurance" value="No">No<br><br>
        33. If you do have insurance,  upload documnetation:
        <input type="file" name="insuranceDocs"><br><br>
        34. Upload Pictures:<br><br>
        Headshot
        <input type="file" name="headshot"><br><br>
        Full Body 
        <input type="file" name="headshot"><br><br>
        35. Bank Rounting Number:
        <input type="number" name="routing"><br><br>
        36. Account Number:
        <input type="number" name="account"><br><br>
        37. Upload Resume:
        <span class="error" style="color:red">*<?php echo $resumeError; ?></span>
        <input type="file" name="resume"><br><br>
        38. Work Experience:
        <span class="error" style="color:red">*<?php echo $workExperienceError; ?></span><br>
        <input type="checkbox" name="brandAmbassador" value="brandAmbassador">Brand Ambassador<br>
        <input type="checkbox" name="flyerDistributor" value="flyerDistributor">Flyer Distributor<br>
        <input type="checkbox" name="fieldMarketingManager" value="fieldMarketingManager">Field Marketing Manager<br>
        <input type="checkbox" name="dancer" value="dancer">Dancer<br>
        <input type="checkbox" name="bartender" value="bartender">Bartender<br>
        <input type="checkbox" name="waiter" value="waiter">Waiter or Waitress<br>
        <input type="checkbox" name="productionAssistant" value="productionAssistant">Production Assistant<br>
        <input type="checkbox" name="salesExecutive" value="salesExecutive">Sales Executive<br>
        <input type="checkbox" name="djExperince" value="dj">DJ<br>
        <input type="checkbox" name="liveBandExperience" value="liveBand">Live Band<br>
        <input type="checkbox" name="cateringExperience" value="caterCompany">Cater Company<br><br>

        <input type="submit" value="Submit Info">


    </form>
  	
</body>
</html>