//
//  SearchTalentViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 10/17/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTalentViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate, UIAlertViewDelegate>

//TEXTFIELDS
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *cellphoneTextField;

//BUTTONS
@property (weak, nonatomic) IBOutlet UIButton *hasPhotoButton;
@property (weak, nonatomic) IBOutlet UIButton *hasWebsiteButton;
@property (weak, nonatomic) IBOutlet UIButton *hasTattoosButton;
@property (weak, nonatomic) IBOutlet UIButton *hasPiercingsButton;

//PICKERS
@property (weak, nonatomic) IBOutlet UITextField *genderTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightConditionTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UITextField *heightConditionTextField;
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
@property (weak, nonatomic) IBOutlet UITextField *hairColorTextField;
@property (weak, nonatomic) IBOutlet UITextField *eyeColorTextField;

- (IBAction)buttonsValueChanged:(UIButton *)sender;


//Ethnicities
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *ethnicitiesButtons;

- (IBAction)ethnicityButtonValuesChanged:(UIButton *)sender;


//Talent
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *TalentButtons;
- (IBAction)talentButtonValuesChanged:(UIButton *)sender;







@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end
