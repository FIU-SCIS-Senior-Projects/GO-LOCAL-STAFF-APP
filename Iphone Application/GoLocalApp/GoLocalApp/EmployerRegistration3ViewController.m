//
//  EmployerRegistration3ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/26/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "EmployerRegistration3ViewController.h"

@interface EmployerRegistration3ViewController ()

@end

@implementation EmployerRegistration3ViewController

@synthesize registeredEmployer, termsSwitch, registrationButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)agreementsToggle:(id)sender
{
    if( termsSwitch.on )
        [registrationButton setHidden:NO];
}

-(IBAction)submit:(id)sender
{
    
}

@end
