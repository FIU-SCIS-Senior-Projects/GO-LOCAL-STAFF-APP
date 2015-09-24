//
//  StaffRegistration7ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredStaff;

@interface StaffRegistration8ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UISwitch *validDriverLicenseSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *validCommercialDriverLicenseSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *hasTattoosSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *hasPiercingsSwitch;

@property (weak, nonatomic) IBOutlet UITextField *ethnicityTextField;
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UITextField *hairColorTextField;
@property (weak, nonatomic) IBOutlet UITextField *eyeColorTextField;
@property (weak, nonatomic) IBOutlet UITextField *pantSizeTextField;
@property (weak, nonatomic) IBOutlet UITextField *shoeSizeTextField;
@property (weak, nonatomic) IBOutlet UITextField *tshirtSizeTextField;



@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)submitForm:(id)sender;

- (IBAction)textFieldValueChanged:(id)sender;


@property (strong, nonatomic) RegisteredStaff *registeredStaff;

@end
