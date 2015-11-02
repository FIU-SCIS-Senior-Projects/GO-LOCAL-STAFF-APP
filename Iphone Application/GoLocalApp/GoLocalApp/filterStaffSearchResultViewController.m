//
//  filterStaffSearchResultViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 11/1/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "filterStaffSearchResultViewController.h"

@interface filterStaffSearchResultViewController ()

@end

@implementation filterStaffSearchResultViewController

@synthesize listOptions;



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}//eo-view

-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"%@", listOptions);
    
}//eo-view

#pragma mark -


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
