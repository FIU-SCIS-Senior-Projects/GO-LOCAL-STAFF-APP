//
//  EmployerRegistration3ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/26/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredEmployer;

@interface EmployerRegistration3ViewController : UIViewController

@property (strong, nonatomic) RegisteredEmployer *registeredEmployer;
@property (weak, nonatomic) IBOutlet UISwitch *termsSwitch;
@property (weak, nonatomic) IBOutlet UIButton *registrationButton;

- (IBAction)submit:(id)sender;

- (IBAction)agreementsToggle:(id)sender;

@end
