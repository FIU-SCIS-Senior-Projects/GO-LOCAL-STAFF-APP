//
//  StaffRegistration2ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration2ViewController.h"
#import "StaffRegistration3ViewController.h"

#import "RegisteredStaff.h" //needed for staff registration

@interface StaffRegistration2ViewController ()
{
    NSString * languages; 
    NSString *completeAddress;
    NSString * stateSelected; //state selected
    bool gender;// 0-female 1-male
    BOOL genderSelected;
    
    //arrays
    NSArray *stateOptions;
    NSArray *languageOptions;

    //pickers
    UIPickerView * statePickerView;
    UIPickerView * nativeLanguagePickerView;
    UIPickerView * secondLanguagePickerView;
    UIPickerView * thirdLanguagePickerView;

    //labels
    __weak IBOutlet UILabel *addressLabel;
    __weak IBOutlet UILabel *cityLabel;
    __weak IBOutlet UILabel *zipcodeLabel;
    __weak IBOutlet UILabel *stateLabel;

    __weak IBOutlet UILabel *nativeLanguageLabel;
    __weak IBOutlet UILabel *secondLanguageLabel;
    __weak IBOutlet UILabel *thirdLanguageLabel;
}
@end

@implementation StaffRegistration2ViewController


@synthesize scrollView, address, city, zipcode, state,
nativeLanguage, secondLanguage, thirdLanguage,
nativeSelected, secondSelected, thirdSelected,
maleButton, femaleButton, registeredStaff;


- (void)viewDidLoad {
    [super viewDidLoad];
    
}//eom

-(void)viewDidAppear:(BOOL)animated
{
    [self setUpTapGesture];
    [self createPickerForState];
    [self createPickerForLanguages];
    [self setUpGenderButtons];
    genderSelected = FALSE;
    
//    [registeredStaff printUserData];

}//eom



#pragma mark - verify data enter
    /* verifying input fields
     */
    - (BOOL)verifyDataEnter
    {
        //checking for valid input
        NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
        NSString * testing;
        NSString *trimmedString;

        
            testing = self.address.text;
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                [self scrollVievEditingFinished:address]; //take scroll to textfield so user can see their error
                self.address.text =@""; //clearing field
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Please enter your address" and:@"Okay"];
                return 0;
            }
            else if( self.address.text.length < 5)
            {
                [self scrollVievEditingFinished:address]; //take scroll to textfield so user can see their error
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Please make sure to enter your complete address" and:@"Okay"];
                return 0;
            }

            testing = self.city.text;
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                [self scrollVievEditingFinished:city]; //take scroll to textfield so user can see their error
                self.city.text =@""; //clearing field
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Please enter the city of your address" and:@"Okay"];
                return 0;
            }
            else if( self.city.text.length < 2)
            {
                [self scrollVievEditingFinished:city]; //take scroll to textfield so user can see their error
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Please make sure to enter city" and:@"Okay"];
                return 0;
            }

      
            testing = self.zipcode.text;
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                [self scrollVievEditingFinished:zipcode]; //take scroll to textfield so user can see their error
                self.zipcode.text =@""; //clearing field
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Please enter the zipcode of your address" and:@"Okay"];
                return 0;
            }
            else if( self.zipcode.text.length < 5)
            {
                [self scrollVievEditingFinished:zipcode]; //take scroll to textfield so user can see their error
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Please make sure to enter your complete zipcode" and:@"Okay"];
                return 0;
            }

            testing = self.state.text;
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                [self scrollVievEditingFinished:state]; //take scroll to textfield so user can see their error
                self.state.text =@""; //clearing field
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Please enter the state of your address" and:@"Okay"];
                return 0;
            }
        
            //building completeAddress
            self->completeAddress = [self.address.text stringByAppendingFormat:@" %@ %@ %@", self.city.text,self.state.text , self.zipcode.text];
        
             //   NSLog(@"complete address is %@", self->completeAddress);
        
            //gender
            if ( self->genderSelected  == FALSE) {
                [self showAlert:@"Registration Field" withMessage:@"Please select a gender" and:@"Okay"];
                return 0;

            }

            //languages
            testing = self.nativeLanguage.text;
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                [self scrollVievEditingFinished:nativeLanguage]; //take scroll to textfield so user can see their error
                self.nativeLanguage.text =@""; //clearing field
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Please enter of your native Language" and:@"Okay"];
                return 0;
            }

            //creating list of languages
            NSMutableArray * languagesList = [[NSMutableArray alloc] init];
            [languagesList addObject: self.nativeLanguage.text];
            [languagesList addObject: self.secondLanguage.text];
            [languagesList addObject: self.thirdLanguage.text];
        
            //updating values
            [registeredStaff setAddress:self->completeAddress withCity:self.city.text withZipcode:self.zipcode.text andState:self.state.text];
            [registeredStaff setGender:self->gender];
            [registeredStaff setLanguages:languagesList];
        
        return 1;
    }//eom


