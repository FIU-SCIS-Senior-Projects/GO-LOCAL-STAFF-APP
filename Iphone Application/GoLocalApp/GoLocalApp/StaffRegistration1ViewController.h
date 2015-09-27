//
//  StaffRegistration1ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/25/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredStaff;

@interface StaffRegistration1ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *cellphone;

@property (weak, nonatomic) IBOutlet UITextField *carrier;

@property (weak, nonatomic) IBOutlet UITextField *verificationCode;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *submitPhoneNumber;
@property (weak, nonatomic) IBOutlet UIButton *verifyCodeButton;

- (IBAction)phoneNumberSubmitted:(id)sender;
- (IBAction)verifyCodeSubmitted:(id)sender;

- (IBAction)submitForm:(id)sender;


- (IBAction)textFieldValuesChanged:(UITextField *)sender;

@property (strong, nonatomic) RegisteredStaff *registeredStaff;



@end
