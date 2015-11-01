//
//  SearchTalentViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 10/17/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "SearchTalentViewController.h"
#import "ColorWheel.h"
#import "StaffSearchResultTableViewController.h"

@interface SearchTalentViewController ()
{
    //arrays
    NSArray *genderOptions;
    NSArray *ageFromOptions;
    NSArray *ageToOptions;
    NSArray *hairColorOptions;
    NSArray *eyeColorOptions;
    NSArray *heightFeetOptions;
    NSArray *heightInchesOptions;
    NSArray *conditionsOptions;
    NSArray *milesOptions;
    
    NSArray *hasButtonOptions;
    NSMutableArray *hasButtonCurrentStatus;
    
    NSArray * ethnicities;
    NSMutableArray *ethnicitiesSelected;
    
    NSArray * talents;
    NSMutableArray *talentsSelected;
    
    NSArray * languages;
    NSMutableArray *languagesSelected;
    
    NSArray * willingToTravelOptions;
    NSMutableArray *willingToTravelStatus;
    
    //pickers
    UIPickerView * genderPickerView;
    UIPickerView * ageFromPickerView;
    UIPickerView * ageToPickerView;
    UIPickerView * hairColorPickerView;
    UIPickerView * eyeColorPickerView;
    UIPickerView * heightPickerView;
    UIPickerView * weightConditionsPickerView;
    UIPickerView * heightConditionsPickerView;
    UIPickerView * milesPickerView;
    
    //
    NSString * heightFeet;
    NSString * heightInches;
}


@end

@implementation SearchTalentViewController

@synthesize nameTextField,emailTextField,cellphoneTextField;
@synthesize hasPhotoButton, hasPiercingsButton, hasTattoosButton, hasWebsiteButton;
@synthesize genderTextField,ageFromTextField,ageToTextField,weightConditionTextField,weightTextField,heightConditionTextField,heightTextField,hairColorTextField,eyeColorTextField;
@synthesize ethnicitiesButtons;
@synthesize talentButtons;
@synthesize languagesButtons;
@synthesize milesTextField,milesZipcodeTextField;
@synthesize willingToTravelButton;

@synthesize scrollView;




- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateBackgroundRandomColor];
    [self setUpTapGesture];
    [self setUpAllPickers];
    [self setUpHasButtonOptionsAndInitialStatus];
    [self setUpEthnicityButtons];
    [self setUpTalentButtons];
    [self setUpLanguagesButtons];
    [self setUpWillingToTravelButton];
}//EOM

-(void)viewDidAppear:(BOOL)animated
{
    
//    NSDictionary * testing = [[NSDictionary alloc] init];
//    [testing setValue:@"" forKey:@"0"];
//    
//    [self goToSearchResults:testing];
    
}//eom

#pragma mark - buttons functions (hasPhoto, HasWebsite, hasTattoos, hasPiercings)

/* 
 handles the following buttons:
    -   hasPhotoButton      [tag#1]
    -   hasWebsiteButton    [tag#2]
    -   hasTattoosButton    [tag#3]
    -   hasPiercingsButton  [tag#4]
 */
- (IBAction)buttonsValueChanged:(UIButton *)sender
{
    int buttonID = (int)sender.tag;
    
    //valid options
    if( (buttonID > 0 ) && (buttonID < 5) )
    {
        //geting current status
        int currentID           = buttonID -1;
        NSString *currentStatus = [hasButtonCurrentStatus objectAtIndex:currentID];
        int currentStatusInt    = [currentStatus intValue];
        
        //update new status
        currentStatusInt++;
        int newStatus = currentStatusInt;
        if(newStatus > 2)
        {
            newStatus = 0;
        }
        
        //get the new status text representation
        NSString * newTextStatus = [hasButtonOptions objectAtIndex:newStatus];
        
        //update button reflecting the new status
        if(newStatus == 0)//EITHER
        {
            [sender setTitle:newTextStatus forState:UIControlStateNormal];
//            sender.layer.borderColor = [UIColor blackColor].CGColor;
            [sender setBackgroundColor: [UIColor clearColor] ];
        }
        else if(newStatus == 1)//YES
        {
            [sender setTitle:newTextStatus forState:UIControlStateNormal];
//            sender.layer.borderColor = [UIColor greenColor].CGColor;
            [sender setBackgroundColor: [UIColor greenColor] ];
        }
        else if(newStatus == 2)//NO
        {
            [sender setTitle:newTextStatus forState:UIControlStateNormal];
//            sender.layer.borderColor = [UIColor redColor].CGColor;
            [sender setBackgroundColor: [UIColor redColor] ];
        }
        
        //save the new status for future changes
        NSString * newStatusAsString = [NSString stringWithFormat:@"%d",newStatus];
        [hasButtonCurrentStatus replaceObjectAtIndex:currentID withObject:newStatusAsString];
        
    }//eo-valid options
    
}//eo-action

/* updates the inital status of buttons and their options */
-(void) setUpHasButtonOptionsAndInitialStatus
{
    hasButtonOptions = [[NSArray alloc]initWithObjects:
                        @"Either",
                        @"Yes",
                        @"No",
                        nil];
    
    hasButtonCurrentStatus = [[NSMutableArray alloc] initWithObjects:@"0", @"0", @"0", @"0", nil];
    
    //updating buttons initial status
    
    hasPhotoButton.layer.borderColor = [UIColor blackColor].CGColor;
    hasPhotoButton.layer.borderWidth = 4.5f;
    hasPhotoButton.layer.cornerRadius = 10.0f;

    hasWebsiteButton.layer.borderColor = [UIColor blackColor].CGColor;
    hasWebsiteButton.layer.borderWidth = 4.5f;
    hasWebsiteButton.layer.cornerRadius = 10.0f;

    hasTattoosButton.layer.borderColor = [UIColor blackColor].CGColor;
    hasTattoosButton.layer.borderWidth = 4.5f;
    hasTattoosButton.layer.cornerRadius = 10.0f;

    hasPiercingsButton.layer.borderColor = [UIColor blackColor].CGColor;
    hasPiercingsButton.layer.borderWidth = 4.5f;
    hasPiercingsButton.layer.cornerRadius = 10.0f;

}//eom

#pragma mark - textfield functions
    /* uitextfield is about to be edit*/
    - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
    {
        [self scrollViewAdaptToStartEditingTextField:textField];
        return YES;
    }

    /* dimisses UITextField as soon the return key is pressed */
    -(BOOL)textFieldShouldReturn:(UITextField *)textField {
        
        if(textField == self.nameTextField){
            [self.nameTextField resignFirstResponder];
            [self.emailTextField becomeFirstResponder];
        }
        else if(textField == self.emailTextField)
        {
            [self.emailTextField resignFirstResponder];
            [self.cellphoneTextField becomeFirstResponder];
        }
        else if(textField == self.cellphoneTextField){
            [self.cellphoneTextField resignFirstResponder];
        }
        
        return YES;
    }//eom


