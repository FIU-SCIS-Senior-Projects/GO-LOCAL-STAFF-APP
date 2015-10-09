//
//  StaffRegistration.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/23/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisteredStaff : NSObject
{
    NSString *accountType;
    
    //view controller 0
    NSString *firstName;
    NSString *middleName;
    NSString *lastName;
    NSString *nickName;
    NSString *email;
    NSString *username;
    NSString *password;
    NSString *dateOfBirth;

    //view controller 2
    NSString *cellphone;
    NSString *completeAddress;
    bool genderType; //0-female | 1 -male
    NSString *gender;
    NSString *languages;

    //view controller 3
    NSMutableArray * staffTypeExperience;
    NSMutableArray * staffServicesExperience;
    BOOL djSelected;
    BOOL liveBandSelected;
    BOOL cateringCompanySelected;
    BOOL otherServicesSelected;

    /* 
     services have the following:
        description
        website
        socialmedia
        cost of service
     */
    //view controller 4
    NSMutableArray *djInfo;
    
    //view controller 5
    NSMutableArray *liveBandInfo;
    
    //view controller 6
    NSMutableArray *cateringCompanyInfo;
    
    //view controller 7
    NSMutableArray *otherServicesInfo;
 

    //view controller 8
    BOOL hasDriverLicense;
    BOOL hasCommercialLicense;
    BOOL hasTattoos;
    BOOL hasPiercings;
    NSString *ethnicity;
    NSString *height;
    NSString *weight;
    NSString *hairColor;
    NSString *eyeColor;
    NSString *pantSize;
    NSString *shoeSize;
    NSString *tshirtSize;

    //view controller 9
    NSString *chestSize;
    NSString *waistSize;
    NSString *hipsSize;
    NSString *dressSize;

    //view controller 10
    BOOL hasProfessionalInsurance;
    BOOL isIncorporated;
    NSString *ssn;
    NSString *ein;
    NSString *businessName;
    NSString *desiredHourlyRate;
    NSString *desiredWeeklyRate;
    NSString *travelPercentage;

    //view controller 13
    BOOL directDepositDesired;
    NSString *directDepositRoutingNumber;
    NSString *directDepositAccountNumber;
    
}

/* get methods */
-(BOOL) isDJ;
-(BOOL) isLiveBand;
-(BOOL) isCateringCompany;
-(BOOL) isOtherServices;
-(BOOL) isMale;
-(NSString *) getAccountType;
-(NSString *) getFirstName;
-(NSString *) getMiddleName;
-(NSString *) getLastName;
-(NSString *) getNickName;
-(NSString *) getEmail;
-(NSString *) getUserName;
-(NSString *) getPassword;
-(NSString *) getDateOfBirth;
-(NSString *) getCellPhone;
-(NSString *) getAddress;
-(NSString *) getGender;
-(NSString *) getLanguages;
-(NSMutableArray *) getExperience;
-(NSMutableArray *) getServices;
-(NSMutableArray *) getDJInfo;
-(NSMutableArray *) getLiveBandInfo;
-(NSMutableArray *) getCateringCompanyInfo;
-(NSMutableArray *) getOtherServicesInfo;
-(BOOL) hasDriverLicense;
-(BOOL) hasCommercialDriverLicense;
-(BOOL) hasTattoos;
-(BOOL) hasPiercings;
-(NSString *) getEthnicity;
-(NSString *) getHeight;
-(NSString *) getWeight;
-(NSString *) getHairColor;
-(NSString *) getEyeColor;
-(NSString *) getPantSize;
-(NSString *) getShoeSize;
-(NSString *) getTshirtSize;
-(NSString *) getChestSize;
-(NSString *) getWaistSize;
-(NSString *) getHipSize;
-(NSString *) getDressSize;
-(BOOL) hasProfessionalInsurance;
-(BOOL) isCorporated;
-(NSString *) getSSN;
-(NSString *) getEIN;
-(NSString *) getBusinessName;
-(NSString *) getDesiredHourlyRate;
-(NSString *) getDesiredWeeklyRate;
-(NSString *) getTravelPercentage;
-(BOOL) wantsDirectDeposit;
-(NSString *) getdirectDepositRoutingNumber;
-(NSString *) getdirectDepositAccountNumber;


/**  set methods **/
    //controller 0
-(void) setName:(NSString *)fName withMiddleInitial:(NSString *)middleInitial andLastName:(NSString *)lName;
-(void) setNickname:(NSString *) nicknameProvided;
-(void) setEmail:(NSString *) emailProvided;
-(void) setUserName:(NSString *) usernameProvided;
-(void) setPassword:(NSString *) passwordProvided;
-(void) setDOB:(NSString *) dobProvided;

    //controller 1
-(void) setCellphone:(NSString *) cellphoneProvided;

    //controller 2
-(void) setAddress:(NSString *) addressProvided;
-(void) setGender:(bool) genderProvided;
-(void) setLanguages:(NSString *) languagesProvided;

    //controller 3
-(void) setExperience:(NSMutableArray *) experienceProvided;
-(void) setServiceExperience:(NSMutableArray *) servicesSelected;
-(void) setServicesSelected:(BOOL) isDj  liveBand:(BOOL) isLiveBand  cateringCompany:(BOOL) isCateringCompany  otherServices:(BOOL) isOtherServices;

    //controller 4 <-> 7
-(void) setDJInfo:(NSMutableArray *) information;
-(void) setLiveBandInfo:(NSMutableArray *) information;
-(void) setCateringCompanyInfo:(NSMutableArray *) information;
-(void) setOtherServicesInfo:(NSMutableArray *) information;

    //controller 8
-(void) setLicenseInfo:(BOOL) driverLicense hasCommercialLicense:(BOOL) commercialLicense;
-(void) setTattoos:(BOOL) tattoosSelected;
-(void) setPiercings:(BOOL) piercingsSelected;
-(void) setEthnicity:(NSString *) ethnicitySelected;
-(void) setHeight:(NSString *) heightProvided;
-(void) setWeight:(NSString *) weightProvided;
-(void) setHairColor:(NSString *) hairColorProvided;
-(void) setEyeColor:(NSString *) eyeColorProvided;
-(void) setPantSize:(NSString *) pantSizeProvided;
-(void) setShoeSize:(NSString *) shoeSizeProvided;
-(void) setTshirtSize:(NSString *) tshirtSizeProvided;


    //controller 9
-(void) setChest:(NSString *) chestProvided;
-(void) setWaist:(NSString *) waistProvided;
-(void) setHipSize:(NSString *) hipSizeProvided;
-(void) setDressSize:(NSString *) dressSizeProvided;

    //controller 10
-(void) setProfessionalInsurance:(BOOL) professionalInsurance;
-(void) setIncorporatedInfo:(BOOL) incorporated ssn:(NSString *)ssnProvided  ein:(NSString *) einProvided businessName:(NSString *)businessNameProvided;
-(void) setWageRate:(NSString *) hourlyRateProvided orDesiredWeeklyRate:(NSString *) weeklyRateProvided;
-(void) setTravelPercentage:(NSString *) travelPercentageProvided;

    //controller 13
-(void) setDirectDeposit:(BOOL) directDeposit withRouting:(NSString *) routingProvided andWithAccountNumber:(NSString *) accountNumberProvided;


-(void) printUserData;



@end
