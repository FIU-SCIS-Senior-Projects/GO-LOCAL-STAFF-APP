//
//  StaffRegistration2ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration2ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *zipcode;

@property (nonatomic, strong) NSArray *stateOptions;    //array to hold states
@property (nonatomic, strong) NSString * stateSelected; //state selected
@property (weak, nonatomic) IBOutlet UIPickerView *states;

@property (weak, nonatomic) IBOutlet UISwitch *djSwitch;
@property (nonatomic) BOOL djSelected; //DJ status

@property (weak, nonatomic) IBOutlet UISwitch *liveBandSwitch;
@property (nonatomic) BOOL liveBandSelected; //live band status

@property (weak, nonatomic) IBOutlet UISwitch *cateringCompanySwitch;
@property (nonatomic) BOOL cateringCompanySelected; //catering company status

@property (weak, nonatomic) IBOutlet UISwitch *otherServicesSwitch;
@property (nonatomic) BOOL otherServicesSelected; //other services status

- (IBAction)submitForm:(id)sender;

//PASSED VALUEs FROM PREVIOUS CONTROLLER
@property (nonatomic)  NSString *firstName;                     //view controller 1
@property (nonatomic)  NSString *middleName;
@property (nonatomic)  NSString *lastName;
@property (nonatomic)  NSString *nickName;
@property (nonatomic)  NSString *email;
@property (nonatomic)  NSString *password;
@property (nonatomic)  NSString *cellphone;

@end
