//
//  StaffRegistration7ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration8ViewController.h"
#import "StaffRegistration9ViewController.h"
#import "StaffRegistration10ViewController.h"


#import "RegisteredStaff.h" //needed for staff registration

@interface StaffRegistration8ViewController ()
{
    BOOL male;
    NSString * ethinicityCode;
    
    //updating values
    NSString * heightFeet;      //temp
    NSString * heightInches;    //temp
    BOOL hasDriverLicense;
    BOOL hasCommercialLicense;
    BOOL hasTattos;
    BOOL hasPiercings;
    
    //arrays
    NSArray *ethnicityOptions;
    NSArray *heightFeetOptions;
    NSArray *heightInchesOptions;
    NSArray *hairColorOptions;
    NSArray *eyeColorOptions;
    NSArray *pantSizeOptions;
    NSArray *tshirtSizeOptions;
    
    //pickers
    UIPickerView * ethnicityickerView;
    UIPickerView * heightPickerView;
    UIPickerView * hairColorPickerView;
    UIPickerView * eyeColorPickerView;
    UIPickerView * pantSizePickerView;
    UIPickerView * tshirtSizePickerView;
    
    //labels
    __weak IBOutlet UILabel *ethnicityLabel;
    __weak IBOutlet UILabel *heightLabel;
    __weak IBOutlet UILabel *weightLabel;
    __weak IBOutlet UILabel *hairColorLabel;
    __weak IBOutlet UILabel *eyeColorLabel;
    __weak IBOutlet UILabel *pantSizeLabel;
    __weak IBOutlet UILabel *shoeSizeLabel;
    __weak IBOutlet UILabel *tshirtSizeLabel;
}
@end

@implementation StaffRegistration8ViewController

@synthesize scrollView, registeredStaff,
    validDriverLicenseSwitch, validCommercialDriverLicenseSwitch, hasTattoosSwitch, hasPiercingsSwitch, ethnicityTextField, heightTextField, weightTextField, hairColorTextField, eyeColorTextField, pantSizeTextField, shoeSizeTextField, tshirtSizeTextField;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}//eom

-(void)viewDidAppear:(BOOL)animated
{
    self->male = [registeredStaff isMale];
    
    [self setUpTapGesture];
    [self createEthnicityPicker];
    [self createHairColorPicker];
    [self createEyeColorPicker];
    [self createPantSizePicker];
    [self createTshirtSizePicker];
    [self createHeightPicker];
    
//    [registeredStaff printUserData];//testing
}//eom


