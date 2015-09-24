//
//  StaffRegistration4ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredStaff;

@interface StaffRegistration5ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *liveBandDescription;
@property (weak, nonatomic) IBOutlet UITextField *liveBandWebsite;
@property (weak, nonatomic) IBOutlet UITextView *liveBandSocialMedia;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UITextField *costOfServiceTextField;


- (IBAction)textFieldValuesChanged:(UITextField *)sender;

- (IBAction)submitForm:(id)sender;

@property (strong, nonatomic) RegisteredStaff *registeredStaff;

@end
