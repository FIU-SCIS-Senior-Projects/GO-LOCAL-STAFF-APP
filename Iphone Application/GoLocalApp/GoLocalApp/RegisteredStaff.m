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
    
    NSMutableArray * temp= [[NSMutableArray alloc]init];
    
    accountType = @"Staff";
    [self setName:@" " withMiddleInitial:@" " andLastName:@" "];
    [self setNickname:@" "];
    [self setEmail:@" "];
    [self setUserName:@" "];
    [self setPassword:@" "];
    [self setDOB:@" "];
    [self setCellphone:@" "];
    [self setAddress:@" " withCity:@" " withZipcode:@" " andState:@" "];
    [self setGender:0];
    [self setLanguages:@" "];
    [self setExperience:temp];
    [self setServicesSelected:FALSE liveBand:FALSE cateringCompany:FALSE otherServices:FALSE];
    [self setDJInfo:temp];
    [self setLiveBandInfo:temp];
    [self setCateringCompanyInfo:temp];
    [self setOtherServicesInfo:temp];
    [self setDriverLicense:FALSE];
    [self setCommercialLicense:FALSE];
    [self setTattoos:FALSE];
    [self setPiercings:FALSE];
    [self setEthnicity:@" " withCode:@" "];
    [self setHeight:@" "];
    [self setWeight:@" "];
    [self setHairColor:@" "];
    [self setEyeColor:@" "];
    [self setPantSize:@" "];
    [self setShoeSize:@" "];
    [self setTshirtSize:@" "];
    [self setChest:@" "];
    [self setWaist:@" "];
    [self setHipSize:@" "];
    [self setDressSize:@" "];
    [self setProfessionalInsurance:FALSE];
    [self setIncorporatedInfo:FALSE ssn:@" " ein:@" " businessName:@" "];
    [self setWageRate:@" " orDesiredWeeklyRate:@" "];
    [self setTravelPercentage:@" "];
    [self setDirectDeposit:FALSE withRouting:@" " andWithAccountNumber:@" "];
    
//    [self printUserData];
  
}//eom


-(void) setStaffID:(NSString *) staffIDProvided
{
    StaffID = [staffIDProvided intValue];
}//eom

    //view controller 0
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

    //view controller 1
-(void)setCellphone:(NSString *) cellphoneProvided
{
    cellphone = cellphoneProvided;
}//eom

    //view controller 2
