//
//  StaffRegistration10ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredStaff;

@interface StaffRegistration9ViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *chestSize;
@property (weak, nonatomic) IBOutlet UITextField *waistSize;
@property (weak, nonatomic) IBOutlet UITextField *hipsSize;
@property (weak, nonatomic) IBOutlet UITextField *dressSize;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)textFieldValueChanged:(id)sender;

- (IBAction)submitForm:(id)sender;


@property (strong, nonatomic) RegisteredStaff *registeredStaff;
@end
