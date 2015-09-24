//
//  StaffRegistration5ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredStaff;

@interface StaffRegistration6ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *cateringCompanyDescription;
@property (weak, nonatomic) IBOutlet UITextField *cateringCompanyWebsite;
@property (weak, nonatomic) IBOutlet UITextView *cateringCompanySocialMedia;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UITextField *costOfServiceTextField;


- (IBAction)textFieldValuesChanged:(UITextField *)sender;

- (IBAction)submitForm:(id)sender;


@property (strong, nonatomic) RegisteredStaff *registeredStaff;

@end
