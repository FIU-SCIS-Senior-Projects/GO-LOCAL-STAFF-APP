//
//  StaffRegistration9ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/16/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredStaff;

@interface StaffRegistration10ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UISwitch *incorporatedSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *hasProfessionalInsuranceSwitch;

@property (weak, nonatomic) IBOutlet UITextField *ssnTextField;
@property (weak, nonatomic) IBOutlet UITextField *businessNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *einTextField;
@property (weak, nonatomic) IBOutlet UITextField *desiredHourlyRateTextField;
@property (weak, nonatomic) IBOutlet UITextField *desiredWeeklyRateTextField;

@property (weak, nonatomic) IBOutlet UIButton *travel0percentButton;
@property (weak, nonatomic) IBOutlet UIButton *travel25percentButton;
@property (weak, nonatomic) IBOutlet UIButton *travel50percentButton;
@property (weak, nonatomic) IBOutlet UIButton *travel75percentButton;
@property (weak, nonatomic) IBOutlet UIButton *travel100percentButton;

- (IBAction)incorporatedValueChanged:(UISwitch *)sender;
- (IBAction)travelPercentValueChanged:(UIButton *)sender;

- (IBAction)submitForm:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@property (strong, nonatomic) RegisteredStaff *registeredStaff;

@end
