//
//  SearchTalentViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 10/17/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "SearchTalentViewController.h"
#import "ColorWheel.h"

@interface SearchTalentViewController ()
{
    //arrays
    NSArray *genderOptions;
    NSArray *ageOptions;
    NSArray *hairColorOptions;
    NSArray *eyeColorOptions;
    NSArray *heightFeetOptions;
    NSArray *heightInchesOptions;
    NSArray *conditionsOptions;
    
    NSArray *hasButtonOptions;
    NSMutableArray *hasButtonCurrentStatus;
    
    NSArray * ethnicities;
    NSMutableArray *ethnicitiesSelected;
    
    NSArray * talents;
    NSMutableArray *talentsSelected;

    //pickers
    UIPickerView * genderPickerView;
    UIPickerView * agePickerView;
    UIPickerView * hairColorPickerView;
    UIPickerView * eyeColorPickerView;
    UIPickerView * heightPickerView;
    UIPickerView * weightConditionsPickerView;
    UIPickerView * heightConditionsPickerView;
    
    //
    NSString * heightFeet;
    NSString * heightInches;
    
}


@end

@implementation SearchTalentViewController

@synthesize nameTextField,emailTextField,cellphoneTextField;
@synthesize hasPhotoButton, hasPiercingsButton, hasTattoosButton, hasWebsiteButton;
@synthesize genderTextField,ageTextField,weightConditionTextField,weightTextField,heightConditionTextField,heightTextField,hairColorTextField,eyeColorTextField;
@synthesize ethnicitiesButtons;
@synthesize TalentButtons;
@synthesize scrollView;




- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self updateBackgroundRandomColor];
    [self setUpTapGesture];
    [self setUpAllPickers];
    [self setUpHasButtonOptionsAndInitialStatus];
    [self setUpEthnicityButtons];
    [self setUpTalentButtons];
}//EOM



#pragma mark - buttons functions

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


#pragma mark - picker functions (gender, age, weight, height, hair & eye color)
    -(void)setUpAllPickers
    {
        //gender
        [self setUpGender];
        genderOptions = [[NSArray alloc] initWithObjects:@"Any",
                         @"Male",
                         @"Female",
                         nil];

        //age
        [self setUpAge];
        ageOptions = [[NSArray alloc] initWithObjects:@"Any",
                          @"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",
                          @"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",
                          @"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45+",
                         nil];

        //hair color
        [self setUpHairColor];
        hairColorOptions = [[NSArray alloc]
                            initWithObjects:@"Any",
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
                           initWithObjects:@"Any",
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
                             @"At most",
                             @"equal",
                             @"atleast",
                             @"Any",
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
    -(void)setUpAge
    {
        // create a UIPicker view as a custom keyboard view
        agePickerView = [[UIPickerView alloc] init];
        [agePickerView sizeToFit];
        agePickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        agePickerView.delegate = self;
        agePickerView.dataSource = self;
        agePickerView.showsSelectionIndicator = YES;
        
        //updating keyboard as picker
        self.ageTextField.inputView = agePickerView;
        
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
        self.ageTextField.inputAccessoryView = keyboardDoneButtonView;
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



    //process the data after the user click done on the uipicker
    //   and resign being the first reponsder
    - (void)doneClicked:(id)sender
    {
        [self.genderTextField resignFirstResponder];
        [self.ageTextField resignFirstResponder];
        [self.hairColorTextField resignFirstResponder];
        [self.eyeColorTextField resignFirstResponder];
        [self.heightTextField resignFirstResponder];
        [self.weightConditionTextField resignFirstResponder];
        [self.heightConditionTextField resignFirstResponder];
        
    }//eom

    //process the date selected after the user click cancel
    //   and resign being the first reponsder
    - (void)cancelClicked:(id)sender
    {
        [self.genderTextField resignFirstResponder];
        [self.ageTextField resignFirstResponder];
        [self.hairColorTextField resignFirstResponder];
        [self.eyeColorTextField resignFirstResponder];
        [self.heightTextField resignFirstResponder];
        [self.weightConditionTextField resignFirstResponder];
        [self.heightConditionTextField resignFirstResponder];
        
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
        if(pickerView == agePickerView)
        {
            return [ageOptions count];
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
        if(pickerView == agePickerView)
        {
            return [ageOptions objectAtIndex:row];
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

        
        //gender
        return [genderOptions objectAtIndex:row];
    }//eom

//If the user chooses from the pickerview, it calls this function;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //gender
    if(pickerView == genderPickerView)
    {
        //updating values
        self->genderTextField.text = [genderOptions objectAtIndex:row];
    }
    //age
    else if(pickerView == agePickerView)
    {
        //updating values
        self.ageTextField.text = [ageOptions objectAtIndex:row];
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

}//eom

#pragma mark - ethnicity functions

/* updates the selection status of the current button pressed */
- (IBAction)ethnicityButtonValuesChanged:(UIButton *)sender
{
    
    NSLog(@"");
    NSLog(@" ethnicitiesSelected BEFORE: %@", ethnicitiesSelected.debugDescription);
    
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

    
    NSLog(@"");
    NSLog(@" ethnicitiesSelected AFTER: %@", ethnicitiesSelected.debugDescription);
    NSLog(@"");
    NSLog(@"");
}//eo-action

/* set up Ethnicity Buttons status */
-(void)setUpEthnicityButtons
{
    ethnicities = [ [NSArray alloc] initWithObjects:
                                   @"Any",
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
    for(int iter = 0; iter < [ethnicitiesButtons count]; iter++)
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
- (IBAction)talentButtonValuesChanged:(UIButton *)sender
{

    
}//eom

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
                           nil];

    //update all talent buttons
    [self updateAllTalentButtons];
}//eom

/* updates the visual colors of all buttons based on their current selection */
-(void)updateAllTalentButtons
{
    //diselect all other buttons
    for(int iter = 0; iter < [TalentButtons count]; iter++)
    {
        //current button
        UIButton * currButton = [TalentButtons objectAtIndex:iter];
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




#pragma mark -

    - (void)didReceiveMemoryWarning
    {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
