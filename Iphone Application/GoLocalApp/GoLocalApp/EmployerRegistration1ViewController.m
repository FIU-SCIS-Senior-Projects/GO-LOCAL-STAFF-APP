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

@synthesize scrollView, registeredEmployer;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    
    [registeredEmployer printUserData];//testing
    
}//eom
@end
