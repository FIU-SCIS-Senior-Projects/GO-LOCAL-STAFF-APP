//
//  StaffRegistration.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/23/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "RegisteredStaff.h"

@implementation RegisteredStaff



/* constructor*/
-(id) init
{
    self = [super init];
    if (self)
    {
        [self updateAllWithBlankValues];
        
        //fetch back files from core data or receive user data from server
    }
    return self;
}


-(void) updateAllWithBlankValues
{
    NSMutableArray * temp;
    
    accountType = @"Staff";
    [self setName:@"" withMiddleInitial:@"" andLastName:@""];
    [self setNickname:@""];
    [self setEmail:@""];
    [self setUserName:@""];
    [self setPassword:@""];
    [self setDOB:@""];
    [self setCellphone:@"" withCarrer:@""];
    [self setAddress:@""];
    [self setGender:0];
    [self setLanguages:@""];
    [self setExperience:temp];
    [self setServicesSelected:FALSE liveBand:FALSE cateringCompany:FALSE otherServices:FALSE];
    [self setDJInfo:@"" withWebsite:@"" withSocialMedia:@"" andCostOfServices:@""];
    [self setLiveBandInfo:@"" withWebsite:@"" withSocialMedia:@"" andCostOfServices:@""];
    [self setCateringCompanyInfo:@"" withWebsite:@"" withSocialMedia:@"" andCostOfServices:@""];
    [self setOtherServicesInfo:@"" withWebsite:@"" withSocialMedia:@"" andCostOfServices:@""];
    [self setLicenseInfo:FALSE hasCommercialLicense:FALSE];
    [self setTattoos:FALSE];
    [self setPiercings:FALSE];
    [self setEthnicity:@""];
    [self setHeight:@""];
    [self setWeight:@""];
    [self setHairColor:@""];
    [self setEyeColor:@""];
    [self setPantSize:@""];
    [self setShoeSize:@""];
    [self setTshirtSize:@""];
    [self setChest:@""];
    [self setWaist:@""];
    [self setHipSize:@""];
    [self setDressSize:@""];
    [self setProfessionalInsurance:FALSE];
    [self setIncorporatedInfo:FALSE ssn:@"" ein:@"" businessName:@""];
    [self setWageRate:@"" orDesiredWeeklyRate:@""];
    [self setTravelPercentage:@""];
    [self setDirectDeposit:FALSE withRouting:@"" andWithAccountNumber:@""];
    
    [self printUserData];

}//eom

    //view controller 1
-(void) setName:(NSString *)fName withMiddleInitial:(NSString *)middleInitial andLastName:(NSString *)lName
{
    firstName = fName;
    middleName = middleInitial;
    lastName = lName;
    
}//eom

-(void) setNickname:(NSString *) nicknameProvided
{
    nickName = nicknameProvided;
}//eom

-(void) setEmail:(NSString *) emailProvided
{
    email = emailProvided;
}//eom

-(void) setUserName:(NSString *) usernameProvided
{
    username = usernameProvided;
}//eom

-(void) setPassword:(NSString *) passwordProvided
{
    password = passwordProvided;
}//eom


-(void) setDOB:(NSString *) dobProvided
{
    dateOfBirth = dobProvided;
}//eom

    //view controller 2
-(void)setCellphone:(NSString *) cellphoneProvided withCarrer:(NSString *) carrierProvided
{
    cellphoneCarrier = carrierProvided;
    cellphone = cellphoneProvided;
    
}//eom

-(void) setAddress:(NSString *) addressProvided
{
    completeAddress = addressProvided;
}//eom

-(void) setGender:(bool) genderProvided
{
    genderType = genderProvided;
    if(genderProvided)
    {
        gender = @"Male";
    }
    else
    {
        gender = @"Female";
    }
}//eom

-(void) setLanguages:(NSString *) languagesProvided
{
    languages = languagesProvided;
}//eom

    //view controller 3
-(void) setExperience:(NSMutableArray *) experienceProvided
{
    staffTypeExperience = experienceProvided;
}//eom

-(void) setServicesSelected:(BOOL) isDj  liveBand:(BOOL) isLiveBand  cateringCompany:(BOOL) isCateringCompany  otherServices:(BOOL) isOtherServices
{
    djSelected = isDj;
    liveBandSelected = isLiveBand;
    cateringCompanySelected = isCateringCompany;
    otherServicesSelected = isOtherServices;
    
}//eom

    //view controller 4
