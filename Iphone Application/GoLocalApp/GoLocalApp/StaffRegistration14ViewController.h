//
//  StaffRegistration16ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/8/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration14ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *termsAndAgreements;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UISwitch *agreeTermsSwitch;
- (IBAction)agreeTermsValueChanged:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *submitButton;







//PASSED VALUES FROM PREVIOUS CONTROLLER
@property (nonatomic)  NSString *accountType;                   //view controller 1
@property (nonatomic)  NSString *firstName;
@property (nonatomic)  NSString *middleName;
@property (nonatomic)  NSString *lastName;
@property (nonatomic)  NSString *nickName;
@property (nonatomic)  NSString *email;
@property (nonatomic)  NSString *username;
@property (nonatomic)  NSString *password;
@property (nonatomic)  NSString *dateOfBirth;

@property (nonatomic)  NSString *cellphone;                     //view controller 2
@property (nonatomic)  NSString *completeAddress;
@property (nonatomic)  bool gender; //0-female | 1 -male
@property (nonatomic)  NSString *languages;

@property (nonatomic) NSMutableArray * staffTypeExperience;     //view controller 3

@property (nonatomic)  BOOL hasDriverLicense;                   //view controller 8
@property (nonatomic)  BOOL hasCommercialLicense;
@property (nonatomic)  BOOL hasTattos;
@property (nonatomic)  BOOL hasPiercings;
@property (nonatomic)  NSString *ethnicity;
@property (nonatomic)  NSString *height;
@property (nonatomic)  NSString *weight;
@property (nonatomic)  NSString *hairColor;
@property (nonatomic)  NSString *pantSize;
@property (nonatomic)  NSString *shoeSize;
@property (nonatomic)  NSString *tshirtSize;

@property (nonatomic)  NSString *chestSize;                     //view controller 9
@property (nonatomic)  NSString *waistSize;
@property (nonatomic)  NSString *hipsSize;
@property (nonatomic)  NSString *dressSize;

@property (nonatomic)  BOOL isIncorporated;                     //view controller 10
@property (nonatomic)  NSString *ssn;
@property (nonatomic)  NSString *ein;
@property (nonatomic)  NSString *businessName;
@property (nonatomic)  NSString *desiredHourlyRate;
@property (nonatomic)  NSString *desiredWeeklyRate;
@property (nonatomic)  NSString *travelPercentage;

@property (nonatomic)  BOOL directDepositDesired;                     //view controller 13
@property (nonatomic)  NSString *DirectDepositRoutingNumber;
@property (nonatomic)  NSString *DirectDepositAccountNumber;



///* these may be Null */
//@property (nonatomic)  BOOL djSelected;                         //view controller 3
//@property (nonatomic)  NSString *djDescription;
//@property (nonatomic)  NSString *djWebsite;
//@property (nonatomic)  NSString *djSocialMedia;
//
//@property (nonatomic)  BOOL liveBandSelected;                   //view controller 4
//@property (nonatomic)  NSString *liveBandDescription;
//@property (nonatomic)  NSString *liveBandWebsite;
//@property (nonatomic)  NSString *liveBandSocialMedia;
//
//@property (nonatomic)  BOOL cateringCompanySelected;            //view controller 5
//@property (nonatomic)  NSString *cateringCompanyDescription;
//@property (nonatomic)  NSString *cateringCompanyWebsite;
//@property (nonatomic)  NSString *cateringCompanySocialMedia;
//
//@property (nonatomic)  BOOL otherServicesSelected;              //view controller 6
//@property (nonatomic)  NSString *otherServicesDescription;
//@property (nonatomic)  NSString *otherServicesWebsite;
//@property (nonatomic)  NSString *otherServicesSocialMedia;




@end
