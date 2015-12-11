//
//  StaffRegistrationViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/1/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration0ViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *middleName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *nickName;
@property (weak, nonatomic) IBOutlet UITextField *username;

@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *confirmEmail;     /*DO NOT SAVE TO DB*/

@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword; /*DO NOT SAVE TO DB*/

@property (weak, nonatomic) IBOutlet UITextField *dateOfBirth;
@property (nonatomic)  NSString * dateOfBirthSelected; //saved value of date of birth

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)submit:(id)sender;

- (IBAction)textFieldValuesChanged:(UITextField *)sender;


@end
