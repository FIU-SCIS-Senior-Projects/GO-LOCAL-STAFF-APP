//
//  ToggleAccountViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/11/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToggleAccountViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)forgotPasswordRequest:(id)sender;
- (IBAction)signUpRequest:(id)sender;
- (IBAction)submitLogIn:(id)sender;
@end
