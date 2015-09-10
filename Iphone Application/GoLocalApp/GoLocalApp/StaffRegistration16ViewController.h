//
//  StaffRegistration16ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/8/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration16ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *termsAndAgreements;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UISwitch *agreeTermsSwitch;
- (IBAction)agreeTermsValueChanged:(id)sender;

- (IBAction)submitForm:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;




//PASSED VALUES FROM PREVIOUS CONTROLLER

//view controller 1
@property (nonatomic)  NSString *firstName;
@property (nonatomic)  NSString *middleName;
@property (nonatomic)  NSString *lastName;
@property (nonatomic)  NSString *nickName;
@property (nonatomic)  NSString *email;
@property (nonatomic)  NSString *password;
@property (nonatomic)  NSString *cellphone;

//view controller 2
@property (nonatomic)  NSString *address;
@property (nonatomic)  NSString *city;
@property (nonatomic)  NSString *zipcode;
@property (nonatomic)  NSString *stateSelected;
@property (nonatomic)  BOOL djSelected;
@property (nonatomic)  BOOL liveBandSelected;
@property (nonatomic)  BOOL cateringCompanySelected;
@property (nonatomic)  BOOL otherServicesSelected;

//view controller 3 - DJ only
@property (nonatomic)  NSString *djDescription;
@property (nonatomic)  NSString *djWebsite;
@property (nonatomic)  NSString *djSocialMedia;

//view controller 4 - Live Band Only
@property (nonatomic)  NSString *liveBandDescription;
@property (nonatomic)  NSString *liveBandWebsite;
@property (nonatomic)  NSString *liveBandSocialMedia;


//view controller 5 - Catering Company Only
@property (nonatomic)  NSString *cateringCompanyDescription;
@property (nonatomic)  NSString *cateringCompanyWebsite;
@property (nonatomic)  NSString *cateringCompanySocialMedia;

//view controller 6
@property (nonatomic)  NSString *otherServicesDescription;
@property (nonatomic)  NSString *otherServicesWebsite;
@property (nonatomic)  NSString *otherServicesSocialMedia;

//view controller 7
@property (nonatomic)  NSString *dob;
@property (nonatomic)  bool gender;// 0-female 1-male
@property (nonatomic)  NSString *languages;

//view controller 8
@property (nonatomic)  int ethnicity;
@property (nonatomic)  bool typeOfLicense;//0-driver 1-commercial

//view controller 9
@property (nonatomic)  NSString *height;
@property (nonatomic)  NSString *weight;
@property (nonatomic)  NSString *hairColor;
@property (nonatomic)  NSString *eyeColor;
@property (nonatomic)  NSString *pantSize;
@property (nonatomic)  NSString *shoeSize;
@property (nonatomic)  NSString *tshirtSize;
@property (nonatomic)  NSString *desiredHourlyRate;
@property (nonatomic)  NSString *desiredWeeklyRate;
@property (nonatomic)  bool tattoos;  //0 - no | 1 - yes
@property (nonatomic)  bool piercings;//0 - no | 1 - yes

//view controller 10 - females ONLY
@property (nonatomic)  NSString *chestSize;
@property (nonatomic)  NSString *waistSize;
@property (nonatomic)  NSString *hipsSize;
@property (nonatomic)  NSString *dressSize;

//view controller 11
@property (nonatomic)  BOOL typeCorporated;
@property (nonatomic)  NSString *ssn;//NotIncorporated field
@property (nonatomic)  NSString *ein;          //incorporated field
@property (nonatomic)  NSString *businessName; //incorporated field
@property (nonatomic)  NSString *citiesWillingToWork;
@property (nonatomic)  BOOL travel;
@property (nonatomic)  BOOL professionalInsurance;

//view controller 14
@property (nonatomic)  BOOL directDepositDesired;
@property (nonatomic)  NSString *DirectDepositRoutingNumber;
@property (nonatomic)  NSString *DirectDepositAccountNumber;

//view controller 15
@property (nonatomic)  BOOL isModel;
@property (nonatomic)  BOOL isBrandAmbassador;
@property (nonatomic)  BOOL isFlyerDistributor;
@property (nonatomic)  BOOL isFieldMarketingManager;
@property (nonatomic)  BOOL isDancer;
@property (nonatomic)  BOOL iswaiterOrWaitress;
@property (nonatomic)  BOOL isProductionAssistant;
@property (nonatomic)  BOOL isSalesExecutive;

@end