-(void) setAddress:(NSString *) address withCity:(NSString*)cityReceived withZipcode:(NSString*)zipcodeReceived andState:(NSString *)stateReceived;
{
    completeAddress = address;
    addressCity = cityReceived;
    addressZipcode = zipcodeReceived;
    addressState = stateReceived;
    
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

-(void) setServiceExperience:(NSMutableArray *) servicesSelected
{
    staffServicesExperience = servicesSelected;

}//eom

-(void) setServicesSelected:(BOOL) isDj  liveBand:(BOOL) isLiveBand  cateringCompany:(BOOL) isCateringCompany  otherServices:(BOOL) isOtherServices
{
    djSelected = isDj;
    liveBandSelected = isLiveBand;
    cateringCompanySelected = isCateringCompany;
    otherServicesSelected = isOtherServices;
    
}//eom

    //view controller 4
-(void) setDJInfo:(NSMutableArray *) information
{
    djInfo = information;
    
}//eom

    //view controller 5
-(void) setLiveBandInfo:(NSMutableArray *) information
{
    liveBandInfo   = information;
    
}//eom

    //view controller 6
-(void) setCateringCompanyInfo:(NSMutableArray *) information
{
    cateringCompanyInfo   = information;
    
}//eom

    //view controller 7
-(void) setOtherServicesInfo:(NSMutableArray *) information
{
    otherServicesInfo   = information;
    
}//eom

//view controller 8
-(void) setDriverLicense:(BOOL)  userHasDriverLicense
{
    hasDriverLicense        =  userHasDriverLicense;
}//eom

-(void) setCommercialLicense:(BOOL)  userHasCommercialLicense
{
    hasCommercialLicense    =  userHasCommercialLicense;
}//eom

-(void) setTattoos:(BOOL) tattoosSelected
{
    hasTattoos      =   tattoosSelected;
}//eom


-(void) setPiercings:(BOOL) piercingsSelected
{
    hasPiercings    =   piercingsSelected;
}//eom

-(void) setEthnicity:(NSString *) ethnicitySelected withCode:(NSString *) ethnicityCodeProvided
{
    ethnicity       =   ethnicitySelected;
    ethnicityCode   =   ethnicityCodeProvided;
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


-(NSString *) getStaffID
{
   return [NSString stringWithFormat:@"%d",StaffID];
}

-(NSString *) getAccountType
{
    return accountType;
}//eom

-(NSString *) getFirstName
{
    return firstName;
}//eom

-(NSString *) getMiddleName
{
    return middleName;
}//eom

-(NSString *) getLastName
{
    return lastName;
}//eom


-(NSString *) getNickName
{
    return nickName;
}//eom


-(NSString *) getEmail
{
    return email;
}//eom

-(NSString *) getUserName
{
    return username;
}//eom

-(NSString *) getPassword
{
    return password;
}//eom

-(NSString *) getDateOfBirth
{
    return dateOfBirth;
}//eom

-(NSString *) getCellPhone
{
    return cellphone;
}//eom

-(NSString *) getAddress
{
    return completeAddress;
}//eom

-(NSString *) getAddressCity
{
    return addressCity;
}//eom

-(NSString *) getAddressZipcode
{
    return addressZipcode;
}//eom


-(NSString *) getAddressState
{
    return addressState;
}//eom

-(NSString *) getGender
{
    return gender;
}//eom

-(NSString *) getLanguages
{
    return languages;
}//eom

-(NSMutableArray *) getExperience
{
    return staffTypeExperience;
}//eom

-(NSMutableArray *) getServices
{
    return staffServicesExperience;
}//eom

-(NSMutableArray *) getDJInfo
{
    return djInfo;
}//eom

-(NSMutableArray *) getLiveBandInfo
{
    return liveBandInfo;
}//eom

-(NSMutableArray *) getCateringCompanyInfo
{
    return cateringCompanyInfo;
}//eom

-(NSMutableArray *) getOtherServicesInfo
{
    return otherServicesInfo;
}//eom

-(BOOL) hasDriverLicense
{
    return hasDriverLicense;
}//eom

-(BOOL) hasCommercialDriverLicense
{
    return hasCommercialLicense;
}//eom

-(BOOL) hasTattoos
{
    return hasTattoos;
}//eom

-(BOOL) hasPiercings
{
    return hasPiercings;
}//eom

-(NSString *) getEthnicity
{
    return ethnicity;
}//eom

-(NSString *) getEthnicityCode
{
    return ethnicityCode;
}//eom

-(NSString *) getHeight
{
    return height;
}//eom

-(NSString *) getWeight
{
    return weight;
}//eom

-(NSString *) getHairColor
{
    return hairColor;
}//eom

-(NSString *) getEyeColor
{
    return eyeColor;
}//eom

-(NSString *) getPantSize
{
    return pantSize;
}//eom

-(NSString *) getShoeSize
{
    return shoeSize;
}//eom

-(NSString *) getTshirtSize
{
    return tshirtSize;
}//eom

-(NSString *) getChestSize
{
    return chestSize;
}//eom

-(NSString *) getWaistSize
{
    return waistSize;
}//eom

-(NSString *) getHipSize
{
    return hipsSize;
}//eom

-(NSString *) getDressSize
{
    return dressSize;
}//eom

-(BOOL) hasProfessionalInsurance
{
    return hasProfessionalInsurance;
}//eom

-(BOOL) isCorporated
{
    return isIncorporated;
}//eom

-(NSString *) getSSN
{
    return ssn;
}//eom

-(NSString *) getEIN
{
    return ein;
}//eom

-(NSString *) getBusinessName
{
    return businessName;
}//eom

-(NSString *) getDesiredHourlyRate
{
    return desiredHourlyRate;
}//eom

-(NSString *) getDesiredWeeklyRate
{
    return desiredWeeklyRate;
}//eom

-(NSString *) getTravelPercentage
{
    return travelPercentage;
}//eom

-(BOOL) wantsDirectDeposit
{
    return directDepositDesired;
}//eom

-(NSString *) getdirectDepositRoutingNumber
{
    return directDepositRoutingNumber;
}//eom

-(NSString *) getdirectDepositAccountNumber
{
    return directDepositAccountNumber;
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
    NSLog(@" state:           %@", addressState);
    NSLog(@" city:            %@", addressCity);
    NSLog(@" zipcode:         %@", addressZipcode);
    NSLog(@" gender type:     %d", genderType);//0 female 1 male
    NSLog(@" gender:          %@", gender);//0 female 1 male
    NSLog(@" languages:       %@", languages);
    
    //view controller 3
    NSLog(@" staff experience:          %@", staffTypeExperience);
    NSLog(@" services:                  %@", staffServicesExperience);
    NSLog(@" Dj Selected?               %d", djSelected);
    NSLog(@" Live Band Selected?        %d", liveBandSelected);
    NSLog(@" Catering Company Selected? %d", cateringCompanySelected);
    NSLog(@" Other Services Selected?   %d", otherServicesSelected);
    
    //view controller 4
    NSLog(@" dj information:        %@", djInfo);
    
    //view controller 5
    NSLog(@" liveBand information:   %@", liveBandInfo);
    
    //view controller 6
    NSLog(@" cateringCompany information:      %@", cateringCompanyInfo);
    
    //view controller 7
    NSLog(@" otherServices information:      %@", otherServicesInfo);
    
    //view controller 8
    NSLog(@" driver license?        %d", hasDriverLicense);
    NSLog(@" commercial license?    %d", hasCommercialLicense);
    NSLog(@" tattoos?               %d", hasTattoos);
    NSLog(@" piercings?             %d", hasPiercings);
    NSLog(@" ethnicity              %@", ethnicity);
    NSLog(@" ethnicity Code:        %@", ethnicityCode);
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