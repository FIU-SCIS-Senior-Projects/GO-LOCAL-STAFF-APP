//
//  StaffRegistration11ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration11ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)submitForm:(id)sender;





//PASSED VALUEs FROM PREVIOUS CONTROLLER
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


//@property (nonatomic)  NSString *djDescription;
//@property (nonatomic)  NSString *djWebsite;
//@property (nonatomic)  NSString *djSocialMedia;
//
//@property (nonatomic)  NSString *liveBandDescription;
//@property (nonatomic)  NSString *liveBandWebsite;
//@property (nonatomic)  NSString *liveBandSocialMedia;
//
//@property (nonatomic)  NSString *cateringCompanyDescription;
//@property (nonatomic)  NSString *cateringCompanyWebsite;
//@property (nonatomic)  NSString *cateringCompanySocialMedia;
//
//@property (nonatomic)  NSString *otherServicesDescription;
//@property (nonatomic)  NSString *otherServicesWebsite;
//@property (nonatomic)  NSString *otherServicesSocialMedia;


@end
