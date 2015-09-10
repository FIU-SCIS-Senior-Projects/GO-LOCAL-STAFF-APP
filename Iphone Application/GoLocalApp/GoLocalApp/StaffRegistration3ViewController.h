//
//  StaffRegistration3ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration3ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *djDescription;
@property (weak, nonatomic) IBOutlet UITextField *djWebsite;
@property (weak, nonatomic) IBOutlet UITextView *djSocialMedia;
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollView;

- (IBAction)submitForm:(id)sender;


//PASSED VALUEs FROM PREVIOUS CONTROLLER
@property (nonatomic)  NSString *firstName;                     //view controller 1
@property (nonatomic)  NSString *middleName;
@property (nonatomic)  NSString *lastName;
@property (nonatomic)  NSString *nickName;
@property (nonatomic)  NSString *email;
@property (nonatomic)  NSString *password;
@property (nonatomic)  NSString *cellphone;

@property (nonatomic)  NSString *address;                       //view controller 2
@property (nonatomic)  NSString *city;
@property (nonatomic)  NSString *zipcode;
@property (nonatomic)  NSString *stateSelected;

@property (nonatomic)  BOOL djSelected;
@property (nonatomic)  BOOL liveBandSelected;
@property (nonatomic)  BOOL cateringCompanySelected;
@property (nonatomic)  BOOL otherServicesSelected;


@end
