//
//  ForgotPasswordViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/2/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPasswordViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextfield;
@property (weak, nonatomic) IBOutlet UIButton *startResetPasswordProcessButton;
- (IBAction)startResetPasswordAction:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *verificationCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *verificationCodeAsterisk;
@property (weak, nonatomic) IBOutlet UITextField *verificationCodeTextField;


@property (weak, nonatomic) IBOutlet UILabel *passwordProvidedLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordProvidedAsterisk;
@property (weak, nonatomic) IBOutlet UITextField *passwordProvidedTextField;

@property (weak, nonatomic) IBOutlet UILabel *confirmNewPasswordProvidedLabel;
@property (weak, nonatomic) IBOutlet UILabel *confirmNewPasswordProvidedAsterisk;
@property (weak, nonatomic) IBOutlet UITextField *confirmNewPasswordProvidedTextField;

@property (weak, nonatomic) IBOutlet UIButton *resetPassword;
- (IBAction)resetPasswordAction:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
