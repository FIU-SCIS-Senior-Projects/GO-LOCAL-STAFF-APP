//
//  StaffRegistration9ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/16/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration10ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UISwitch *hasProfessionalInsuranceSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *incorporatedSwitch;

@property (weak, nonatomic) IBOutlet UITextField *ssnTextField;
@property (weak, nonatomic) IBOutlet UITextField *businessNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *einTextField;
@property (weak, nonatomic) IBOutlet UITextField *desiredHourlyRateTextField;
@property (weak, nonatomic) IBOutlet UITextField *desiredWeeklyRateTextField;

@property (weak, nonatomic) IBOutlet UIButton *travel25percentButton;
@property (weak, nonatomic) IBOutlet UIButton *travel50percentButton;
@property (weak, nonatomic) IBOutlet UIButton *travel75percentButton;
@property (weak, nonatomic) IBOutlet UIButton *travel100percentButton;

- (IBAction)incorporatedValueChanged:(UISwitch *)sender;
- (IBAction)travelPercentValueChanged:(UIButton *)sender;

- (IBAction)submitForm:(id)sender;


//PASSED VALUES FROM PREVIOUS CONTROLLER
@property (nonatomic)  NSString *accountType;                   //view controller 1
@property (nonatomic)  NSString *firstName;
@property (nonatomic)  NSString *middleName;
@property (nonatomic)  NSString *lastName;
@property (nonatomic)  NSString *nickName;
@property (nonatomic)  NSString *email;
@property (nonatomic)  NSString *username;
@property (nonatomic)  NSString *password;
@property (nonatomic)  NSString *dateOfBirth;

@property (nonatomic)  NSString *cellphone;                     //view controller 2
@property (nonatomic)  NSString *completeAddress;
@property (nonatomic)  bool gender; //0-female | 1 -male
@property (nonatomic)  NSString *languages;

@property (nonatomic) NSMutableArray * staffTypeExperience;     //view controller 3

@property (nonatomic)  BOOL hasDriverLicense;                   //view controller 8
@property (nonatomic)  BOOL hasCommercialLicense;
@property (nonatomic)  BOOL hasTattos;
@property (nonatomic)  BOOL hasPiercings;
@property (nonatomic)  NSString *ethnicity;
@property (nonatomic)  NSString *height;
@property (nonatomic)  NSString *weight;
@property (nonatomic)  NSString *hairColor;
@property (nonatomic)  NSString *pantSize;
@property (nonatomic)  NSString *shoeSize;
@property (nonatomic)  NSString *tshirtSize;

@property (nonatomic)  NSString *chestSize;                     //view controller 9
@property (nonatomic)  NSString *waistSize;
@property (nonatomic)  NSString *hipsSize;
@property (nonatomic)  NSString *dressSize;



@end
