//
//  StaffRegistration4ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/25/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredStaff;
@interface StaffRegistration4ViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate>


@property (weak, nonatomic) IBOutlet UITextView *djDescription;
@property (weak, nonatomic) IBOutlet UITextField *djWebsite;
@property (weak, nonatomic) IBOutlet UITextView *djSocialMedia;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UITextField *costOfServiceTextField;


- (IBAction)textFieldValuesChanged:(UITextField *)sender;

- (IBAction)submitForm:(id)sender;

@property (strong, nonatomic) RegisteredStaff *registeredStaff;


@end