-(void) setDJInfo:(NSString *) description withWebsite:(NSString *) website withSocialMedia:(NSString *) socialMedia andCostOfServices:(NSString *) costOfService
{
    
    djDescription   = description;
    djWebsite       = website;
    djSocialMedia   = socialMedia;
    djCostOfService = costOfService;
    
}//eom

    //view controller 5
-(void) setLiveBandInfo:(NSString *) description withWebsite:(NSString *) website withSocialMedia:(NSString *) socialMedia andCostOfServices:(NSString *) costOfService
{
    
    liveBandDescription   = description;
    liveBandWebsite       = website;
    liveBandSocialMedia   = socialMedia;
    liveBandCostOfService = costOfService;
    
}//eom

    //view controller 6
-(void) setCateringCompanyInfo:(NSString *) description withWebsite:(NSString *) website withSocialMedia:(NSString *) socialMedia andCostOfServices:(NSString *) costOfService
{
    
    cateringCompanyDescription   = description;
    cateringCompanyWebsite       = website;
    cateringCompanySocialMedia   = socialMedia;
    cateringCompanyCostOfService = costOfService;
    
}//eom

    //view controller 7
-(void) setOtherServicesInfo:(NSString *) description withWebsite:(NSString *) website withSocialMedia:(NSString *) socialMedia andCostOfServices:(NSString *) costOfService
{
    
    otherServicesDescription   = description;
    otherServicesWebsite       = website;
    otherServicesSocialMedia   = socialMedia;
    otherServicesCostOfService = costOfService;
    
}//eom

    //view controller 8
-(void) setLicenseInfo:(BOOL) driverLicense hasCommercialLicense:(BOOL) commcercialLicense
{
    hasDriverLicense        =  driverLicense;
    hasCommercialLicense    =   commcercialLicense;
    
}//eom


-(void) setTattoos:(BOOL) tattoosSelected
{
    hasTattoos      =   tattoosSelected;
}//eom


-(void) setPiercings:(BOOL) piercingsSelected
{
    hasPiercings    =   piercingsSelected;
}//eom

-(void) setEthnicity:(NSString *) ethnicitySelected
{
    ethnicity = ethnicitySelected;
}//eom


-(void) setHeight:(NSString *) heightProvided
{
    height  =   heightProvided;
}//eom


-(void) setWeight:(NSString *) weightProvided
{
    weight  =   weightProvided;
}//eom


-(void) setHairColor:(NSString *) hairColorProvided
{
    hairColor   =   hairColorProvided;
    
}//eom

-(void) setEyeColor:(NSString *) eyeColorProvided
{
    eyeColor   =   eyeColorProvided;
    
}//eom

-(void) setPantSize:(NSString *) pantSizeProvided
{
    pantSize   =   pantSizeProvided;
    
}//eom

-(void) setShoeSize:(NSString *) shoeSizeProvided
{
    shoeSize   =   shoeSizeProvided;
    
}//eom


-(void) setTshirtSize:(NSString *) tshirtSizeProvided
{
    tshirtSize   =   tshirtSizeProvided;
    
}//eom

    //controller 9
-(void) setChest:(NSString *) chestProvided
{
    chestSize   =   chestProvided;
}//eom


-(void) setWaist:(NSString *) waistProvided
{
    waistSize   =   waistProvided;
}//eom


-(void) setHipSize:(NSString *) hipSizeProvided
{
    hipsSize    =   hipSizeProvided;
}//eom


-(void) setDressSize:(NSString *) dressSizeProvided
{
    dressSize=  dressSizeProvided;
}//eom


    //view controller 10
-(void) setProfessionalInsurance:(BOOL) professionalInsurance
{
    hasProfessionalInsurance    =   professionalInsurance;

}//eom

-(void) setIncorporatedInfo:(BOOL) incorporated ssn:(NSString *)ssnProvided  ein:(NSString *) einProvided businessName:(NSString *)businessNameProvided
{
    isIncorporated  =   incorporated;
    ssn             =   ssnProvided;
    ein             =   einProvided;
    businessName    =   businessNameProvided;
    
}//eom

-(void) setWageRate:(NSString *) hourlyRateProvided orDesiredWeeklyRate:(NSString *) weeklyRateProvided
{
    desiredHourlyRate   =   hourlyRateProvided;
    desiredWeeklyRate   =   weeklyRateProvided;
    
}//eom

