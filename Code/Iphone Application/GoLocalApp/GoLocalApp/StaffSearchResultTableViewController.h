//
//  StaffSearchResultTableViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 10/31/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffSearchResultTableViewController : UITableViewController<UITextFieldDelegate>

@property (nonatomic) NSMutableArray * listOptions;
@property (nonatomic) NSMutableArray *profileImages;

@property (nonatomic) NSString * sortBy;
@property (nonatomic) NSString * orderBy;


- (IBAction)goToMapMode:(UIBarButtonItem *)sender;

//Filter Options
@property (weak, nonatomic) IBOutlet UITextField *sortByTextFields;
@property (weak, nonatomic) IBOutlet UITextField *orderByTextFields;







@end
