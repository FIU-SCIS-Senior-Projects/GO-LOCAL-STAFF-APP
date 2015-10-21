//
//  EmployerAccountSettingsViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 10/20/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "EmployerAccountSettingsViewController.h"
#import "LogInViewController.h"

@interface EmployerAccountSettingsViewController ()

@end

@implementation EmployerAccountSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


 #pragma mark - Signed Out

/*  signs out the current user */
- (IBAction)signOut:(UIButton *)sender
{
    [self changeViewControllerToLoginViewController];
}//eo-action


/* leaves the current navigation view controller and goes to the main login in view */
-(void)changeViewControllerToLoginViewController
{
    //instantiate view controller
    UIViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LogInViewController"];
    
    //updating transition
    [loginViewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    //performing change
    [self presentViewController:loginViewController animated:YES completion:nil];

}//eom

 #pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
