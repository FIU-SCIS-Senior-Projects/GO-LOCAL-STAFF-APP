//
//  StaffRegistration9ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration9ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *height;
@property (weak, nonatomic) IBOutlet UITextField *weight;
@property (weak, nonatomic) IBOutlet UITextField *hairColor;
@property (weak, nonatomic) IBOutlet UITextField *eyeColor;
@property (weak, nonatomic) IBOutlet UITextField *pantSize;
@property (weak, nonatomic) IBOutlet UITextField *shoeSize;
@property (weak, nonatomic) IBOutlet UITextField *tshirtSize;
@property (weak, nonatomic) IBOutlet UITextField *desiredHourlyRate;
@property (weak, nonatomic) IBOutlet UITextField *desiredWeeklyRate;

@property (weak, nonatomic) IBOutlet UISwitch *hasTattoos;
@property (nonatomic)  bool tattoos;

@property (nonatomic)  bool piercings;
@property (weak, nonatomic) IBOutlet UISwitch *hasPiercings;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


- (IBAction)submitForm:(id)sender;

//PASSED VALUEs FROM PREVIOUS CONTROLLER

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




@end