#pragma mark - verify data

    /* verifying the required input fileds */
    - (BOOL)verifyDataEnter
    {
        //driver license
        if(self.validDriverLicenseSwitch.on)
        {
            self->hasDriverLicense = YES;
        }
        else
        {
            self->hasDriverLicense = NO;
        }
        
        //commercial license
        if(self.validCommercialDriverLicenseSwitch.on)
        {
            self->hasCommercialLicense = YES;
        }
        else
        {
            self->hasDriverLicense = NO;
        }
        
        //tattoos
        if(self.hasTattoosSwitch.on)
        {
            self->hasTattos = YES;
        }
        else
        {
            self->hasTattos = NO;
        }
        
        
        //piercings
        if(self.hasPiercingsSwitch.on)
        {
            self->hasPiercings = YES;
        }
        else
        {
            self->hasPiercings = NO;
        }
        
        //checking for valid input
        NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
        NSString * testing;
        NSString *trimmedString;

        //ethnicity
        testing = self.ethnicityTextField.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:self.ethnicityTextField]; //take scroll to textfield so user can see their error
            self.ethnicityTextField.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please select your ethnicity" and:@"Okay"];
            return 0;
        }
        
        //height
        testing = self.heightTextField.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:self.heightTextField]; //take scroll to textfield so user can see their error
            self.heightTextField.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter your height" and:@"Okay"];
            return 0;
        }
        
        //weight
        testing = self.weightTextField.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:self.weightTextField]; //take scroll to textfield so user can see their error
            self.weightTextField.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter your weight" and:@"Okay"];
            return 0;
        }
        else if( (self.weightTextField.text.length > 3) || (self.weightTextField.text.length < 2) )
        {
            [self showAlert:@"Registration Field" withMessage:@"Please enter your weight" and:@"Okay"];
            return 0;
        }
        
        //hair color
        testing = self.hairColorTextField.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:self.hairColorTextField]; //take scroll to textfield so user can see their error
            self.hairColorTextField.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please select your hair color" and:@"Okay"];
            return 0;
        }
        
        //eye color
        testing = self.eyeColorTextField.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:self.eyeColorTextField]; //take scroll to textfield so user can see their error
            self.eyeColorTextField.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please select your eye color" and:@"Okay"];
            return 0;
        }

        //pant size
        testing = self.pantSizeTextField.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:self.pantSizeTextField]; //take scroll to textfield so user can see their error
            self.pantSizeTextField.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter your pant size" and:@"Okay"];
            return 0;
        }
        
        //shoe size
        testing = self.shoeSizeTextField.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:self.shoeSizeTextField]; //take scroll to textfield so user can see their error
            self.shoeSizeTextField.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter your shoe size" and:@"Okay"];
            return 0;
        }
        else if( (self.shoeSizeTextField.text.length > 3))
        {
            [self showAlert:@"Registration Field" withMessage:@"Please enter your shoe size" and:@"Okay"];
            return 0;
        }
        
        //tshirt size
        testing = self.tshirtSizeTextField.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:self.tshirtSizeTextField]; //take scroll to textfield so user can see their error
            self.tshirtSizeTextField.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter your tshirt size" and:@"Okay"];
            return 0;
        }
        
        //updating values
        [registeredStaff setLicenseInfo:self->hasDriverLicense hasCommercialLicense:self->hasCommercialLicense];
        [registeredStaff setTattoos:self->hasTattos];
        [registeredStaff setPiercings:self->hasPiercings];
        [registeredStaff setEthnicity:self.ethnicityTextField.text withCode:self->ethinicityCode];
        [registeredStaff setHeight:self.heightTextField.text];
        [registeredStaff setWeight:self.weightTextField.text];
        [registeredStaff setHairColor:self.hairColorTextField.text];
        [registeredStaff setEyeColor:self.eyeColorTextField.text];
        [registeredStaff setPantSize:self.pantSizeTextField.text];
        [registeredStaff setShoeSize:self.shoeSizeTextField.text];
        [registeredStaff setTshirtSize:self.tshirtSizeTextField.text];
        
        return 1;
    }//eom



#pragma mark - sending data
    /* submmitting form */
    - (IBAction)submitForm:(id)sender
    {
            //verifying the data enter
            bool result = [self verifyDataEnter];
            if(result)
            {
                //    moving to the next controller
                [self routeToProperController];
            }
            else
            {
                NSLog(@"missing some/all required fields staffRegistration8");
            }
    }//eom



    /* route to proper controllers */
    -(void) routeToProperController
    {
        if(self->male) //males are skipping females question
        {
            [self performSegueWithIdentifier:@"goToStaffRegister10" sender:self];
        }
        else
        {
            [self performSegueWithIdentifier:@"goToStaffRegister9" sender:self];//females only
        }

    }//eom

    /* preparing the data to sent to the next view controller */
    -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        if([segue.identifier isEqualToString:@"goToStaffRegister9"]){
            StaffRegistration9ViewController *controller = (StaffRegistration9ViewController *)segue.destinationViewController;
            controller.registeredStaff = registeredStaff;
            
        }
        else if([segue.identifier isEqualToString:@"goToStaffRegister10"]){
            StaffRegistration10ViewController *controller = (StaffRegistration10ViewController *)segue.destinationViewController;

             controller.registeredStaff = registeredStaff;
        }
    }//eom


