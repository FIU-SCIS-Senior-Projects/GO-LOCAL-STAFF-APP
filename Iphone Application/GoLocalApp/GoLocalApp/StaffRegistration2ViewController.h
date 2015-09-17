//
//  StaffRegistration2ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration2ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>


@property (weak, nonatomic) IBOutlet UITextField *cellphone;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *zipcode;

//picker1
@property (weak, nonatomic) IBOutlet UITextField *state;

//picker2
@property (weak, nonatomic) IBOutlet UITextField *nativeLanguage;
@property (weak, nonatomic) IBOutlet UITextField *secondLanguage;
@property (weak, nonatomic) IBOutlet UITextField *thirdLanguage;
@property (nonatomic, strong) NSString * nativeSelected; //native language selected
@property (nonatomic, strong) NSString * secondSelected; //second language selected
@property (nonatomic, strong) NSString * thirdSelected; //third language selected


@property (weak, nonatomic) IBOutlet UIButton *maleButton;
@property (weak, nonatomic) IBOutlet UIButton *femaleButton;

- (IBAction)genderValueChanged:(UIButton *)sender;
- (IBAction)textFieldValuesChanged:(UITextField *)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *textInputScrollView;

//below will go to next view
//@property (weak, nonatomic) IBOutlet UISwitch *djSwitch;
//@property (nonatomic) BOOL djSelected; //DJ status
//
//@property (weak, nonatomic) IBOutlet UISwitch *liveBandSwitch;
//@property (nonatomic) BOOL liveBandSelected; //live band status
//
//@property (weak, nonatomic) IBOutlet UISwitch *cateringCompanySwitch;
//@property (nonatomic) BOOL cateringCompanySelected; //catering company status
//
//@property (weak, nonatomic) IBOutlet UISwitch *otherServicesSwitch;
//@property (nonatomic) BOOL otherServicesSelected; //other services status

- (IBAction)submitForm:(id)sender;

//PASSED VALUEs FROM PREVIOUS CONTROLLER
@property (nonatomic)  NSString *accountType;                     //view controller 1
@property (nonatomic)  NSString *firstName;
@property (nonatomic)  NSString *middleName;
@property (nonatomic)  NSString *lastName;
@property (nonatomic)  NSString *nickName;
@property (nonatomic)  NSString *email;
@property (nonatomic)  NSString *username;
@property (nonatomic)  NSString *password;
@property (nonatomic)  NSString *dateOfBirth;

@end


