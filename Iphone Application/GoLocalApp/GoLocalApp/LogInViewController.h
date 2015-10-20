//
//  ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/1/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController<UIAlertViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *username;

@property (weak, nonatomic) IBOutlet UITextField *password;


- (IBAction)submitLogIn:(id)sender;

//- (IBAction)unwoundStaff:(UIStoryboardSegue *)segue ;

@end

