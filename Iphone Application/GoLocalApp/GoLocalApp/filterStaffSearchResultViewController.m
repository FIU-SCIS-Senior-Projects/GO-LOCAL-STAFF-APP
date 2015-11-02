//
//  filterStaffSearchResultViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 11/1/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "filterStaffSearchResultViewController.h"
#import "StaffSearchResultTableViewController.h"

@interface filterStaffSearchResultViewController ()

@end

@implementation filterStaffSearchResultViewController

@synthesize listOptions;
@synthesize totalStaff;


#pragma mark -
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}//eo-view

-(void)viewDidAppear:(BOOL)animated
{
    [self receivePassData];
}//eo-view

#pragma mark - receive pass data
-(void)receivePassData
{
    NSLog(@"%@", listOptions);
    
    self.totalStaff.text = [NSString stringWithFormat: @"%lu Total Staffs", (unsigned long)listOptions.count];
    
    
}//eom

#pragma mark - prepare and go to next controller
- (IBAction)showResults:(UIButton *)sender
{
    bool result = [self prepareSearchCriteria];
    if(result)
    {
        [self performSegueWithIdentifier:@"GoTostaffSearchResults" sender:self];
    }
}//eo-action

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"GoTostaffSearchResults"])
    {
        StaffSearchResultTableViewController *controller = (StaffSearchResultTableViewController *)segue.destinationViewController;
        
        controller.listOptions = listOptions;
    }
}//eom


#pragma mark - prepare search criterias
/*  */
-(bool)prepareSearchCriteria
{

    return TRUE;
}//eom


#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
