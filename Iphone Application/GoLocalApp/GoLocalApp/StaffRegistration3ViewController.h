//
//  StaffRegistration3ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/16/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration3ViewController : UIViewController

@property (nonatomic)  BOOL djSelected;
@property (nonatomic)  BOOL liveBandSelected;
@property (nonatomic)  BOOL cateringCompanySelected;
@property (nonatomic)  BOOL otherServicesSelected;             

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)submitForm:(id)sender;

//PASSED VALUEs FROM PREVIOUS CONTROLLER
@property (nonatomic)  NSString *accountType;                     //view controller 1
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



@end
