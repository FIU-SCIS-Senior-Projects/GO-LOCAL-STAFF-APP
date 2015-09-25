//
//  StaffRegistration1ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/25/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredStaff;

@interface StaffRegistration1ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *cellphone;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)submitForm:(id)sender;


- (IBAction)textFieldValuesChanged:(UITextField *)sender;

@property (strong, nonatomic) RegisteredStaff *registeredStaff;



@end
