//
//  filterStaffSearchResultViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 11/1/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface filterStaffSearchResultViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic) NSMutableArray * listOptions;

@property (weak, nonatomic) IBOutlet UILabel *totalStaff;






- (IBAction)showResults:(UIButton *)sender;



@end
