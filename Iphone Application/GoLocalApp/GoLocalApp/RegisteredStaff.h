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
    //view controller 1
    NSString *accountType;
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
    NSString *cellphoneCarrier;
    NSString *completeAddress;
    bool genderType; //0-female | 1 -male
    NSString *gender;
    NSString *languages;

    //view controller 3
    NSMutableArray * staffTypeExperience;
    BOOL djSelected;
    BOOL liveBandSelected;
    BOOL cateringCompanySelected;
    BOOL otherServicesSelected;

    //view controller 4
    NSString *djDescription;
    NSString *djWebsite;
    NSString *djSocialMedia;
    NSString *djCostOfService;

    //view controller 5
    NSString *liveBandDescription;
    NSString *liveBandWebsite;
    NSString *liveBandSocialMedia;
    NSString *liveBandCostOfService;

    //view controller 6
    NSString *cateringCompanyDescription;
    NSString *cateringCompanyWebsite;
    NSString *cateringCompanySocialMedia;
    NSString *cateringCompanyCostOfService;

    //view controller 7
    NSString *otherServicesDescription;
    NSString *otherServicesWebsite;
    NSString *otherServicesSocialMedia;
    NSString *otherServicesCostOfService;

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

/**  set methods **/
    //controller 1
-(void) setName:(NSString *)fName withMiddleInitial:(NSString *)middleInitial andLastName:(NSString *)lName;
-(void) setNickname:(NSString *) nicknameProvided;
-(void) setEmail:(NSString *) emailProvided;
-(void) setUserName:(NSString *) usernameProvided;
-(void) setPassword:(NSString *) passwordProvided;
-(void) setDOB:(NSString *) dobProvided;

    //controller 2
-(void) setCellphone:(NSString *) cellphoneProvided withCarrer:(NSString *) carrierProvided;
-(void) setAddress:(NSString *) addressProvided;
-(void) setGender:(bool) genderProvided;
-(void) setLanguages:(NSString *) languagesProvided;

    //controller 3
-(void) setExperience:(NSMutableArray *) experienceProvided;
-(void) setServicesSelected:(BOOL) isDj  liveBand:(BOOL) isLiveBand  cateringCompany:(BOOL) isCateringCompany  otherServices:(BOOL) isOtherServices;

    //controller 4 <-> 7
-(void) setDJInfo:(NSString *) description withWebsite:(NSString *) website withSocialMedia:(NSString *) socialMedia andCostOfServices:(NSString *) costOfService;
-(void) setLiveBandInfo:(NSString *) description withWebsite:(NSString *) website withSocialMedia:(NSString *) socialMedia andCostOfServices:(NSString *) costOfService;
-(void) setCateringCompanyInfo:(NSString *) description withWebsite:(NSString *) website withSocialMedia:(NSString *) socialMedia andCostOfServices:(NSString *) costOfService;
-(void) setOtherServicesInfo:(NSString *) description withWebsite:(NSString *) website withSocialMedia:(NSString *) socialMedia andCostOfServices:(NSString *) costOfService;

    //controller 8
-(void) setLicenseInfo:(BOOL) driverLicense hasCommercialLicense:(BOOL) commcercialLicense;
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

    //controller 14
-(NSDictionary *) getStaffInfo;

-(void) printUserData;



@end
