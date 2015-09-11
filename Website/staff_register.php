<html>
<header>
  <title>Go Local App</title>
</header>
<body>
  <!-- Create the form -->
  <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    Name: 
    <input type="text" name="name">
    <span class="error">*</span><br><br>
    Middle Initial: 
    <input type="text" name="middleI"><br><br>
    Last Name:
    <input type="text" name="lname">
    <span class="error">*</span><br><br>
    Nickname:
    <input type="text" name="nickname"><br><br>
    Address:
    <input type="text" name="address">
    <span class="error">*</span><br><br>
    Phone:
    <input type="text" name="phone">
    <span class="error">*</span><br><br>
    Are you a:
    <input type="checkbox" name="dj" value="dj">DJ
    <input type="checkbox" name="liveBand" value="liveBand">Live Band
    <input type="checkbox" name="caterCompany" value="caterCompany">Catering Company
    <input type="checkbox" name="otherProfession" value="other">Other<br><br>
    Please describe:
    <textarea name="description" rows="5" cols="40"></textarea><br><br>
    Website:
    <input type="text" name="website">
    <span class="error">*</span><br><br>
    Social Medias:
    <textarea name="socialMedia" rows="4" cols="20"></textarea><br><br>
    Date of Birth:
    <input type"date" name="bday" placeholder="MM/DD/YYYY"><br><br>
    Gender:
    <input type="radio" name="gender" value="0">Female
    <input type="radio" name="gender" value="1">Male<br><br>
    Additional Languages:
    <textarea name="languages" rows="5" cols="10"></textarea><br><br>
    Driver's License:
    <input type="radio" name="dl" value="0">Personal
    <input type="radio" name="dl" value="1">Commercial<br><br>
    Ethnicity:<br>
    <input type="radio" name="ethnicity" value="0">Non-Hispanic White or Euro-American<br>
    <input type="radio" name="ethnicity" value="1">Black, Afro-Caribbean, or African American<br>
    <input type="radio" name="ethnicity" value="2">Latino or Hispanic American<br>
    <input type="radio" name="ethnicity" value="3">East Asian or Asian American<br>
    <input type="radio" name="ethnicity" value="4">South Asian or Indian American<br>
    <input type="radio" name="ethnicity" value="5">Middle Eastern or Arab American<br>
    <input type="radio" name="ethnicity" value="6">Native American or Alaskan Native<br>
    <input type="radio" name="ethnicity" value="7">Other<br><br>
    Height:
    <input type="text" name="height" placeholder="e.g. 5'8''"><br><br>
    Weight (lbs):
    <input type="number" name="weight"><br><br>
    Hair Color:
    <input type="text" name="hairColor"><br><br>
    Eyes Color:
    <input type="text" name="eyesColor"><br><br>
    T-Shirt Size:
    <input type="text" name="shirtSize"><br><br>
    Pant Size:
    <input type="number" name="pantSize"><br><br>
    Chest Size (Female):
    <input type="number" name="chestSize"><br><br>
    Waist Size (Female):
    <input type="number" name="waistSize"><br><br>
    Hips Size (Female):
    <input type="number" name="hipSize"><br><br>
    Dress Size (Female):
    <input type="text" name="dressSize"><br><br>
    Shoe Size:
    <input type="number" name="shoeSize"><br><br>
    Tattoos
    <input type="checkbox" name="tattoos" value="tattoos">
    Piercings
    <input type="checkbox" name="piercings" value="piercings"><br><br>
    Desired Hourly Rate:
    <input type="number" name="hourlyRate"><br><br>
    Desired Weekly Rate:
    <input type="number" name="weeklyRate"><br><br>
    Social Security Number:
    <input type="number" name="ssn"><br><br>
    Employee Identification Number:
    <input type="number" nam="ein"><br><br>
    Willing to travel?
    <input type="radio" name"travel" value="yes">Yes
    <input type="radio" name"travel" value="No">No<br><br>
    Do you have professional insurance?
    <input type="radio" name"insurance" value="yes">Yes
    <input type="radio" name"insurance" value="No">No<br><br>
    If you do have insurance,  upload documnetation:
    <input type="file" name="insuranceDocs"><br><br>
    Upload Pictures:<br>
    Headshot 
    <input type="file" name="headshot"><br><br>
    Full Body 
    <input type="file" name="headshot"><br><br>
    Bank Rounting Number:
    <input type="number" name="routing"><br><br>
    Account Number:
    <input type="number" name="account"><br><br>
    Upload Resume:
    <input type="file" name="resume"><br><br>
    Work Experience:<br>
    <input type="checkbox" name="brandAmbassador" value="brandAmbassador">Brand Ambassador
    <input type="checkbox" name="flyerDistributor" value="flyerDistributor">Flyer Distributor<br><br>
    <input type="checkbox" name="fieldMarketingManager" value="fieldMarketingManager">Field Marketing Manager
    <input type="checkbox" name="dancer" value="dancer">Dancer<br><br>
    <input type="checkbox" name="bartender" value="bartender">Bartender
    <input type="checkbox" name="waiter" value="waiter">Waiter or Waitress<br><br>
    <input type="checkbox" name="productionAssistant" value="productionAssistant">Production Assistant
    <input type="checkbox" name="salesExecutive" value="salesExecutive">Sales Executive<br><br>
    <input type="checkbox" name="djExperince" value="dj">DJ
    <input type="checkbox" name="liveBandExperience" value="liveBand">Live Band
    <input type="checkbox" name="cateringExperience" value="caterCompany">Cater Company<br><br>

    <input type="submit" value="Submit Info">
    
  </form>
  	
</body>
</html>