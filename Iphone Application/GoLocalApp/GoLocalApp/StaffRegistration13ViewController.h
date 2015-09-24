//
//  StaffRegistration14ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/8/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredStaff;

@interface StaffRegistration13ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UISwitch *wantsDirectDeposit;

@property (weak, nonatomic) IBOutlet UITextField *DirectDepositRoutingNumber;

@property (weak, nonatomic) IBOutlet UITextField *DirectDepositAccountNumber;


- (IBAction)directDepositSelectionChanged:(id)sender;

- (IBAction)submitForm:(id)sender;


@property (strong, nonatomic) RegisteredStaff *registeredStaff;

@end
