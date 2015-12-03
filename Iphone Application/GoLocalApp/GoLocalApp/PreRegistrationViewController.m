//
//  PreRegistrationViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/1/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "PreRegistrationViewController.h"
#import "EmployerRegistration0ViewController.h"
#import "StaffRegistration0ViewController.h"

@interface PreRegistrationViewController ()

@end

@implementation PreRegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}//eom

- (IBAction)goToEmployerRegistration:(id)sender
{
    UIStoryboard * newSB = [UIStoryboard storyboardWithName:@"EmployerRegistration" bundle:nil];
    
    EmployerRegistration0ViewController * newController = [newSB instantiateViewControllerWithIdentifier:@"employerRegistration"];
    
    [self.navigationController pushViewController:newController animated:true];
}//eoa


- (IBAction)goToTalentRegistration:(id)sender
{
    UIStoryboard * newSB = [UIStoryboard storyboardWithName:@"StaffRegistration" bundle:nil];
    
    StaffRegistration0ViewController * newController = [newSB instantiateViewControllerWithIdentifier:@"staffRegistration"];
    
    [self.navigationController pushViewController:newController animated:true];
    
}//eoa


@end
