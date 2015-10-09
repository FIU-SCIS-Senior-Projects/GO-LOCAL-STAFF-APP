//
//  EmployerRegistrationViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/1/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "EmployerRegistration1ViewController.h"
#import "EmployerRegistration2ViewController.h"//need this for the prepare for segue!!

#import "RegisteredEmployer.h"//needed this to use the registration model

@interface EmployerRegistration1ViewController ()
{

}

@end

@implementation EmployerRegistration1ViewController

@synthesize scrollView, registeredEmployer, submitButton, verificationCodeMessage, verificationCodeLabel, verificationCodeAsterisk, cellphoneField, verificationCodeField, verificationCodeButton;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    //waitingOnVerificationResponce = FALSE;
    
    //    [registeredStaff printUserData];//testing
    
    [self setUpTapGesture];
    
}//eom

-(void)setUpTapGesture
{
    //to dismiss keyboard when a tap is done outside the textfield
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.view addGestureRecognizer:tap];
    
}//eom

/* dimisses keyboard upon touching background */
- (void)dismissKeyboard:(UITapGestureRecognizer *)recognizer
{
    [self.view endEditing:YES];
}

- (IBAction)verifyNumber:(id)sender
{
    NSString *phoneNumber = cellphoneField.text;
    [registeredEmployer setPhoneNumber:phoneNumber];
    
    [verificationCodeMessage setHidden:NO];
    [verificationCodeAsterisk setHidden:NO];
    [verificationCodeField setHidden:NO];
    [submitButton setHidden:NO];
    [verificationCodeButton setHidden:NO];
}

- (IBAction)verifyCode:(id)sender {
}

-(IBAction)submit:(id)sender
{
    NSLog(@"%@", registeredEmployer.getPhoneNumber);
    //moving to the next controller
    [self performSegueWithIdentifier:@"goToEmployerRegister2" sender:self];
}

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"goToEmployerRegister2"]){
        EmployerRegistration2ViewController *controller = (EmployerRegistration2ViewController *)segue.destinationViewController;
        
        controller.registeredEmployer = registeredEmployer;
    }
}//eom


@end
