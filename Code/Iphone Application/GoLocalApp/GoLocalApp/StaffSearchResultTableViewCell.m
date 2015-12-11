//
//  StaffSearchResultTableViewCell.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 10/31/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "StaffSearchResultTableViewCell.h"

@implementation StaffSearchResultTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)favoriteButton:(UIButton *)sender
{
    if( sender.selected == YES )
    {
        [sender setImage:[UIImage imageNamed:@"heart_off"] forState:UIControlStateSelected];
        [sender setSelected:NO];
    }
    else if( sender.selected == NO )
    {
        [sender setImage:[UIImage imageNamed:@"heart_on"] forState:UIControlStateSelected];
        
        [sender setSelected:YES];
    }
}

@end
