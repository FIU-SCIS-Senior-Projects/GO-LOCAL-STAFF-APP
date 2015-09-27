//
//  EmployerRegistrationViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/1/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredEmployer; //need this for the model class

@interface EmployerRegistration1ViewController : UIViewController


@property (strong, nonatomic) RegisteredEmployer *registeredEmployer;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)submit:(id)sender;

@end
