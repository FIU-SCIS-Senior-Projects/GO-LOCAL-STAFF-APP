//
//  StaffRegistration11ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration11ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UISwitch *notIncorporated;
@property (weak, nonatomic) IBOutlet UISwitch *incorporated;
@property (nonatomic)  bool typeCorporated; // 0 - not incorporated | 1 - corporated

@property (weak, nonatomic) IBOutlet UITextField *ssn;
@property (weak, nonatomic) IBOutlet UITextField *ein;
@property (weak, nonatomic) IBOutlet UITextField *businessName;
@property (weak, nonatomic) IBOutlet UITextView *citiesWillingToWork;

@property (weak, nonatomic) IBOutlet UISwitch *willingToTravel;
@property (nonatomic)  bool travel; // 0 - not traveling | 1 - traveling

@property (weak, nonatomic) IBOutlet UISwitch *hasProfessionalInsurance;
@property (nonatomic)  bool professionalInsurance; // 0 - not prof insurance | 1 - prof insurance

- (IBAction)notIncorporatedValueChanged:(id)sender;
- (IBAction)incorporatedValueChanged:(id)sender;
- (IBAction)submitForm:(id)sender;


//PASSED VALUEs FROM PREVIOUS CONTROLLER
@property (nonatomic)  NSString *firstName;                     //view controller 1
@property (nonatomic)  NSString *middleName;
@property (nonatomic)  NSString *lastName;
@property (nonatomic)  NSString *nickName;
@property (nonatomic)  NSString *email;
@property (nonatomic)  NSString *password;
@property (nonatomic)  NSString *cellphone;

@property (nonatomic)  NSString *address;                       //view controller 2
@property (nonatomic)  NSString *city;
@property (nonatomic)  NSString *zipcode;
@property (nonatomic)  NSString *stateSelected;

@property (nonatomic)  NSString *dob;                           //view controller 7
@property (nonatomic)  bool gender;// 0-female 1-male
@property (nonatomic)  NSString *languages;

@property (nonatomic)  int ethnicity;                           //view controller 8
@property (nonatomic)  bool typeOfLicense;//0-driver 1-commercial

@property (nonatomic)  NSString *height;                        //view controller 9
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

@property (nonatomic)  NSString *chestSize;                     //view controller 10
@property (nonatomic)  NSString *waistSize;
@property (nonatomic)  NSString *hipsSize;
@property (nonatomic)  NSString *dressSize;


/* these may be Null */
@property (nonatomic)  BOOL djSelected;                         //view controller 3
@property (nonatomic)  NSString *djDescription;
@property (nonatomic)  NSString *djWebsite;
@property (nonatomic)  NSString *djSocialMedia;

@property (nonatomic)  BOOL liveBandSelected;                   //view controller 4
@property (nonatomic)  NSString *liveBandDescription;
@property (nonatomic)  NSString *liveBandWebsite;
@property (nonatomic)  NSString *liveBandSocialMedia;

@property (nonatomic)  BOOL cateringCompanySelected;            //view controller 5
@property (nonatomic)  NSString *cateringCompanyDescription;
@property (nonatomic)  NSString *cateringCompanyWebsite;
@property (nonatomic)  NSString *cateringCompanySocialMedia;

@property (nonatomic)  BOOL otherServicesSelected;              //view controller 6
@property (nonatomic)  NSString *otherServicesDescription;
@property (nonatomic)  NSString *otherServicesWebsite;
@property (nonatomic)  NSString *otherServicesSocialMedia;


@end
