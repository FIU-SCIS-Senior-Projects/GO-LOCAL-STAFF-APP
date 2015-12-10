//
//  EmployerRegistration2ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/26/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredEmployer;

@interface EmployerRegistration2ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) RegisteredEmployer *registeredEmployer;

@property (weak, nonatomic) IBOutlet UITextField *employerNameField;
@property (weak, nonatomic) IBOutlet UITextField *typeOfEmployerField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;

@property (weak, nonatomic) IBOutlet UITextField *zipCodeField;
@property (weak, nonatomic) IBOutlet UITextField *stateField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UISwitch *insuranceSwitch;

- (IBAction)submit:(id)sender;


-(IBAction)textFieldValuesChanged:(UITextField *)sender;


@end