-(void) setTravelPercentage:(NSString *) travelPercentageProvided
{
    travelPercentage    =   travelPercentageProvided;
}//eom

    //view controller 13
-(void) setDirectDeposit:(BOOL) directDeposit withRouting:(NSString *) routingProvided andWithAccountNumber:(NSString *) accountNumberProvided
{
    directDepositDesired        =   directDeposit;
    directDepositRoutingNumber  =   routingProvided;
    directDepositAccountNumber  =   accountNumberProvided;
    
}//eom


////////////////////////////////////////////////
-(BOOL) isDJ
{
    return djSelected;
}//eom

-(BOOL) isLiveBand
{
    return liveBandSelected;
}//eom


-(BOOL) isCateringCompany
{
    return cateringCompanySelected;
}//eom


-(BOOL) isOtherServices
{
    return otherServicesSelected;
}//eom

-(BOOL) isMale
{
    if(genderType)
    {
        return YES;
    }
    
    return NO;
}//eom

-(NSDictionary *) getStaffInfo
{
    //converting items to be send as Dictionary items
    NSDictionary *tmp = [[NSDictionary alloc] initWithObjectsAndKeys:
        accountType,  @"registration_type",
        firstName,  @"firstName",
        middleName, @"middleName",
        lastName, @"lastName",
        nickName, @"nickName",
        email, @"email",
        username, @"username",
        password, @"password",
        dateOfBirth, @"dob",

        cellphone, @"cellphone",
        cellphoneCarrier, @"cellphone_carrier",
        completeAddress, @"completeAddress",
        gender, @"gender",
        languages, @"languages",
                         
        staffTypeExperience, @"staffTypeExperience",
        djSelected, @"djSelected",
        liveBandSelected, @"liveBandSelected",
        cateringCompanySelected, @"cateringCompanySelected",
        otherServicesSelected, @"otherServicesSelected",

        djDescription, @"djDescription",
        djWebsite, @"djWebsite",
        djSocialMedia, @"djSocialMedia",
        djCostOfService, @"djCostOfService",
                         
        liveBandDescription, @"liveBandDescription",
        liveBandWebsite, @"liveBandWebsite",
        liveBandSocialMedia, @"liveBandSocialMedia",
        liveBandCostOfService, @"liveBandCostOfService",
                         
        cateringCompanyDescription, @"cateringCompanyDescription",
        cateringCompanyWebsite, @"cateringCompanyWebsite",
        cateringCompanySocialMedia, @"cateringCompanySocialMedia",
        cateringCompanyCostOfService, @"cateringCompanyCostOfService",
                         
        otherServicesDescription, @"otherServicesDescription",
        otherServicesWebsite, @"otherServicesWebsite",
        otherServicesSocialMedia, @"otherServicesSocialMedia",
        otherServicesCostOfService, @"otherServicesCostOfService",
             
        hasDriverLicense, @"hasDriverLicense",
        hasCommercialLicense, @"hasCommercialLicense",
        hasTattoos, @"Tattoos",
        hasPiercings, @"Piercings",
        ethnicity, @"ethnicity",
        height, @"height",
        weight, @"weight",
        hairColor, @"hairColor",
        eyeColor, @"eyeColor",
        pantSize, @"pantSize",
        shoeSize, @"shoeSize",
        tshirtSize, @"tshirtSize",
                         
        chestSize, @"chestSize",
        waistSize, @"waistSize",
        hipsSize, @"hipsSize",
        dressSize, @"dressSize",
                         
        hasProfessionalInsurance, @"ProfessionalInsurance",
        isIncorporated, @"Incorporated",
        ssn, @"ssn",
        ein, @"ein",
        businessName, @"businessName",
        desiredHourlyRate, @"desiredHourlyRate",
        desiredWeeklyRate, @"desiredWeeklyRate",
        travelPercentage, @"travelPercentage",
                         
        directDepositDesired, @"DirectDeposit",
        directDepositRoutingNumber, @"DirectDepositRoutingNumber",
        directDepositAccountNumber, @"DirectDepositAccountNumber",
                         
    nil];
    
    return tmp;
}//eom

