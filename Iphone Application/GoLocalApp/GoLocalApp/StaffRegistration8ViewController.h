//
//  StaffRegistration7ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration8ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UISwitch *validDriverLicenseSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *validCommercialDriverLicenseSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *hasTattoosSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *hasPiercingsSwitch;

@property (weak, nonatomic) IBOutlet UITextField *ethnicityTextField;
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UITextField *hairColorTextField;
@property (weak, nonatomic) IBOutlet UITextField *eyeColorTextField;
@property (weak, nonatomic) IBOutlet UITextField *pantSizeTextField;
@property (weak, nonatomic) IBOutlet UITextField *shoeSizeTextField;
@property (weak, nonatomic) IBOutlet UITextField *tshirtSizeTextField;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)submitForm:(id)sender;

- (IBAction)textFieldValueChanged:(id)sender;

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


@end
