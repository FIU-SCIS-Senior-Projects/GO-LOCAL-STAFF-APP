//
//  SearchTalentHolderViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 12/3/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "SearchTalentHolderViewController.h"
#import "SearchTalentViewController.h"

@interface SearchTalentHolderViewController ()
{
    SearchTalentViewController * searchTalentController;
}
@end

@implementation SearchTalentHolderViewController

@synthesize searchView;


//MARK: View Loading
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"inside SearchTalentHolderViewController");
    [self setupSearchView];
    
}//eo-v

-(void) setupSearchView
{
    searchTalentController = [[ SearchTalentViewController alloc]init];
    
    searchTalentController.view.frame = searchView.bounds;
    
    [searchView addSubview:searchTalentController.view];
    
    [self addChildViewController:searchTalentController];
    
    [searchTalentController didMoveToParentViewController:self];
    
}//eom

//MARK: Memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}


@end
