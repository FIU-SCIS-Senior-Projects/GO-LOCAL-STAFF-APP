//
//  StaffSearchResultProfileViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 10/31/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "StaffSearchResultProfileViewController.h"

@interface StaffSearchResultProfileViewController ()

@end

@implementation StaffSearchResultProfileViewController
@synthesize talentDetail;
@synthesize talentName,talentProfession, talentDetailImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)viewDidAppear:(BOOL)animated
{
    [self updateUSerInfo];
}
#pragma mark -
-(void)updateUSerInfo
{
    
    NSLog(@"curr staff selected %@", talentDetail.debugDescription);//testing

    //name
    NSString * firstName        = [talentDetail objectForKey:@"firstName"];
    NSString * middleName       = [talentDetail objectForKey:@"middleInitial"];
    NSString * lastName         = [talentDetail objectForKey:@"lastName"];
    
    self.talentName.text = [NSString stringWithFormat:@"%@ %@ %@",firstName,middleName,lastName];
    
}//eom



#pragma mark -

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