#pragma mark - picker functions (gender, age, weight, height, hair & eye color, miles)
    -(void)setUpAllPickers
    {
        //gender
        [self setUpGender];
        genderOptions = [[NSArray alloc]
                         initWithObjects:@"Any",
                                         @"Male",
                                         @"Female",
                                         nil];

        //age
        [self setUpAgeFrom];
        ageFromOptions = [[NSArray alloc] initWithObjects:
                          @"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",
                          @"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",
                          @"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45+",
                         nil];
        
        [self setUpAgeTo];
        ageToOptions = [[NSArray alloc] initWithObjects:
                      @"Any",
                      @"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",
                      @"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",
                      @"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45+",
                      nil];


        //hair color
        [self setUpHairColor];
        hairColorOptions = [[NSArray alloc]
                            initWithObjects:
                            @"Any",
                            @"Auburn",
                            @"Black",
                            @"Blonde",
                            @"Brown",
                            @"Grey",
                            @"Red",
                            @"White",
                            @"Other",
                            nil];

        
        //Eye Color
        [self setUpEyeColor];
        eyeColorOptions = [[NSArray alloc]
                           initWithObjects:
                           @"Any",
                           @"Amber",
                           @"Blue",
                           @"Brown",
                           @"Gray",
                           @"Green",
                           @"Hazel",
                           @"Other",
                           nil];
        
        //Height
        [self setUpHeight];
        heightFeetOptions = [[NSArray alloc]initWithObjects:@"",
                             @"2'",
                             @"3'",
                             @"4'",
                             @"5'",
                             @"6'",
                             @"7'",
                             nil];
        
        heightInchesOptions = [[NSArray alloc]initWithObjects:@"",
                               @"0\"",
                               @"1\"",
                               @"2\"",
                               @"3\"",
                               @"4\"",
                               @"5\"",
                               @"6\"",
                               @"7\"",
                               @"8\"",
                               @"9\"",
                               nil];
        
        //weight and height conditions
        [self setUpWeightConditions];
        [self setUpHeightConditions];
        conditionsOptions = [[NSArray alloc]initWithObjects:@"",
                             @"at most",
                             @"equal",
                             @"atleast",
                             @"any",
                             nil];
        
        //miles
        [self setUpMiles];
        milesOptions = [[NSArray alloc]initWithObjects:@"",
                        @"5",
                        @"10",
                        @"15",
                        @"25",
                        @"50",
                        @"100+",
                        nil];
    }//eom

    /*sets up the gender textfield with picker */
    -(void)setUpGender
    {
        // create a UIPicker view as a custom keyboard view
        genderPickerView = [[UIPickerView alloc] init];
        [genderPickerView sizeToFit];
        genderPickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        genderPickerView.delegate = self;
        genderPickerView.dataSource = self;
        genderPickerView.showsSelectionIndicator = YES;
        
        //updating keyboard as uipicker
        self.genderTextField.inputView = genderPickerView;
        
        // creating toolbar for 'Cancel' and 'Done' actions
        UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
        keyboardDoneButtonView.barStyle = UIBarStyleBlack;
        keyboardDoneButtonView.translucent = YES;
        keyboardDoneButtonView.tintColor = nil;
        [keyboardDoneButtonView sizeToFit];
        
        //creating empty UIBarItem to force first item to the right
        UIBarButtonItem* empty1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                         style:UIBarButtonItemStyleBordered
                                                                        target:self
                                                                        action:@selector(cancelClicked:)];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                       style:UIBarButtonItemStyleBordered target:self
                                                                      action:@selector(doneClicked:)] ;
        //adding UIBarItems to the Keyboard/Picker
        [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty1, cancelButton, doneButton, nil]];
        
        
        // Plug the keyboardDoneButtonView into the text field.
        self.genderTextField.inputAccessoryView = keyboardDoneButtonView;
    }//eom


    /*sets up the gender textfield with picker */
    -(void)setUpAgeFrom
    {
        // create a UIPicker view as a custom keyboard view
        ageFromPickerView = [[UIPickerView alloc] init];
        [ageFromPickerView sizeToFit];
        ageFromPickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        ageFromPickerView.delegate = self;
        ageFromPickerView.dataSource = self;
        ageFromPickerView.showsSelectionIndicator = YES;
        
        //updating keyboard as picker
        self.ageFromTextField.inputView = ageFromPickerView;
        
        // creating toolbar for 'Cancel' and 'Done' actions
        UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
        keyboardDoneButtonView.barStyle = UIBarStyleBlack;
        keyboardDoneButtonView.translucent = YES;
        keyboardDoneButtonView.tintColor = nil;
        [keyboardDoneButtonView sizeToFit];
        
        //creating empty UIBarItem to force first item to the right
        UIBarButtonItem* empty1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                         style:UIBarButtonItemStyleBordered
                                                                        target:self
                                                                        action:@selector(cancelClicked:)];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                       style:UIBarButtonItemStyleBordered target:self
                                                                      action:@selector(doneClicked:)] ;
        //adding UIBarItems to the Keyboard/Picker
        [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty1, cancelButton, doneButton, nil]];
        
        
        // Plug the keyboardDoneButtonView into the text field.
        self.ageFromTextField.inputAccessoryView = keyboardDoneButtonView;
    }//eom

    /*sets up the gender textfield with picker */
    -(void)setUpAgeTo
    {
        // create a UIPicker view as a custom keyboard view
        ageToPickerView = [[UIPickerView alloc] init];
        [ageToPickerView sizeToFit];
        ageToPickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        ageToPickerView.delegate = self;
        ageToPickerView.dataSource = self;
        ageToPickerView.showsSelectionIndicator = YES;
        
        //updating keyboard as picker
        self.ageToTextField.inputView = ageToPickerView;
        
        // creating toolbar for 'Cancel' and 'Done' actions
        UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
        keyboardDoneButtonView.barStyle = UIBarStyleBlack;
        keyboardDoneButtonView.translucent = YES;
        keyboardDoneButtonView.tintColor = nil;
        [keyboardDoneButtonView sizeToFit];
        
        //creating empty UIBarItem to force first item to the right
        UIBarButtonItem* empty1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                         style:UIBarButtonItemStyleBordered
                                                                        target:self
                                                                        action:@selector(cancelClicked:)];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                       style:UIBarButtonItemStyleBordered target:self
                                                                      action:@selector(doneClicked:)] ;
        //adding UIBarItems to the Keyboard/Picker
        [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty1, cancelButton, doneButton, nil]];
        
        
        // Plug the keyboardDoneButtonView into the text field.
        self.ageToTextField.inputAccessoryView = keyboardDoneButtonView;
    }//eom

    /* creates the picker for hair color selection*/
    -(void) setUpHairColor
    {
      
        // create a UIPicker view as a custom keyboard view
        hairColorPickerView = [[UIPickerView alloc] init];
        [hairColorPickerView sizeToFit];
        hairColorPickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        hairColorPickerView.delegate = self;
        hairColorPickerView.dataSource = self;
        hairColorPickerView.showsSelectionIndicator = YES;
        
        //updating k
        self.hairColorTextField.inputView = hairColorPickerView;
        
        // creating toolbar for 'Cancel' and 'Done' actions
        UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
        keyboardDoneButtonView.barStyle = UIBarStyleBlack;
        keyboardDoneButtonView.translucent = YES;
        keyboardDoneButtonView.tintColor = nil;
        [keyboardDoneButtonView sizeToFit];
        
        //creating empty UIBarItem to force first item to the right
        UIBarButtonItem* empty1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                         style:UIBarButtonItemStyleBordered
                                                                        target:self
                                                                        action:@selector(cancelClicked:)];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                       style:UIBarButtonItemStyleBordered target:self
                                                                      action:@selector(doneClicked:)] ;
        //adding UIBarItems to the Keyboard/Picker
        [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty1, cancelButton, doneButton, nil]];
        
        
        // Plug the keyboardDoneButtonView into the text field.
        self.hairColorTextField.inputAccessoryView = keyboardDoneButtonView;
        
    }//eom

    /* creates the picker for eye color selection*/
    -(void) setUpEyeColor
    {
        
        // create a UIPicker view as a custom keyboard view
        eyeColorPickerView = [[UIPickerView alloc] init];
        [eyeColorPickerView sizeToFit];
        eyeColorPickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        eyeColorPickerView.delegate = self;
        eyeColorPickerView.dataSource = self;
        eyeColorPickerView.showsSelectionIndicator = YES;
        
        //updating k
        self.eyeColorTextField.inputView = eyeColorPickerView;
        
        // creating toolbar for 'Cancel' and 'Done' actions
        UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
        keyboardDoneButtonView.barStyle = UIBarStyleBlack;
        keyboardDoneButtonView.translucent = YES;
        keyboardDoneButtonView.tintColor = nil;
        [keyboardDoneButtonView sizeToFit];
        
        //creating empty UIBarItem to force first item to the right
        UIBarButtonItem* empty1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                         style:UIBarButtonItemStyleBordered
                                                                        target:self
                                                                        action:@selector(cancelClicked:)];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                       style:UIBarButtonItemStyleBordered target:self
                                                                      action:@selector(doneClicked:)] ;
        //adding UIBarItems to the Keyboard/Picker
        [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty1, cancelButton, doneButton, nil]];
        
        
        // Plug the keyboardDoneButtonView into the text field.
        self.eyeColorTextField.inputAccessoryView = keyboardDoneButtonView;
        
    }//eom

    /* creates the picker for height selection*/
    -(void) setUpHeight
    {
        
        // create a UIPicker view as a custom keyboard view
        heightPickerView = [[UIPickerView alloc] init];
        [heightPickerView sizeToFit];
        heightPickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        heightPickerView.delegate = self;
        heightPickerView.dataSource = self;
        heightPickerView.showsSelectionIndicator = YES;
        
        //updating k
        self.heightTextField.inputView = heightPickerView;
        
        // creating toolbar for 'Cancel' and 'Done' actions
        UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
        keyboardDoneButtonView.barStyle = UIBarStyleBlack;
        keyboardDoneButtonView.translucent = YES;
        keyboardDoneButtonView.tintColor = nil;
        [keyboardDoneButtonView sizeToFit];
        
        //creating empty UIBarItem to force first item to the right
        UIBarButtonItem* empty = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                         style:UIBarButtonItemStyleBordered
                                                                        target:self
                                                                        action:@selector(cancelClicked:)];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                       style:UIBarButtonItemStyleBordered target:self
                                                                      action:@selector(doneClicked:)] ;
        //adding UIBarItems to the Keyboard/Picker
        [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty, cancelButton, doneButton, nil]];
        
        
        // Plug the keyboardDoneButtonView into the text field.
        self.heightTextField.inputAccessoryView = keyboardDoneButtonView;
        
    }//eom

    /*sets up the weight Condition TextField with picker */
    -(void)setUpWeightConditions
    {
        // create a UIPicker view as a custom keyboard view
        weightConditionsPickerView = [[UIPickerView alloc] init];
        [weightConditionsPickerView sizeToFit];
        weightConditionsPickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        weightConditionsPickerView.delegate = self;
        weightConditionsPickerView.dataSource = self;
        weightConditionsPickerView.showsSelectionIndicator = YES;
        
        //updating keyboard as uipicker
        self.weightConditionTextField.inputView = weightConditionsPickerView;
        
        // creating toolbar for 'Cancel' and 'Done' actions
        UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
        keyboardDoneButtonView.barStyle = UIBarStyleBlack;
        keyboardDoneButtonView.translucent = YES;
        keyboardDoneButtonView.tintColor = nil;
        [keyboardDoneButtonView sizeToFit];
        
        //creating empty UIBarItem to force first item to the right
        UIBarButtonItem* empty1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                         style:UIBarButtonItemStyleBordered
                                                                        target:self
                                                                        action:@selector(cancelClicked:)];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                       style:UIBarButtonItemStyleBordered target:self
                                                                      action:@selector(doneClicked:)] ;
        //adding UIBarItems to the Keyboard/Picker
        [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty1, cancelButton, doneButton, nil]];
        
        
        // Plug the keyboardDoneButtonView into the text field.
        self.weightConditionTextField.inputAccessoryView = keyboardDoneButtonView;
    }//eom

    /*sets up the height Conditions TextFieldwith picker */
    -(void)setUpHeightConditions
    {
        // create a UIPicker view as a custom keyboard view
        heightConditionsPickerView = [[UIPickerView alloc] init];
        [heightConditionsPickerView sizeToFit];
        heightConditionsPickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        heightConditionsPickerView.delegate = self;
        heightConditionsPickerView.dataSource = self;
        heightConditionsPickerView.showsSelectionIndicator = YES;
        
        //updating keyboard as uipicker
        self.heightConditionTextField.inputView = heightConditionsPickerView;
        
        // creating toolbar for 'Cancel' and 'Done' actions
        UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
        keyboardDoneButtonView.barStyle = UIBarStyleBlack;
        keyboardDoneButtonView.translucent = YES;
        keyboardDoneButtonView.tintColor = nil;
        [keyboardDoneButtonView sizeToFit];
        
        //creating empty UIBarItem to force first item to the right
        UIBarButtonItem* empty1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                         style:UIBarButtonItemStyleBordered
                                                                        target:self
                                                                        action:@selector(cancelClicked:)];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                       style:UIBarButtonItemStyleBordered target:self
                                                                      action:@selector(doneClicked:)] ;
        //adding UIBarItems to the Keyboard/Picker
        [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty1, cancelButton, doneButton, nil]];
        
        
        // Plug the keyboardDoneButtonView into the text field.
        self.heightConditionTextField.inputAccessoryView = keyboardDoneButtonView;
    }//eom

    /*sets up the gender textfield with picker */
    -(void)setUpMiles
    {
        // create a UIPicker view as a custom keyboard view
        milesPickerView = [[UIPickerView alloc] init];
        [milesPickerView sizeToFit];
        milesPickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        milesPickerView.delegate = self;
        milesPickerView.dataSource = self;
        milesPickerView.showsSelectionIndicator = YES;
        
        //updating keyboard as uipicker
        self.milesTextField.inputView = milesPickerView;
        
        // creating toolbar for 'Cancel' and 'Done' actions
        UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
        keyboardDoneButtonView.barStyle = UIBarStyleBlack;
        keyboardDoneButtonView.translucent = YES;
        keyboardDoneButtonView.tintColor = nil;
        [keyboardDoneButtonView sizeToFit];
        
        //creating empty UIBarItem to force first item to the right
        UIBarButtonItem* empty1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                         style:UIBarButtonItemStyleBordered
                                                                        target:self
                                                                        action:@selector(cancelClicked:)];
        
        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                       style:UIBarButtonItemStyleBordered target:self
                                                                      action:@selector(doneClicked:)] ;
        //adding UIBarItems to the Keyboard/Picker
        [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty1, cancelButton, doneButton, nil]];
        
        
        // Plug the keyboardDoneButtonView into the text field.
        self.milesTextField.inputAccessoryView = keyboardDoneButtonView;
    }//eom


    //process the data after the user click done on the uipicker
    //   and resign being the first reponsder
    - (void)doneClicked:(id)sender
    {
        [self.genderTextField resignFirstResponder];
        [self.ageFromTextField resignFirstResponder];
        [self.ageToTextField resignFirstResponder];
        [self.hairColorTextField resignFirstResponder];
        [self.eyeColorTextField resignFirstResponder];
        [self.heightTextField resignFirstResponder];
        [self.weightConditionTextField resignFirstResponder];
        [self.heightConditionTextField resignFirstResponder];
        [self.milesTextField resignFirstResponder];
    }//eom

    //process the date selected after the user click cancel
    //   and resign being the first reponsder
    - (void)cancelClicked:(id)sender
    {
        [self.genderTextField resignFirstResponder];
        [self.ageFromTextField resignFirstResponder];
        [self.ageToTextField resignFirstResponder];
        [self.hairColorTextField resignFirstResponder];
        [self.eyeColorTextField resignFirstResponder];
        [self.heightTextField resignFirstResponder];
        [self.weightConditionTextField resignFirstResponder];
        [self.heightConditionTextField resignFirstResponder];
        [self.milesTextField resignFirstResponder];
    }//eom


