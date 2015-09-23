//
//  StaffRegistration5ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration6ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *cateringCompanyDescription;
@property (weak, nonatomic) IBOutlet UITextField *cateringCompanyWebsite;
@property (weak, nonatomic) IBOutlet UITextView *cateringCompanySocialMedia;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UITextField *costOfServiceTextField;


- (IBAction)textFieldValuesChanged:(UITextField *)sender;

- (IBAction)submitForm:(id)sender;

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
@property (nonatomic)  BOOL djSelected;
@property (nonatomic)  BOOL liveBandSelected;
@property (nonatomic)  BOOL cateringCompanySelected;
@property (nonatomic)  BOOL otherServicesSelected;


@property (nonatomic)  NSString *djDescription;                 //view controller 4
@property (nonatomic)  NSString *djWebsite;
@property (nonatomic)  NSString *djSocialMedia;
@property (nonatomic)  NSString *djCostOfService;

@property (nonatomic)  NSString *liveBandDescription;           //view controller 5
@property (nonatomic)  NSString *liveBandWebsite;
@property (nonatomic)  NSString *liveBandSocialMedia;
@property (nonatomic)  NSString *liveBandCostOfService;



@end
