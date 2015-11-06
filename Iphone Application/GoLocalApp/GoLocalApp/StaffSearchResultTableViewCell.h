//
//  StaffSearchResultTableViewCell.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 10/31/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffSearchResultTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *gender;

@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

- (IBAction)favoriteButton:(UIButton *)sender;

@end
