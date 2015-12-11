//
//  StaffRegistration16ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/8/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredStaff;

@interface StaffRegistration14ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *termsAndAgreements;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISwitch *agreeTermsSwitch;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) RegisteredStaff *registeredStaff;

- (IBAction)agreeTermsValueChanged:(id)sender;

- (IBAction)termsAgreed:(UIButton *)sender;

@end
