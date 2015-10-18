//
//  EmployerHomeViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/1/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "EmployerHomeViewController.h"
#import "SearchTalentViewController.h"
#import "ColorWheel.h"

@interface EmployerHomeViewController ()

@end

@implementation EmployerHomeViewController
@synthesize username;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self updateBackgroundRandomColor];
}


- (void)viewDidAppear:(BOOL)animated
{
    
    NSLog(@"Username %@", username);
}


/* updates background with a random color */
-(void)updateBackgroundRandomColor
{
    ColorWheel * color = [[ColorWheel alloc]init];
    self.view.backgroundColor = [color randomColor];
}//eom



/* search talent requested, moving to talent request view */
- (IBAction)searchTalent:(id)sender
{
    SearchTalentViewController * SearchTalentView = [[SearchTalentViewController alloc] init];
    
    //hiding the nav bar of the next view
//    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    //pushing controller to navigation controller
    [self.navigationController pushViewController:SearchTalentView animated:YES];

}//eo-action




- (void)didReceiveMemoryWarning
{
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
