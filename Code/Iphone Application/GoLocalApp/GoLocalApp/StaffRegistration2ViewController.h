//
//  StaffRegistration2ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredStaff;

@interface StaffRegistration2ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *zipcode;

//picker1
@property (weak, nonatomic) IBOutlet UITextField *state;

//picker2
@property (weak, nonatomic) IBOutlet UITextField *nativeLanguage;
@property (weak, nonatomic) IBOutlet UITextField *secondLanguage;
@property (weak, nonatomic) IBOutlet UITextField *thirdLanguage;
@property (nonatomic, strong) NSString * nativeSelected; //native language selected
@property (nonatomic, strong) NSString * secondSelected; //second language selected
@property (nonatomic, strong) NSString * thirdSelected; //third language selected


@property (weak, nonatomic) IBOutlet UIButton *maleButton;
@property (weak, nonatomic) IBOutlet UIButton *femaleButton;

- (IBAction)genderValueChanged:(UIButton *)sender;
- (IBAction)textFieldValuesChanged:(UITextField *)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)submitForm:(id)sender;



@property (strong, nonatomic) RegisteredStaff *registeredStaff;

@end


