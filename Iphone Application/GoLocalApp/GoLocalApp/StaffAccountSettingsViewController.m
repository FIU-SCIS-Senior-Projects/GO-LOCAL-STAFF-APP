//
//  StaffAccountSettingsViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 10/20/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "StaffAccountSettingsViewController.h"
#import "LogInViewController.h"

@interface StaffAccountSettingsViewController ()

@end

@implementation StaffAccountSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

 #pragma mark - Signed Out
- (IBAction)signOut:(UIButton *)sender
{
    [self changeViewControllerToLoginViewController];
    
}//eo-action

- (IBAction)switchToEmployerAccount:(id)sender
{
    UIStoryboard * newSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //instantiate view controller
    UIViewController *toggleAccountViewController = [newSB instantiateViewControllerWithIdentifier:@"toggleAccount"];
    
    [self.navigationController pushViewController:toggleAccountViewController animated:true];
    
}//eo-a

/* leaves the current navigation view controller and goes to the main login in view */
-(void)changeViewControllerToLoginViewController
{
    
    UIStoryboard * newSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //instantiate view controller
    UIViewController *loginViewController = [newSB instantiateViewControllerWithIdentifier:@"LogInViewController"];
    
    //updating transition
    [loginViewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    //performing change
    [self presentViewController:loginViewController animated:YES completion:nil];
    
}//eom


 #pragma mark - Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }

@end
