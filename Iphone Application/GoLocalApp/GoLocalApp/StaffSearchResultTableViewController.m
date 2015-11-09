//
//  StaffSearchResultTableViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 10/31/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "StaffSearchResultTableViewController.h"
#import "StaffSearchResultTableViewCell.h"
#import "StaffSearchResultProfileViewController.h"

@interface StaffSearchResultTableViewController ()

@end

@implementation StaffSearchResultTableViewController

@synthesize listOptions, profileImages;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    profileImages = [[NSMutableArray alloc] init];
    
    for( int i = 0; i < listOptions.count; i++ )
    {
        NSDictionary *temp = listOptions[i];
        
        NSString *imageName = [temp objectForKey:@"imageName"];
        
        //NSLog(@"Getting image for: %@", imageName);
        
        [profileImages addObject:[self getImage:imageName]];
        
        //profileImages[i] = [self getImage:imageName];
        
        //profileImages[i] = [self getImage:[temp objectForKey:@"imageName"]];
    }
    
//    NSLog(@"Size of the array: %lu", (unsigned long)profileImages.count);
    
    
}//eo-view


-(void)viewDidAppear:(BOOL)animated
{

}//eo-view



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}//eom

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return listOptions.count;
}//eom


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StaffSearchResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchTalentResult" forIndexPath:indexPath];
    
    //curr row
    int row = (int)indexPath.row;
    
    //name
    NSDictionary * currPerson   = listOptions[row];
    NSString * firstName        = [currPerson objectForKey:@"firstName"];
    NSString * middleInitial    = [currPerson objectForKey:@"middleInitial"];
    NSString * lastName         = [currPerson objectForKey:@"lastName"];
    NSString * age              = [currPerson objectForKey:@"age"];
    
    NSString * name             = [firstName stringByAppendingString:@" "];
    name             = [name stringByAppendingString:middleInitial];
    
    cell.nameLabel.text = name;
    cell.lastNameLabel.text = lastName;
    cell.ageLabel.text = age;
    
    NSString *gender = [currPerson objectForKey:@"gender"];
    
    if( [gender isEqualToString:@"0"] )
    {
        [cell.gender setImage:[UIImage imageNamed:@"femaleA"]];
    }
    else
    {
        [cell.gender setImage:[UIImage imageNamed:@"maleA"]];
    }
    
    [cell.image setImage:profileImages[row]];
    
    //NSString *imageName = [currPerson objectForKey:@"imageName"];
    //NSLog(@"The image name is: %@", imageName);
    
    //[self getImage:[currPerson objectForKey:@"imageName"] :cell.image];
    

    return cell;
}//eom

-(UIImage *)getImage: (NSString *)imageName
{
    NSString * serverPhotoAddress = @"http://192.241.186.107/Website/uploads/";
    
    serverPhotoAddress = [serverPhotoAddress stringByAppendingString:imageName];
    
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:serverPhotoAddress]]];
    
    //NSLog(@"Description: %@", img.description);
    
    return img;
    
//    [image setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:serverPhotoAddress]]]];
    
}//eom

-(void)getImage: (NSString *)imageName : (UIImageView *)image
{
    NSString * serverPhotoAddress = @"http://192.241.186.107/Website/uploads/";
    
    serverPhotoAddress = [serverPhotoAddress stringByAppendingString:imageName];
    
    [image setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:serverPhotoAddress]]]];
    
}//eom


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if( [[segue identifier] isEqualToString:@"showStaffSearchProfile"]  )
    {
        StaffSearchResultProfileViewController * detailView = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        //curr row
        int row = (int)myIndexPath.row;
        
        //current staff
        NSDictionary * currPerson   = listOptions[row];
        
        //NSLog(@"NAME: %@", [currPerson objectForKey:@"name"]);
        
        //passing all the information about the current staff selected
        detailView.staffDetail = currPerson;
    }
}//eom

#pragma mark - 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}//eom

@end