#pragma mark - sending data
    /* */
    - (IBAction)submitForm:(id)sender {
        bool result = [self verifyDataEnter];
        if(result)
        {
            [self performSegueWithIdentifier:@"goToStaffRegister3" sender:self];
        }
        else
        {
            NSLog(@"missing some/all required fields on staffRegistration2");
        }
    }//eom

    /* preparing the data to sent to the next view controller */
    -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        if([segue.identifier isEqualToString:@"goToStaffRegister3"]){
            StaffRegistration3ViewController *controller = (StaffRegistration3ViewController *)segue.destinationViewController;
            
            controller.registeredStaff = registeredStaff;

        }
    }//eom


#pragma mark - helper method
    /* create UIAlert*/
    -(void) showAlert:(NSString*)title withMessage:(NSString*)message and:(NSString*) cancelTitle
    {
        //creating controller
        UIAlertController * actionController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleDefault handler:nil];
        
        [actionController addAction:defaultAction];
        
        [self presentViewController:actionController animated:YES completion:nil];
    }//eom

#pragma mark - gender buttons
    - (IBAction)genderValueChanged:(UIButton *)sender
    {
        int genderValue = (int) sender.tag;
        
        if(genderValue == 0)//  0 - female
        {
            //enabling female button
            femaleButton.layer.borderColor = [UIColor blackColor].CGColor;
            
            //disabling male button
            maleButton.layer.borderColor = [UIColor clearColor].CGColor;
            
            self->gender = 0;
            self->genderSelected = TRUE;
        }
        else if(genderValue == 1) //  1 - male
        {
            //enabling male button
            maleButton.layer.borderColor = [UIColor blackColor].CGColor;
            
            //disabling female button
            femaleButton.layer.borderColor = [UIColor clearColor].CGColor;
            
            self->gender = 1;
            self->genderSelected = TRUE;
        }
    }//EOA

    /* setups gender buttons */
    -(void)setUpGenderButtons
    {
        //male
        self.maleButton.layer.borderColor = [UIColor clearColor].CGColor;
        self.maleButton.layer.borderWidth = 4.5f;
        self.maleButton.layer.cornerRadius = 10.0f;

        //female
        self.femaleButton.layer.borderColor = [UIColor clearColor].CGColor;
        self.femaleButton.layer.borderWidth = 4.5f;
        self.femaleButton.layer.cornerRadius = 10.0f;

    }//eom

#pragma mark - tap gestures functions
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