-(void) printUserData
{
    NSLog(@" ");
    NSLog(@" ");
    NSLog(@" ***********************************************");
    //view controller 1
    NSLog(@" account type:    %@", accountType);
    NSLog(@" firstName:       %@", firstName);
    NSLog(@" middleName:      %@", middleName);
    NSLog(@" lastName:        %@", lastName);
    NSLog(@" nickName:        %@", nickName);
    NSLog(@" email:           %@", email);
    NSLog(@" password:        %@", password);
    NSLog(@" dob:             %@", dateOfBirth);
    //view controller 2
    NSLog(@" cellphone:       %@", cellphone);
    NSLog(@" address:         %@", completeAddress);
    NSLog(@" gender type:     %d", genderType);//0 female 1 male
    NSLog(@" gender:          %@", gender);//0 female 1 male
    NSLog(@" languages:       %@", languages);
    
    //view controller 3
    NSLog(@" staff experience:          %@", staffTypeExperience);
    NSLog(@" Dj Selected?               %d", djSelected);
    NSLog(@" Live Band Selected?        %d", liveBandSelected);
    NSLog(@" Catering Company Selected? %d", cateringCompanySelected);
    NSLog(@" Other Services Selected?   %d", otherServicesSelected);
    
    //view controller 4
    NSLog(@" djDescription:      %@", djDescription);
    NSLog(@" djWebsite:          %@", djWebsite);
    NSLog(@" djSocialMedia:      %@", djSocialMedia);
    NSLog(@" djCostOfService:    %@", djCostOfService);
    
    //view controller 5
    NSLog(@" liveBandDescription:      %@", liveBandDescription);
    NSLog(@" liveBandWebsite:          %@", liveBandWebsite);
    NSLog(@" liveBandSocialMedia:      %@", liveBandSocialMedia);
    NSLog(@" liveBandCostOfService:    %@", liveBandCostOfService);
    
    //view controller 6
    NSLog(@" cateringCompanyDescription:      %@", cateringCompanyDescription);
    NSLog(@" cateringCompanyWebsite:          %@", cateringCompanyWebsite);
    NSLog(@" cateringCompanySocialMedia:      %@", cateringCompanySocialMedia);
    NSLog(@" cateringCompanyCostOfService:    %@", cateringCompanyCostOfService);
    
    //view controller 7
    NSLog(@" otherServicesDescription:      %@", otherServicesDescription);
    NSLog(@" otherServicesWebsite:          %@", otherServicesWebsite);
    NSLog(@" otherServicesSocialMedia:      %@", otherServicesSocialMedia);
    NSLog(@" otherServicesCostOfService:    %@", otherServicesCostOfService);
    
    //view controller 8
    NSLog(@" driver license?        %d", hasDriverLicense);
    NSLog(@" commercial license?    %d", hasCommercialLicense);
    NSLog(@" tattoos?               %d", hasTattoos);
    NSLog(@" piercings?             %d", hasPiercings);
    NSLog(@" ethnicity              %@", ethnicity);
    NSLog(@" height                 %@", height);
    NSLog(@" weight                 %@", weight);
    NSLog(@" hairColor              %@", hairColor);
    NSLog(@" eyeColor               %@", eyeColor);
    NSLog(@" pantSize               %@", pantSize);
    NSLog(@" shoeSize               %@", shoeSize);
    NSLog(@" tshirtSize             %@", tshirtSize);
    
    //view controller 9
    NSLog(@" chestSize              %@", chestSize);
    NSLog(@" waistSize              %@", waistSize);
    NSLog(@" hipsSize               %@", hipsSize);
    NSLog(@" dressSize              %@", dressSize);
    
    //view controller 10
    NSLog(@" has professional insurance?    %d", hasProfessionalInsurance);
    NSLog(@" is Incorporated ?              %d", isIncorporated);
    NSLog(@" ssn                            %@", ssn);
    NSLog(@" ein                            %@", ein);
    NSLog(@" business Name                  %@", businessName);
    NSLog(@" desired Hourly Rate            %@", desiredHourlyRate);
    NSLog(@" desired Weekly Rate            %@", desiredWeeklyRate);
    NSLog(@" travel Percentage              %@", travelPercentage);
    
    //view controller 13
    NSLog(@" direct deposit selected    %d", directDepositDesired);
    NSLog(@" direct deposit routing     %@", directDepositRoutingNumber);
    NSLog(@" direct deposit account     %@", directDepositAccountNumber);
    
    
    NSLog(@" - - - - - - - - - - - - - ");
    
}//eom



@end