#pragma mark - helper methods
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


        /* creates the picker for Ethnicity selection*/
        -(void) createEthnicityPicker
        {
                //setting up options for UIpicker
                ethnicityOptions = [[NSArray alloc] initWithObjects:@"",
                                                                    @"Non-Hispanic White or Euro-American",
                                                                    @"Black, Afro-Caribbean, or African American",
                                                                    @"Latino or Hispanic American",
                                                                    @"East Asian or Asian American",
                                                                    @"South Asian or Indian American",
                                                                    @"Middle Eastern or Arab American",
                                                                    @"Native American or Alaskan Native",
                                                                    @"Other",
                                                                    nil];
            
            // create a UIPicker view as a custom keyboard view
            ethnicityickerView = [[UIPickerView alloc] init];
            [ethnicityickerView sizeToFit];
            ethnicityickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
            ethnicityickerView.delegate = self;
            ethnicityickerView.dataSource = self;
            ethnicityickerView.showsSelectionIndicator = YES;
            
            //updating k
            self.ethnicityTextField.inputView = ethnicityickerView;
            
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
            self.ethnicityTextField.inputAccessoryView = keyboardDoneButtonView;
            
        }//eom

        /* creates the picker for hair color selection*/
        -(void) createHairColorPicker
        {
            //setting up options for UIpicker
            hairColorOptions = [[NSArray alloc]
                                initWithObjects:@"",
                                                @"Auburn",
                                                @"Black",
                                                @"Blonde",
                                                @"Brown",
                                                @"Grey",
                                                @"Red",
                                                @"White",
                                                @"Other",
                                                nil];
            
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
        -(void) createEyeColorPicker
        {
            //setting up options for UIpicker
            eyeColorOptions = [[NSArray alloc]
                                initWithObjects:@"",
                                @"Amber",
                                @"Blue",
                                @"Brown",
                                @"Gray",
                                @"Green",
                                @"Hazel",
                                @"Other",
                                nil];
            
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

        /* creates the picker for pant size selection*/
        -(void) createPantSizePicker
        {
            
            if(self->male)//males sizes
            {
                //setting up options for UIpicker
                pantSizeOptions = [[NSArray alloc]
                                   initWithObjects:@"",
                                                   @"28",
                                                   @"30",
                                                   @"32",
                                                   @"34",
                                                   @"36",
                                                   @"38",
                                                   @"40+",
                                                   nil];
            }
            else //females sizes
            {
                //setting up options for UIpicker
                pantSizeOptions = [[NSArray alloc]
                                   initWithObjects:@"",
                                                   @"0",
                                                   @"2",
                                                   @"4",
                                                   @"6",
                                                   @"8",
                                                   @"10",
                                                   @"12",
                                                   @"14+",
                                                   nil];
            }
            
            
            // create a UIPicker view as a custom keyboard view
            pantSizePickerView = [[UIPickerView alloc] init];
            [pantSizePickerView sizeToFit];
            pantSizePickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
            pantSizePickerView.delegate = self;
            pantSizePickerView.dataSource = self;
            pantSizePickerView.showsSelectionIndicator = YES;
            
            //updating
            self.pantSizeTextField.inputView = pantSizePickerView;
            
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
                                                                          action:@selector(doneClicked:)];
            //adding UIBarItems to the Keyboard/Picker
            [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty, cancelButton, doneButton, nil]];
            
            
            // Plug the keyboardDoneButtonView into the text field.
            self.pantSizeTextField.inputAccessoryView = keyboardDoneButtonView;
            
        }//eom

        /* creates the picker for tshirt size selection*/
        -(void) createTshirtSizePicker
        {
            //setting up options for UIpicker
            tshirtSizeOptions = [[NSArray alloc]initWithObjects:@"",
                                                               @"2XS",
                                                               @"XS",
                                                               @"S",
                                                               @"M",
                                                               @"L",
                                                               @"XL",
                                                               @"2XL",
                                                               @"3XL+",
                                                               nil];
            
            // create a UIPicker view as a custom keyboard view
            tshirtSizePickerView = [[UIPickerView alloc] init];
            [tshirtSizePickerView sizeToFit];
            tshirtSizePickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
            tshirtSizePickerView.delegate = self;
            tshirtSizePickerView.dataSource = self;
            tshirtSizePickerView.showsSelectionIndicator = YES;
            
            //updating k
            self.tshirtSizeTextField.inputView = tshirtSizePickerView;
            
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
            self.tshirtSizeTextField.inputAccessoryView = keyboardDoneButtonView;
            
        }//eom

        /* creates the picker for height selection*/
        -(void) createHeightPicker
        {
            //setting up options for UIpicker
            heightFeetOptions = [[NSArray alloc]initWithObjects:@"",
                                                             @"2'",
                                                             @"3'",
                                                             @"4'",
                                                             @"5'",
                                                             @"6'",
                                                             @"7'",
                                                             nil];

            //setting up options for UIpicker
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

        //process the data after the user click done on the uipicker
        //   and resign being the first reponsder
        - (void)doneClicked:(id)sender
        {
            [self.ethnicityTextField resignFirstResponder];
            [self.heightTextField resignFirstResponder];
            [self.hairColorTextField resignFirstResponder];
            [self.eyeColorTextField resignFirstResponder];
            [self.pantSizeTextField resignFirstResponder];
            [self.tshirtSizeTextField resignFirstResponder];

        }//eom

        //process the date selected after the user click cancel
        //   and resign being the first reponsder
        - (void)cancelClicked:(id)sender
        {
            [self.ethnicityTextField resignFirstResponder];
            [self.heightTextField resignFirstResponder];
            [self.hairColorTextField resignFirstResponder];
            [self.eyeColorTextField resignFirstResponder];
            [self.pantSizeTextField resignFirstResponder];
            [self.tshirtSizeTextField resignFirstResponder];
            
        }//eom


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
            //hair color
            if(pickerView == hairColorPickerView)
            {
                return [hairColorOptions count];
            }
            else if(pickerView == eyeColorPickerView)
            {
                return [eyeColorOptions count];
            }
            else if(pickerView == pantSizePickerView)
            {
                return [pantSizeOptions count];
            }
            else if(pickerView == tshirtSizePickerView)
            {
                return [tshirtSizeOptions count];
            }
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

            //ethnicity
            return [ethnicityOptions count];
            
        }//wom