#pragma mark - UIPicker Methods

    /* creates the picker for state selection*/
    -(void) createPickerForState
    {
        //setting up UIpicker for states selection
        stateOptions = [[NSArray alloc] initWithObjects:@"",@"AL", @"AK", @"AZ", @"AR", @"CA", @"CO", @"CT", @"DE", @"FL",@"GA", @"HI", @"ID", @"IL", @"IN", @"IA", @"KS", @"KY", @"LA", @"ME", @"MD", @"MA", @"MI", @"MN", @"MS", @"MO", @"MT", @"NE", @"NV", @"NH", @"NJ", @"NM", @"NY", @"NC", @"ND", @"OH", @"OK", @"PA", @"RI", @"SC", @"SD", @"TN", @"TX", @"UT", @"VT", @"VA", @"WA", @"WV", @"WI", @"WY", nil];

        // create a UIPicker view as a custom keyboard view
        statePickerView = [[UIPickerView alloc] init];
        [statePickerView sizeToFit];
        statePickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        statePickerView.delegate = self;
        statePickerView.dataSource = self;
        statePickerView.showsSelectionIndicator = YES;

        //updating k
        self.state.inputView = statePickerView;

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
                                                                         style:UIBarButtonItemStylePlain
                                                                        target:self
                                                                        action:@selector(cancelClicked:)];

        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                       style:UIBarButtonItemStyleDone target:self
                                                                      action:@selector(doneClicked:)] ;
        //adding UIBarItems to the Keyboard/Picker
        [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty1, cancelButton, doneButton, nil]];


        // Plug the keyboardDoneButtonView into the text field...
        self.state.inputAccessoryView = keyboardDoneButtonView;

    }//eom

    /* creates the picker for 1st 2nd 3rd language selection */
    -(void) createPickerForLanguages
    {
        //setting up UIpicker for states selection
        languageOptions = [[NSArray alloc] initWithObjects:@"",@"English",@"Spanish",@"Arabic",@"French", @"German", @"Italian",@"Japanese", @"Mandarin", @"Portuguese", @"Russian",nil];

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
                                                                          style:UIBarButtonItemStylePlain
                                                                         target:self
                                                                         action:@selector(cancelClicked:)];

        //creating 'Done' UIBarItem to be the exit point for the picker
        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                        style:UIBarButtonItemStyleDone target:self
                                                                        action:@selector(doneClicked:)] ;


        //adding UIBarItems to the Keyboard/Picker
        [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty, cancelButton, doneButton, nil]];

        /* native language */
            // create a UIPicker view as a custom keyboard view
            nativeLanguagePickerView = [[UIPickerView alloc] init];
            [nativeLanguagePickerView sizeToFit];
            nativeLanguagePickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
            nativeLanguagePickerView.delegate = self;
            nativeLanguagePickerView.dataSource = self;
            nativeLanguagePickerView.showsSelectionIndicator = YES;

            self.nativeLanguage.inputView = nativeLanguagePickerView;

            // Plug the keyboardDoneButtonView into the text field
            self.nativeLanguage.inputAccessoryView = keyboardDoneButtonView;

        /* second language */
            // create a UIPicker view as a custom keyboard view
            secondLanguagePickerView = [[UIPickerView alloc] init];
            [secondLanguagePickerView sizeToFit];
            secondLanguagePickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
            secondLanguagePickerView.delegate = self;
            secondLanguagePickerView.dataSource = self;
            secondLanguagePickerView.showsSelectionIndicator = YES;

            self.secondLanguage.inputView = secondLanguagePickerView;

            // Plug the keyboardDoneButtonView into the text field
            self.secondLanguage.inputAccessoryView = keyboardDoneButtonView;

        /* third language */
            // create a UIPicker view as a custom keyboard view
            thirdLanguagePickerView = [[UIPickerView alloc] init];
            [thirdLanguagePickerView sizeToFit];
            thirdLanguagePickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
            thirdLanguagePickerView.delegate = self;
            thirdLanguagePickerView.dataSource = self;
            thirdLanguagePickerView.showsSelectionIndicator = YES;

            self.thirdLanguage.inputView = thirdLanguagePickerView;

            // Plug the keyboardDoneButtonView into the text field
            self.thirdLanguage.inputAccessoryView = keyboardDoneButtonView;
    }//eom


    //process the data after the user click done on the uipicker
    //   and resign being the first reponsder
    - (void)doneClicked:(id)sender
    {
        [self.state resignFirstResponder];
        [self.nativeLanguage resignFirstResponder];
        [self.secondLanguage resignFirstResponder];
        [self.thirdLanguage resignFirstResponder];
    }//eom

    //process the date selected after the user click cancel
    //   and resign being the first reponsder
    - (void)cancelClicked:(id)sender
    {
        [self.state resignFirstResponder];
        [self.nativeLanguage resignFirstResponder];
        [self.secondLanguage resignFirstResponder];
        [self.thirdLanguage resignFirstResponder];
    }//eom


    // returns the number of 'columns' to display.
    - (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
    {
        return 1;
    }

    // returns the # of rows in each component..
    - (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
    {
        //state options
        if(pickerView == statePickerView)
        {
           return [stateOptions count];
        }

        //languages
        return [languageOptions count];

    }//wom

    #pragma mark - UIPickerView Delegate
    - (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
    {
        return 30.0;
    }

    - (NSString *)pickerView:(UIPickerView *)pickerView
                 titleForRow:(NSInteger)row
                forComponent:(NSInteger)component
    {
        //language options
        if( ( pickerView == nativeLanguagePickerView) ||
           ( pickerView == secondLanguagePickerView) ||
           ( pickerView == thirdLanguagePickerView) )
        {
            return [languageOptions objectAtIndex:row];
        }

        //states
        return [stateOptions objectAtIndex:row];

    }//eom

    //If the user chooses from the pickerview, it calls this function;
    - (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
    {
        //state options
        if(pickerView == statePickerView)
        {
            //updating values
            state.text = [stateOptions objectAtIndex:row];
            stateSelected = [stateOptions objectAtIndex:row];

            //updating hidden label
            if(self.state.text.length == 0)
            {
                [self->stateLabel setHidden:YES];
            }
            else
            {
                [self->stateLabel setHidden:NO];
            }
        }
        //native language
        else if(pickerView == nativeLanguagePickerView)
        {
            //updating values
            nativeLanguage.text = [languageOptions objectAtIndex:row];
            nativeSelected = [languageOptions objectAtIndex:row];

            //updating hidden label
            if(self.nativeLanguage.text.length == 0)
            {
                [self->nativeLanguageLabel setHidden:YES];
            }
            else
            {
                [self->nativeLanguageLabel setHidden:NO];
            }
        }
        //second language
        else if(pickerView == secondLanguagePickerView)
        {
            //updating values
            secondLanguage.text = [languageOptions objectAtIndex:row];
            secondSelected = [languageOptions objectAtIndex:row];

            //updating hidden label
            if(self.secondLanguage.text.length == 0)
            {
                [self->secondLanguageLabel setHidden:YES];
            }
            else
            {
                [self->secondLanguageLabel setHidden:NO];
            }
        }
        //third language
        else if(pickerView == thirdLanguagePickerView)
        {
            //updating values
            thirdLanguage.text = [languageOptions objectAtIndex:row];
            thirdSelected = [languageOptions objectAtIndex:row];

            //updating hidden label
            if(self.thirdLanguage.text.length == 0)
            {
                [self->thirdLanguageLabel setHidden:YES];
            }
            else
            {
                [self->thirdLanguageLabel setHidden:NO];
            }
        }
    }//eom

#pragma mark - textfields  functions

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField {

            if(textField == self.address){
                [self.address resignFirstResponder];
                [self.city becomeFirstResponder];
            }
            else if(textField == self.city){
                [self.city resignFirstResponder];
                [self.zipcode becomeFirstResponder];
            }
            else if(textField == self.zipcode){
                [self.zipcode resignFirstResponder];
            }

            
            [self scrollViewAdaptToStartEditingTextField:textField];//moving scrollview
            
            return YES;
        }//eom


        /* uitextfield is about to be edit*/
        - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
        {
            [self scrollViewAdaptToStartEditingTextField:textField];
            return YES;
        }

    /* shows and hides the label above the textfield depending if the textfield is blank or filled */
    - (IBAction)textFieldValuesChanged:(UITextField *)sender {

        int labelID = (int)sender.tag;

        if(labelID == 1)//address
        {
            if(self.address.text.length == 0)
            {
                [self->addressLabel setHidden:YES];
            }
            else
            {
                [self->addressLabel setHidden:NO];
            }
        }
        else if(labelID == 2)//city
        {
            if(self.city.text.length == 0)
            {
                [self->cityLabel setHidden:YES];
            }
            else
            {
                [self->cityLabel setHidden:NO];
            }
        }
        else if(labelID == 3)//zipcode
        {
            if(self.zipcode.text.length == 0)
            {
                [self->zipcodeLabel setHidden:YES];
            }
            else
            {
                [self->zipcodeLabel setHidden:NO];
            }
        }
    }//eoa

#pragma mark - scrollview functions
        - (void) scrollViewAdaptToStartEditingTextField:(UITextField*)textField
        {
            CGPoint point = CGPointMake(0, textField.frame.origin.y - 3 * textField.frame.size.height);
            [scrollView setContentOffset:point animated:YES];
        }

        - (void) scrollVievEditingFinished:(UITextField*)textField
        {
            CGPoint point = CGPointMake(0, 0);
            [scrollView setContentOffset:point animated:YES];
        }



@end