#pragma mark - UIPickerView Delegate

    // returns the number of 'columns' to display.
    - (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
    {
        if(pickerView == heightPickerView)
        {
            return 2;
        }
        
        return 1;
    }

    // returns the # of rows in each component..
    - (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
    {
        //age
        if(pickerView == ageFromPickerView)
        {
            return [ageFromOptions count];
        }
        else if(pickerView == ageToPickerView)
        {
            return [ageToOptions count];
        }
        //hair color
        else if(pickerView == hairColorPickerView)
        {
            return [hairColorOptions count];
        }
        //eye color
        else if(pickerView == eyeColorPickerView)
        {
            return [eyeColorOptions count];
        }
        //height
        else if(pickerView == heightPickerView)
        {
            if(component == 0)//first option - height feet
            {
                return [heightFeetOptions count];
            }
            else if(component == 1)//second option - height inches
            {
                return [heightInchesOptions count];
            }
        }
        //weight conditions
        else if(pickerView == weightConditionsPickerView)
        {
            return [conditionsOptions count];
        }
        //height conditions
        else if(pickerView == heightConditionsPickerView)
        {
            return [conditionsOptions count];
        }
        //miles
        else if(pickerView == milesPickerView)
        {
            return [milesOptions count];
        }
        
        //gender
        return [genderOptions count];
        
    }//wom

    - (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
    {
        return 30.0;
    }

    - (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
    {
        //age
        if(pickerView == ageFromPickerView)
        {
            return [ageFromOptions objectAtIndex:row];
        }
        else if(pickerView == ageToPickerView)
        {
            return [ageToOptions objectAtIndex:row];
        }
        //hair color
        else if(pickerView == hairColorPickerView)
        {
            return [hairColorOptions objectAtIndex:row];
        }
        //eye color
        else if(pickerView == eyeColorPickerView)
        {
            return [eyeColorOptions objectAtIndex:row];
        }
        //height
        else if(pickerView == heightPickerView)
        {
            if(component == 0) //first option - height feet
            {
                return [heightFeetOptions objectAtIndex:row];
            }
            else if(component == 1) //second option - height inches
            {
                return [heightInchesOptions objectAtIndex:row];
            }
        }
        //weight conditions
        else if(pickerView == weightConditionsPickerView)
        {
            return [conditionsOptions objectAtIndex:row];
        }
        //height conditions
        else if(pickerView == heightConditionsPickerView)
        {
            return [conditionsOptions objectAtIndex:row];
        }
        //miles
        else if(pickerView == milesPickerView)
        {
            return [milesOptions objectAtIndex:row];
        }
  
        
        //gender
        return [genderOptions objectAtIndex:row];
    }//eom

//If the user chooses from the pickerview, it calls this function;
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    //gender
    if(pickerView == genderPickerView)
    {
        //updating values
        self->genderTextField.text = [genderOptions objectAtIndex:row];
    }
    //age
    else if(pickerView == ageFromPickerView)
    {
        //updating values
        self.ageFromTextField.text = [ageFromOptions objectAtIndex:row];
    }
    else if(pickerView == ageToPickerView)
    {
        //updating values
        self.ageToTextField.text = [ageToOptions objectAtIndex:row];
    }
    //hair color
    else if(pickerView == hairColorPickerView)
    {
        //updating values
        self.hairColorTextField.text = [hairColorOptions objectAtIndex:row];
    }
    //eye color
    else if(pickerView == eyeColorPickerView)
    {
        //updating values
        self.eyeColorTextField.text = [eyeColorOptions objectAtIndex:row];
    }
    //height
    else if(pickerView == heightPickerView)
    {

        if(component == 0) //first option - height feet
        {
            heightFeet = [heightFeetOptions objectAtIndex:row];
        }
        else if(component == 1) //second option - height inches
        {
            heightInches = [heightInchesOptions objectAtIndex:row];
        }
        
        //updating values
        self.heightTextField.text = [heightFeet stringByAppendingFormat:@"%@",heightInches];
    }
    //weight conditions
    else if(pickerView == weightConditionsPickerView)
    {
        //updating values
        self.weightConditionTextField.text = [conditionsOptions objectAtIndex:row];
    }
    //height conditions
    else if(pickerView == heightConditionsPickerView)
    {
        //updating values
        self.heightConditionTextField.text = [conditionsOptions objectAtIndex:row];
    }
    //miles
    else if(pickerView == milesPickerView)
    {
        //updating values
        self.milesTextField.text = [milesOptions objectAtIndex:row];
    }
    
}//eom

#pragma mark - ethnicity functions

    /* updates the selection status of the current button pressed */
    - (IBAction)ethnicityButtonValuesChanged:(UIButton *)sender
    {
        int buttonID = (int)sender.tag;
        if( (buttonID > -1) && (buttonID < 10)  )
        {
            //get current status
            BOOL currEnthnicitySelected = [[ethnicitiesSelected objectAtIndex:buttonID] boolValue];
            
            //calculating new status
            if(currEnthnicitySelected)
            {
                currEnthnicitySelected = false;
            }
            else if(currEnthnicitySelected == FALSE)
            {
                currEnthnicitySelected = true;
            }
            
            //if any unselected all other choices
            if(  (buttonID == 0) && (currEnthnicitySelected == TRUE) )
            {
                //update Any button selection
                [ethnicitiesSelected replaceObjectAtIndex:0 withObject: [NSNumber numberWithBool:YES]];
                
                //reflecting changes of selection on ANY button
                sender.layer.borderColor = [UIColor blackColor].CGColor;
                
                //diselect all other buttons
                for(int iter = 1; iter < [ethnicitiesButtons count]; iter++)
                {
                    //current button
                    UIButton * currButton = [ethnicitiesButtons objectAtIndex:iter];
                    
                    //reflect diselection on curr button color
                    currButton.layer.borderColor = [UIColor clearColor].CGColor;
                    
                    //update curr button selection
                    [ethnicitiesSelected replaceObjectAtIndex:iter withObject: [NSNumber numberWithBool:NO]];
                    
                }//eofl
            }
            else
            {
                
                //diselect ANY button
                UIButton * firstButton = [ethnicitiesButtons objectAtIndex:0];
                
                //reflect diselection on curr button color
                firstButton.layer.borderColor = [UIColor clearColor].CGColor;
                
                //update curr button selection
                [ethnicitiesSelected replaceObjectAtIndex:0 withObject: [NSNumber numberWithBool:NO]];

                
                //current button
                UIButton * currButton = [ethnicitiesButtons objectAtIndex:buttonID];
                
                if(currEnthnicitySelected == TRUE)
                {
                    //reflect diselection on curr button color
                    currButton.layer.borderColor = [UIColor blackColor].CGColor;
                    
                    //update curr button selection
                    [ethnicitiesSelected replaceObjectAtIndex:buttonID withObject: [NSNumber numberWithBool:YES]];
                    
                }
                else if(currEnthnicitySelected == FALSE)
                {
                    //reflect diselection on curr button color
                    currButton.layer.borderColor = [UIColor clearColor].CGColor;
                    
                    //update curr button selection
                    [ethnicitiesSelected replaceObjectAtIndex:buttonID withObject: [NSNumber numberWithBool:NO]];
                }
            }
            
        }//eo-valid buttons
    }//eo-action

    /* set up Ethnicity Buttons status */
    -(void)setUpEthnicityButtons
    {
        ethnicities = [ [NSArray alloc] initWithObjects:
                                       @"All",
                                       @"Non-Hispanic White or Euro-American",
                                       @"Black, Afro-Caribbean, or African American",
                                       @"Latino or Hispanic American",
                                       @"East Asian or Asian American",
                                       @"South Asian or Indian American",
                                       @"Middle Eastern or Arab American",
                                       @"Native American or Alaskan Native",
                                       @"Other",
                                       nil];
        
        //setting all index as NOT pressed
        ethnicitiesSelected = [[NSMutableArray alloc] initWithObjects:
                               [NSNumber numberWithBool:YES],   //index 0
                               [NSNumber numberWithBool:NO],   //index 1
                               [NSNumber numberWithBool:NO],   //index 2
                               [NSNumber numberWithBool:NO],   //index 3
                               [NSNumber numberWithBool:NO],   //index 4
                               [NSNumber numberWithBool:NO],   //index 5
                               [NSNumber numberWithBool:NO],   //index 6
                               [NSNumber numberWithBool:NO],   //index 7
                               [NSNumber numberWithBool:NO],   //index 8
                               nil];

        //updating all buttons to reflect their status
        [self updateEthnicitiesButtonValue];

    }//eom

    /* updates the visual colors of all buttons based on their current selection */
    -(void)updateEthnicitiesButtonValue
    {
        //diselect all other buttons
        int totalButtons = (int)[ethnicitiesButtons count];
        for(int iter = 0; iter < totalButtons; iter++)
        {
            //current button
            UIButton * currButton = [ethnicitiesButtons objectAtIndex:iter];
            currButton.layer.borderWidth = 4.5f;
            currButton.layer.cornerRadius = 10.0f;
            
            //get current status
            int currEthnicitySelected = [[ethnicitiesSelected objectAtIndex:iter] boolValue];
            if(currEthnicitySelected)
            {
                //reflect diselection on curr button color
                currButton.layer.borderColor = [UIColor blackColor].CGColor;
            }
            else
            {
                //reflect diselection on curr button color
                currButton.layer.borderColor = [UIColor clearColor].CGColor;
            }
        }//eofl

    }//eom



#pragma mark - talent functions

    /* updates the selection status of the current button pressed */
    - (IBAction)talentButtonValuesChanged:(UIButton *)sender
    {
        int buttonID = (int)sender.tag;
        if( (buttonID > -1) && (buttonID < 12)  )
        {
            //get current status
            BOOL currTalentSelect = [[talentsSelected objectAtIndex:buttonID] boolValue];
            
            //updating new selection
            if(currTalentSelect)
            {
                currTalentSelect = FALSE;
            }
            else if(currTalentSelect == FALSE)
            {
                currTalentSelect = TRUE;
            }
            
            //current button
            UIButton * currButton = [talentButtons objectAtIndex:buttonID];
            
            if(currTalentSelect == TRUE)
            {
                //reflect diselection on curr button color
                currButton.layer.borderColor = [UIColor blackColor].CGColor;
                
                //update curr button selection
                [talentsSelected replaceObjectAtIndex:buttonID withObject: [NSNumber numberWithBool:YES]];
                
            }
            else if(currTalentSelect == FALSE)
            {
                //reflect diselection on curr button color
                currButton.layer.borderColor = [UIColor clearColor].CGColor;
                
                //update curr button selection
                [talentsSelected replaceObjectAtIndex:buttonID withObject: [NSNumber numberWithBool:NO]];
            }
        }//eo-valid buttons
    }//eom


    /* set up Talent Buttons status */
    -(void) setUpTalentButtons
    {
        talents = [ [NSArray alloc] initWithObjects:
                       @"Brand Ambassador",
                       @"Catering Company",
                       @"Dancer",
                       @"DJ",
                       @"Field Marketing Manager",
                       @"Flyer Distributor",
                       @"Live Band",
                       @"Model",
                       @"Production Assistant",
                       @"Sales Executive",
                       @"Waiter/Waitress",
                       @"Other",
                       nil];
        
        //setting all index as NOT pressed
        talentsSelected = [[NSMutableArray alloc] initWithObjects:
                               [NSNumber numberWithBool:NO],   //index 0
                               [NSNumber numberWithBool:NO],   //index 1
                               [NSNumber numberWithBool:NO],   //index 2
                               [NSNumber numberWithBool:NO],   //index 3
                               [NSNumber numberWithBool:NO],   //index 4
                               [NSNumber numberWithBool:NO],   //index 5
                               [NSNumber numberWithBool:NO],   //index 6
                               [NSNumber numberWithBool:NO],   //index 7
                               [NSNumber numberWithBool:NO],   //index 8
                               [NSNumber numberWithBool:NO],   //index 9
                               [NSNumber numberWithBool:NO],   //index 10
                               [NSNumber numberWithBool:NO],   //index 11
                               nil];

        //update all talent buttons
        [self updateAllTalentButtons];
    }//eom

    /* updates the visual colors of all buttons based on their current selection */
    -(void)updateAllTalentButtons
    {
        //diselect all other buttons
        int totalButtons = (int)[talentButtons count];
        for(int iter = 0; iter < totalButtons; iter++)
        {
            //current button
            UIButton * currButton = [talentButtons objectAtIndex:iter];
            currButton.layer.borderWidth = 4.5f;
            currButton.layer.cornerRadius = 10.0f;
            
            //get current status
            int currTalentSelected = [[talentsSelected objectAtIndex:iter] boolValue];
            if(currTalentSelected)
            {
                //reflect diselection on curr button color
                currButton.layer.borderColor = [UIColor blackColor].CGColor;
            }
            else
            {
                //reflect diselection on curr button color
                currButton.layer.borderColor = [UIColor clearColor].CGColor;
            }
        }//eofl

    }//eom

#pragma mark - languages functions

/* updates the selection status of the current button pressed */
- (IBAction)languagesButtonsValueChanged:(UIButton *)sender
{

    int buttonID = (int)sender.tag;
    if( (buttonID > -1) && (buttonID < 10)  )
    {
        //get current status
        BOOL currTalentSelect = [[languagesSelected objectAtIndex:buttonID] boolValue];
        
        //updating new selection
        if(currTalentSelect)
        {
            currTalentSelect = FALSE;
        }
        else if(currTalentSelect == FALSE)
        {
            currTalentSelect = TRUE;
        }
        
        //current button
        UIButton * currButton = [languagesButtons objectAtIndex:buttonID];
        
        if(currTalentSelect == TRUE)
        {
            //reflect diselection on curr button color
            currButton.layer.borderColor = [UIColor blackColor].CGColor;
            
            //update curr button selection
            [languagesSelected replaceObjectAtIndex:buttonID withObject: [NSNumber numberWithBool:YES]];
            
        }
        else if(currTalentSelect == FALSE)
        {
            //reflect diselection on curr button color
            currButton.layer.borderColor = [UIColor clearColor].CGColor;
            
            //update curr button selection
            [languagesSelected replaceObjectAtIndex:buttonID withObject: [NSNumber numberWithBool:NO]];
        }
    }//eo-valid buttons
}//eom


/* set up Talent Buttons status */
-(void) setUpLanguagesButtons
{
    languages = [ [NSArray alloc] initWithObjects:
               @"English",
               @"Spanish",
               @"Arabic",
               @"French",
               @"German",
               @"Italian",
               @"Japanese",
               @"Madarin",
               @"Portuguese",
               @"Russian",
               nil];
    
    //setting all index as NOT pressed
    languagesSelected = [[NSMutableArray alloc] initWithObjects:
                       [NSNumber numberWithBool:YES],  //index 0
                       [NSNumber numberWithBool:NO],   //index 1
                       [NSNumber numberWithBool:NO],   //index 2
                       [NSNumber numberWithBool:NO],   //index 3
                       [NSNumber numberWithBool:NO],   //index 4
                       [NSNumber numberWithBool:NO],   //index 5
                       [NSNumber numberWithBool:NO],   //index 6
                       [NSNumber numberWithBool:NO],   //index 7
                       [NSNumber numberWithBool:NO],   //index 8
                       [NSNumber numberWithBool:NO],   //index 9
                         nil];
    
    //update all talent buttons
    [self updateAllLanguagesButtons];
}//eom

/* updates the visual colors of all buttons based on their current selection */
-(void)updateAllLanguagesButtons
{
    //diselect all other buttons
    int totalButtons = (int)[languagesButtons count];
    for(int iter = 0; iter < totalButtons; iter++)
    {
        //current button
        UIButton * currButton = [languagesButtons objectAtIndex:iter];
        currButton.layer.borderWidth = 4.5f;
        currButton.layer.cornerRadius = 10.0f;
        
        //get current status
        int currTalentSelected = [[languagesSelected objectAtIndex:iter] boolValue];
        if(currTalentSelected)
        {
            //reflect diselection on curr button color
            currButton.layer.borderColor = [UIColor blackColor].CGColor;
        }
        else
        {
            //reflect diselection on curr button color
            currButton.layer.borderColor = [UIColor clearColor].CGColor;
        }
    }//eofl
    
}//eom

#pragma mark - willing to travel functions
- (IBAction)willingToTravelValueChanged:(UIButton *)sender
{
    
    int buttonID = (int)sender.tag;
    if( buttonID == 0 )
    {
        //get current status
        NSString * currentStatus = [willingToTravelStatus objectAtIndex:buttonID];
        int currentStatusInt    = [currentStatus intValue];
        
        //calculate new status
        currentStatusInt++;
        int newStatus = currentStatusInt;
        if(newStatus > 2)
        {
            newStatus = 0;
        }
        
        //get the new status text representation
        NSString * newTextStatus = [willingToTravelOptions objectAtIndex:newStatus];
        
        //update button reflecting the new status
        if(newStatus == 0)//MAYBE
        {
            [sender setTitle:newTextStatus forState:UIControlStateNormal];
//            sender.layer.borderColor = [UIColor blackColor].CGColor;
//            [sender setBackgroundColor: [UIColor clearColor] ];
        }
        else if(newStatus == 1)//YES
        {
            [sender setTitle:newTextStatus forState:UIControlStateNormal];
//            sender.layer.borderColor = [UIColor greenColor].CGColor;
//            [sender setBackgroundColor: [UIColor greenColor] ];
        }
        else if(newStatus == 2)//NO
        {
            [sender setTitle:newTextStatus forState:UIControlStateNormal];
//            sender.layer.borderColor = [UIColor redColor].CGColor;
//            [sender setBackgroundColor: [UIColor redColor] ];
        }

        //save the new status for future changes
        NSString * newStatusAsString = [NSString stringWithFormat:@"%d",newStatus];
        [willingToTravelStatus replaceObjectAtIndex:buttonID withObject:newStatusAsString];
        
    }//eo-valid options
    
}//eom

-(void)setUpWillingToTravelButton
{
    willingToTravelOptions = [[NSArray alloc]initWithObjects:
                        @"Maybe",
                        @"Yes",
                        @"No",
                        nil];

    willingToTravelStatus = [[NSMutableArray alloc] initWithObjects:@"0", nil];
    
    willingToTravelButton.layer.borderColor = [UIColor blackColor].CGColor;
    willingToTravelButton.layer.borderWidth = 4.5f;
    willingToTravelButton.layer.cornerRadius = 10.0f;
}//eom


#pragma mark - helper functions

    /*sets up taps gesture*/
    -(void)setUpTapGesture
    {
        //to dismiss keyboard when a tap is done outside the textfield
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard:)];
        [self.view addGestureRecognizer:tap];
        
    }//eoom

    /* dimisses keyboard upon touching background */
    - (void)dismissKeyboard:(UITapGestureRecognizer *)recognizer {
        [self.view endEditing:YES];
    }

    /* create UIAlert*/
    -(void) showAlert:(NSString*)title withMessage:(NSString*)message and:(NSString*) cancelTitle
    {
        
        //creating UIAlert
        UIAlertView * alert =[[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:cancelTitle
                                              otherButtonTitles: nil];
        [alert show];//display alert
    }//eom

    /* updates background with a random color */
    -(void)updateBackgroundRandomColor
    {
        ColorWheel * color = [[ColorWheel alloc]init];
        self.view.backgroundColor = [color randomColor];
    }//eom


    /* validating email */
    - (BOOL) validateEmail: (NSString *) candidate {
        NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        //  return 0;
        return [emailTest evaluateWithObject:candidate];
    }


#pragma mark - scrollview functions
    - (void) scrollViewAdaptToStartEditingTextField:(UITextField*)textField
    {
        CGPoint point = CGPointMake(0, textField.frame.origin.y - 3 * textField.frame.size.height);
        [scrollView setContentOffset:point animated:YES];
    }//eom

    - (void) scrollVievEditingFinished:(UITextField*)textField
    {
        CGPoint point = CGPointMake(0, 0);
        [scrollView setContentOffset:point animated:YES];
    }//eom

#pragma mark - verify data
    -(bool)verifyData
    {
        //checking for valid input
        NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
        NSString * testing;
        NSString *trimmedString;
        
        //email
        if(emailTextField.text.length > 0)
        {
            /* making sure email has the correct format*/
            bool emailQuality = [self validateEmail:emailTextField.text];
            if(emailQuality == false)
            {
                [self scrollVievEditingFinished:emailTextField]; //take scroll to textfield so user can see their error
                [self showAlert:@"Search Talent" withMessage:@"Email is not in the correct format." and:@"Okay"];
                return false;
            }
        }
        
        //cellphone
        if(cellphoneTextField.text.length > 0)
        {
            if( self.cellphoneTextField.text.length < 10)
            {
                //take scroll to textfield so user can see their error
                [self scrollVievEditingFinished:milesZipcodeTextField];
                // it's empty or contains only white spaces
                [self showAlert:@"Search Talent" withMessage:@"Please make sure to enter a complete phone number" and:@"Okay"];
                return false;
            }
        }
        
        //miles
        if(milesTextField.text.length > 0)
        {
            testing = self.milesZipcodeTextField.text;
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""])
            {
                //take scroll to textfield so user can see their error
                [self scrollVievEditingFinished:milesZipcodeTextField];
                // it's empty or contains only white spaces
                [self showAlert:@"Search Talent" withMessage:@"Please enter a zipcode" and:@"Okay"];
                return false;
            }
            else if( self.milesZipcodeTextField.text.length < 5)
            {
                //take scroll to textfield so user can see their error
                [self scrollVievEditingFinished:milesZipcodeTextField];
                // it's empty or contains only white spaces
                [self showAlert:@"Search Talent" withMessage:@"Please make sure to enter a complete zipcode" and:@"Okay"];
                return false;
            }
        }
        
        return true;
    }//eom