#pragma mark - UIPickerView Delegate
        - (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
        {
            return 30.0;
        }

        - (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
        {
            if(pickerView == hairColorPickerView)
            {
             return [hairColorOptions objectAtIndex:row];
            }
            else if(pickerView == eyeColorPickerView)
            {
                 return [eyeColorOptions objectAtIndex:row];
            }
            else if(pickerView == pantSizePickerView)
            {
                 return [pantSizeOptions objectAtIndex:row];
            }
            else if(pickerView == tshirtSizePickerView)
            {
                 return [tshirtSizeOptions objectAtIndex:row];
            }
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
            
            //ethnicity
            return [ethnicityOptions objectAtIndex:row];
        }//eom

        //If the user chooses from the pickerview, it calls this function;
        - (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
        {
            //ethnicity options
            if(pickerView == ethnicityickerView)
            {
                //updating values
                self->ethnicityTextField.text = [ethnicityOptions objectAtIndex:row];
                self->ethinicityCode = [NSString stringWithFormat:@"%ld",(long)row];
                
                //updating hidden label
                if(self.ethnicityTextField.text.length == 0)
                {
                    [self->ethnicityLabel setHidden:YES];
                }
                else
                {
                    [self->ethnicityLabel setHidden:NO];
                }
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
                
                self.heightTextField.text = [heightFeet stringByAppendingFormat:@"%@",heightInches];
                
                //updating hidden label
                if(self.heightTextField.text.length == 0)
                {
                    [self->heightLabel setHidden:YES];
                }
                else
                {
                    [self->heightLabel setHidden:NO];
                }
            }
            //hair color
            else if(pickerView == hairColorPickerView)
            {
                //updating values
                self.hairColorTextField.text = [hairColorOptions objectAtIndex:row];
                
                //updating hidden label
                if(self.hairColorTextField.text.length == 0)
                {
                    [self->hairColorLabel setHidden:YES];
                }
                else
                {
                    [self->hairColorLabel setHidden:NO];
                }
            }
            //eye color
            else if(pickerView == eyeColorPickerView)
            {
                //updating values
                self.eyeColorTextField.text = [eyeColorOptions objectAtIndex:row];
                
                //updating hidden label
                if(self.eyeColorTextField.text.length == 0)
                {
                    [self->eyeColorLabel setHidden:YES];
                }
                else
                {
                    [self->eyeColorLabel setHidden:NO];
                }
            }
            //pant language
            else if(pickerView == pantSizePickerView)
            {
                //updating values
                self.pantSizeTextField.text = [pantSizeOptions objectAtIndex:row];

                //updating hidden label
                if(self.pantSizeTextField.text.length == 0)
                {
                    [self->pantSizeLabel setHidden:YES];
                }
                else
                {
                    [self->pantSizeLabel setHidden:NO];
                }
            }
                //third language
                else if(pickerView == tshirtSizePickerView)
                {
                    //updating values
                    self.tshirtSizeTextField.text = [tshirtSizeOptions objectAtIndex:row];
            
                    //updating hidden label
                    if(self.tshirtSizeTextField.text.length == 0)
                    {
                        [self->tshirtSizeLabel setHidden:YES];
                    }
                    else
                    {
                        [self->tshirtSizeLabel setHidden:NO];
                    }
                }
        }//eom

#pragma mark - textfields  functions

    /* shows/hides textfield depending if they are filled or empty*/
    - (IBAction)textFieldValueChanged:(id)sender {
        //updating hidden label
        if(self.shoeSizeTextField.text.length == 0)
        {
            [self->shoeSizeLabel setHidden:YES];
        }
        else
        {
            [self->shoeSizeLabel setHidden:NO];
        }
        
        //weight
        if(self.weightTextField.text.length == 0)
        {
            [self->weightLabel setHidden:YES];
        }
        else
        {
            [self->weightLabel setHidden:NO];
        }
        
    }//eom

    /* dimisses UITextField as soon the return key is pressed */
    -(BOOL)textFieldShouldReturn:(UITextField *)textField {
        
        if(textField == self.ethnicityTextField){
            [self.ethnicityTextField resignFirstResponder];
        }
        else if(textField == self.heightTextField){
            [self.heightTextField resignFirstResponder];
            [self.weightTextField becomeFirstResponder];
        }
        else if(textField == self.weightTextField){
            [self.weightTextField resignFirstResponder];
            [self.shoeSizeTextField becomeFirstResponder];
        }
        else if(textField == self.shoeSizeTextField){
            [self.shoeSizeTextField resignFirstResponder];
            [self.hairColorTextField becomeFirstResponder];
        }
        else if(textField == self.hairColorTextField){
            [self.hairColorTextField resignFirstResponder];
            [self.eyeColorTextField becomeFirstResponder];
        }
        else if(textField == self.eyeColorTextField){
            [self.eyeColorTextField resignFirstResponder];
            [self.tshirtSizeTextField becomeFirstResponder];
        }
        else if(textField == self.tshirtSizeTextField){
            [self.tshirtSizeTextField resignFirstResponder];
        }
        
        return YES;
    }//eom

        /* uitextfield is about to be edit*/
        - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
        {
            [self scrollViewAdaptToStartEditingTextField:textField];
            return YES;
        }



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
