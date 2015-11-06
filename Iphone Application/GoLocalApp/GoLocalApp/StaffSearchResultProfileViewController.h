//
//  StaffSearchResultProfileViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 10/31/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffSearchResultProfileViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) NSDictionary *staffDetail;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIImageView *talentDetailImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *middleInitialLabel;

@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@property (weak, nonatomic) IBOutlet UILabel *genderLabel;

@property (weak, nonatomic) IBOutlet UILabel *languagesLabel;

@property (weak, nonatomic) IBOutlet UILabel *ethnicityLabel;

@property (weak, nonatomic) IBOutlet UILabel *weightLabel;

@property (weak, nonatomic) IBOutlet UILabel *heightLabel;

@property (weak, nonatomic) IBOutlet UILabel *eyeColorLabel;

@property (weak, nonatomic) IBOutlet UILabel *hairColorLabel;

@end