#pragma mark - sending data
    - (IBAction)searchTalentRequested:(UIButton *)sender
    {
        bool response = [self verifyData];
        if(response)
        {
            [self sendSearchDataToServer];
        }
    }//eom


#pragma mark - Go to Search Results

    /*  goes to the search results view */
    -(void)goToSearchResults:(NSDictionary *)searchResults
    {
        
        NSArray * data = [searchResults allValues];
        
         StaffSearchResultTableViewController  * SearchTalentResultsView = [[StaffSearchResultTableViewController alloc] init];
        
        SearchTalentResultsView.listOptions  = data;
        
         //hiding the nav bar of the next view
         //    [[self navigationController] setNavigationBarHidden:YES animated:YES];
         
         //pushing controller to navigation controller
         [self.navigationController pushViewController:SearchTalentResultsView animated:YES];
    }//eom

#pragma mark - JSON server response
    /* processing server response */
    -(void) processServerDataResponse:(NSDictionary *) responce
    {
        //    NSLog(@"[1] responce: %@", responce);
        
        NSDictionary * userResults      = [responce objectForKey:@"results"];
        
        int responceType                = [[userResults objectForKey:@"responseType"] intValue];
        
        //message
        NSDictionary * responceMessage  = [userResults objectForKey:@"message"];
        NSString * message              = [NSString stringWithFormat:@"%@", responceMessage];
        
        NSLog(@"results is %@", userResults);
        NSLog(@"responceType is %d", responceType);
        if(responceType > 0) //responce was good
        {
            //data
            NSDictionary * responceData  = [userResults objectForKey:@"data"];
         
            NSLog(@"data is %@", responceData);
            //go to search results view
            [self goToSearchResults:responceData];
        }
        else if(responceType < 1) //invalid response
        {
            //notifying user code was accepted
            NSString * messsageToDisplay = @"No Search results";
            [self showAlert:@"Search Talent" withMessage:messsageToDisplay and:@"Okay"];
        }
    }//eom

