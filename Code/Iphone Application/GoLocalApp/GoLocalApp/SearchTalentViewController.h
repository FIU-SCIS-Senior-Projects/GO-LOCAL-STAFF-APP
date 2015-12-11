//
//  SearchTalentViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 10/17/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTalentViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate>

//ACTIVITY INDICATOR
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


//BUTTONS
@property (weak, nonatomic) IBOutlet UIButton *hasPhotoButton;
@property (weak, nonatomic) IBOutlet UIButton *hasWebsiteButton;
@property (weak, nonatomic) IBOutlet UIButton *hasTattoosButton;
@property (weak, nonatomic) IBOutlet UIButton *hasPiercingsButton;

//PICKERS
@property (weak, nonatomic) IBOutlet UITextField *genderTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageFromTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageToTextField;
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
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *talentButtons;
- (IBAction)talentButtonValuesChanged:(UIButton *)sender;

//Languages
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *languagesButtons;
- (IBAction)languagesButtonsValueChanged:(UIButton *)sender;

//miles
@property (weak, nonatomic) IBOutlet UITextField *milesTextField;
@property (weak, nonatomic) IBOutlet UITextField *milesZipcodeTextField;

//travel
@property (weak, nonatomic) IBOutlet UIButton *willingToTravelButton;
- (IBAction)willingToTravelValueChanged:(UIButton *)sender;


@property (weak, nonatomic) IBOutlet UIButton *searchTalentButton;
- (IBAction)searchTalentRequested:(UIButton *)sender;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end
