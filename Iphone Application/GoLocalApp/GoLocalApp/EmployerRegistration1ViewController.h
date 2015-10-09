//
//  EmployerRegistrationViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/1/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredEmployer; //need this for the model class

@interface EmployerRegistration1ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>


@property (strong, nonatomic) RegisteredEmployer *registeredEmployer;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@property (weak, nonatomic) IBOutlet UILabel *verificationCodeMessage;
@property (weak, nonatomic) IBOutlet UILabel *verificationCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *verificationCodeAsterisk;

@property (weak, nonatomic) IBOutlet UITextField *cellphoneField;
@property (weak, nonatomic) IBOutlet UITextField *verificationCodeField;
@property (weak, nonatomic) IBOutlet UIButton *verificationCodeButton;

- (IBAction)submit:(id)sender;
- (IBAction)verifyNumber:(id)sender;
- (IBAction)verifyCode:(id)sender;

@end
