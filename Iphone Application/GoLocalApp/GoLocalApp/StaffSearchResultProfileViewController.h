//
//  StaffSearchResultProfileViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 10/31/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffSearchResultProfileViewController : UIViewController


@property (strong, nonatomic) NSDictionary *talentDetail;

@property (weak, nonatomic) IBOutlet UIImageView *talentDetailImageView;
@property (weak, nonatomic) IBOutlet UILabel *talentName;
@property (weak, nonatomic) IBOutlet UILabel *talentProfession;


@property (weak, nonatomic) IBOutlet UILabel *talentInfo1;
@property (weak, nonatomic) IBOutlet UILabel *talentInfo2;
@property (weak, nonatomic) IBOutlet UILabel *talentInfo3;
@property (weak, nonatomic) IBOutlet UILabel *talentInfo4;





@end