#pragma mark - JSON functions

    /* sends search data to server */
    -(void)sendSearchDataToServer
    {
        NSString *serverAddress = @"http://45.55.208.175/Website/jsonPOST_searchTalent.php";//hard coding website
        
        // preparing data to be sent
        NSMutableDictionary * searchData = [self prepareServerData];
        NSLog(@"");
        NSLog(@" about to send the following data: %@", searchData);
        NSLog(@"");
        
        //adding data to request
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                        initWithURL:[NSURL URLWithString:  serverAddress ]];
        
        [request setHTTPMethod:@"POST"]; //request type
        
        //sending data
        NSError *error;
        NSData *postdata = [NSJSONSerialization dataWithJSONObject:searchData options:0 error:&error];
        
        [request setHTTPBody:postdata];
        
//        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//        NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
        
        [NSURLConnection connectionWithRequest:request delegate:self];
        
    }//eo-action


    /* prepares the data that will be sent to server */
    -(NSMutableDictionary *) prepareServerData
    {
        //creating initial list
        NSMutableDictionary * finalList = [[NSMutableDictionary alloc] init];
        
        //name
        if(nameTextField.text.length > 0 )
        {
            finalList[@"name"]       = nameTextField.text;
        }
        
        //email
        if(emailTextField.text.length > 0 )
        {
            finalList[@"email"]      = emailTextField.text;
        }
        
        //phone
        if(cellphoneTextField.text.length > 0 )
        {
            finalList[@"phone"]      = cellphoneTextField.text;
        }
        
        //has photo
        NSString * hasPhotoVal      = [hasButtonCurrentStatus objectAtIndex:0];         //getting current status
        int hasPhotoInt             = [hasPhotoVal intValue];                           //converting status to int
        NSString * hasPhoto         = [hasButtonOptions objectAtIndex:hasPhotoInt];     //getting status text representation
        //
        finalList[@"hasPhoto"]      = hasPhoto;
        
        //has website
        NSString * hasWebsiteVal    = [hasButtonCurrentStatus objectAtIndex:1];         //getting current status
        int hasWebsiteInt           = [hasWebsiteVal intValue];                         //converting status to int
        NSString * hasWebsite       = [hasButtonOptions objectAtIndex:hasWebsiteInt];   //getting status text representation
        //
        finalList[@"hasWebsite"]    = hasWebsite;
        
        //has tattoos
        NSString * hasTattoosVal    = [hasButtonCurrentStatus objectAtIndex:2];         //getting current status
        int hasTattoosInt           = [hasTattoosVal intValue];                         //converting status to int
        NSString * hasTattoos       = [hasButtonOptions objectAtIndex:hasTattoosInt];   //getting status text representation
        //
        finalList[@"hasTattoos"]    = hasTattoos;
        
        //has Piercings
        NSString * hasPiercingsVal  = [hasButtonCurrentStatus objectAtIndex:3];         //getting current status
        int hasPiercingsInt         = [hasPiercingsVal intValue];                       //converting status to int
        NSString * hasPiercings     = [hasButtonOptions objectAtIndex:hasPiercingsInt]; //getting status text representation
        //
        finalList[@"hasPiercings"]  = hasPiercings;
 
        //gender
        if(genderTextField.text.length > 0 )
        {
            finalList[@"gender"]    = genderTextField.text;
        }
        
        //age
        if(ageFromTextField.text.length > 0 )
        {
            finalList[@"ageFrom"]   = ageFromTextField.text;
        }
        if(ageToTextField.text.length > 0 )
        {
            finalList[@"ageTo"]    = ageToTextField.text;
        }
        
        //weight
        if(weightConditionTextField.text.length > 0 )
        {
            finalList[@"weightCondition"]   = weightConditionTextField.text;
        }
        if(weightTextField.text.length > 0 )
        {
            finalList[@"weight"]            = weightTextField.text;
        }

        //height
        if(heightConditionTextField.text.length > 0 )
        {
            finalList[@"heightCondition"]   = heightConditionTextField.text;
        }
        if(heightTextField.text.length > 0 )
        {
            finalList[@"height"]            = heightTextField.text;
        }

        //hair color
        if(hairColorTextField.text.length > 0 )
        {
            finalList[@"hairColor"]            = hairColorTextField.text;
        }
        
        //eye color
        if(eyeColorTextField.text.length > 0 )
        {
            finalList[@"eyeColor"]            = eyeColorTextField.text;
        }

        
        //ethnicities
        NSMutableArray * ethnicitiesDesired = [[NSMutableArray alloc] init];
        int totalEthnicities = (int)[ethnicitiesSelected count];
        for(int iter = 0; iter < totalEthnicities; iter++)
        {
            //current ethnicity selection status
            int currEthnicitySelected = [[ethnicitiesSelected objectAtIndex:iter] boolValue];
            if(currEthnicitySelected)
            {
                //current ethnicity
                NSString * currentEthnicity = [ethnicities objectAtIndex:iter];
                
                //adding ethnicity
                [ethnicitiesDesired addObject:currentEthnicity];
            }
        }
        //adding all ethnicities
        if( [ethnicitiesDesired count] > 0)
        {
            finalList[@"ethnicities"] = ethnicitiesDesired;
        }
        
        
        //talents
        NSMutableArray * talentsDesired = [[NSMutableArray alloc] init];
        int totalTalents = (int)[talentsSelected count];
        for(int iter = 0; iter < totalTalents; iter++)
        {
            //current talent selection status
            int talentSelected = [[talentsSelected objectAtIndex:iter] boolValue];
            if(talentSelected)
            {
                //current ethnicity
                NSString * currentTalent = [talents objectAtIndex:iter];
                
                //adding ethnicity
                [talentsDesired addObject:currentTalent];
            }
        }
        //adding all talents
        if( [talentsDesired count] > 0)
        {
            finalList[@"talents"] = talentsDesired;
        }

        //languages
        NSMutableArray * languagesDesired = [[NSMutableArray alloc] init];
        int totalLanguages = (int)[languagesSelected count];
        for(int iter = 0; iter < totalLanguages; iter++)
        {
            //current language selection status
            int languageSelected = [[languagesSelected objectAtIndex:iter] boolValue];
            if(languageSelected)
            {
                //current languages
                NSString * currentLanguage = [languages objectAtIndex:iter];
                
                //adding languages
                [languagesDesired addObject:currentLanguage];
            }
        }
        //adding all languages
        if( [languagesDesired count] > 0)
        {
            finalList[@"languages"] = languagesDesired;
        }
        
        
        //miles
        if( (milesTextField.text.length > 0) && (milesZipcodeTextField.text.length) )
        {
            finalList[@"miles"]     = milesTextField.text;
            finalList[@"zipcode"]   = milesZipcodeTextField.text;
        }
  
        //travel
        NSString * willingToTravelVal        = [willingToTravelStatus objectAtIndex:0];
        int willingToTravelInt               = [willingToTravelVal intValue];
        NSString * willingToTravel           = [willingToTravelOptions objectAtIndex:willingToTravelInt];
        //
        finalList[@"willingToTravel"]        = willingToTravel;
        
        return finalList;
    }//eom

    /* error occurred sending data to server */
    -(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
    {
        NSLog(@" Failed with error '%@'", error);
    }//eom

    /* data received from server */
    - (void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data
    {
        
        NSDictionary * rawExhibits = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"[1] from server replied: %@",rawExhibits);
        
        NSString *dataResponce = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"[2] responce from server %@",dataResponce);

        // Get JSON objects into initial array
        NSArray *rawExhibits2 = (NSArray *)[NSJSONSerialization JSONObjectWithData:[dataResponce dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
        NSLog(@"[3] responce from server %@",rawExhibits2);
        
        //processing responce
        [self processServerDataResponse:rawExhibits];
        
    }//eom

    /* responce from server */
    - (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
    {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        NSLog(@" responce: %@", httpResponse.description);
        
    }//eo-action

    /*
     - (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
     {
     data = [[NSMutableData alloc] init];
     NSLog(@"Data Data , %@", data);
     }
     */


@end
