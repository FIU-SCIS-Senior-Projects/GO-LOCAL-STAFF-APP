////
////  StaffRegistration2ViewController.m
////  GoLocalApp
////
////  Created by Luis Andres Castillo Hernandez on 9/3/15.
////  Copyright (c) 2015 FIU. All rights reserved.
////
//
//#import "StaffRegistration2ViewController.h"
//#import "StaffRegistration3ViewController.h"
//#import "StaffRegistration4ViewController.h"
//#import "StaffRegistration5ViewController.h"
//#import "StaffRegistration6ViewController.h"
//#import "StaffRegistration7ViewController.h"
//
//@interface StaffRegistration2ViewController ()
//{
//    //arrays
//    NSArray *stateOptions;
//    NSArray *languageOptions;
//    
//    //pickers
//    UIPickerView * statePickerView;
//    UIPickerView * nativeLanguagePickerView;
//    UIPickerView * secondLanguagePickerView;
//    UIPickerView * thirdLanguagePickerView;
//    
//    //labels
//    __weak IBOutlet UILabel *cellphoneLabel;
//    __weak IBOutlet UILabel *addressLabel;
//    __weak IBOutlet UILabel *cityLabel;
//    __weak IBOutlet UILabel *zipcodeLabel;
//    __weak IBOutlet UILabel *stateLabel;
//    
//    __weak IBOutlet UILabel *nativeLanguageLabel;
//    __weak IBOutlet UILabel *secondLanguageLabel;
//    __weak IBOutlet UILabel *thirdLanguageLabel;
//}
//@end
//
//@implementation StaffRegistration2ViewController
//
//
//@synthesize cellphone, address, city, zipcode, state, stateSelected, nativeLanguage, secondLanguage, thirdLanguage, nativeSelected, secondSelected, thirdSelected, maleButton, femaleButton,
//            accountType, firstName, middleName, lastName, nickName, username, email, password, dateOfBirth;
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
////    [self testDataPassed];//testing
//
//}//eom
//
//-(void)viewDidAppear:(BOOL)animated
//{
//    [self createPickerForState];
//    [self createPickerForLanguages];
//    
//}//eom
//
//
//
///* verifying the below input fileds were filled:
// firstName, middleName, lastName, nickName, address, city, zipcode, states
// */
//- (BOOL)verifyDataEnter
//{
//    BOOL addressFilled     = false;
//    BOOL cityFilled        = false;
//    BOOL zipcodeFilled     = false;
//    BOOL statesFilled      = false;
//    
//    //checking for valid input
//    NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
//    
//    NSString * testing = self.address.text;
//        NSString *trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
//        if ([trimmedString isEqualToString:@""]) {
//            self.address.text =@""; //clearing field
//            // it's empty or contains only white spaces
//            [self showAlert:@"Registration Field" withMessage:@"Missing the Address field" and:@"Okay"];
//            return 0;
//        }
//    
//        testing = self.city.text;
//        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
//        if ([trimmedString isEqualToString:@""]) {
//            self.city.text =@""; //clearing field
//            // it's empty or contains only white spaces
//            [self showAlert:@"Registration Field" withMessage:@"Missing the City field" and:@"Okay"];
//            return 0;
//        }
//    
//    //checking for empty or not the same format
//    if(self.address.hasText){
//        addressFilled = true;
//    }
//    else {
//        [self showAlert:@"Registration Field" withMessage:@"Missing the Address field" and:@"Okay"];
//        return 0;
//    }
//    
//    if(self.city.hasText){
//        cityFilled = true;
//    }
//    else {
//        [self showAlert:@"Registration Field" withMessage:@"Missing the City field" and:@"Okay"];
//        return 0;
//    }
//    
//    if(self.zipcode.hasText){
//        zipcodeFilled = true;
//    }
//    else {
//        [self showAlert:@"Registration Field" withMessage:@"Missing the zipcode field" and:@"Okay"];
//        return 0;
//    }
//    
//    if(self.stateSelected.length != 0)
//    {
//        statesFilled = true;
//    }
//    else {
//        [self showAlert:@"Registration Field" withMessage:@"Missing state field" and:@"Okay"];
//        return 0;
//    }
//    
//    return 1;
//}//eom
//
///* */
//- (IBAction)submitForm:(id)sender {
//    bool result = [self verifyDataEnter];
//    if(result)
//    {
//        [self routeToProperController];
//    }
//    else
//    {
//        NSLog(@"missing some/all required fields");
//    }
//}//eom
//
///* preparing the data to sent to the next view controller */
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if([segue.identifier isEqualToString:@"toDj"]){
//        StaffRegistration3ViewController *controller = (StaffRegistration3ViewController *)segue.destinationViewController;
//        
//        //view controller 1 data
////        controller.accountType    = self.accountType;
//        controller.firstName    = self.firstName;
//        controller.middleName   = self.middleName;
//        controller.lastName     = self.lastName;
//        controller.nickName     = self.nickName;
//        controller.email        = self.email;
//        controller.password     = self.password;
////        controller.cellphone    = self.cellphone;
//        
//        //view controller 2 data
//        controller.address                  = self.address.text;
//        controller.city                     = self.city.text;
//        controller.zipcode                  = self.zipcode.text;
//        controller.stateSelected            = self.stateSelected;
//        
//
//    }
//    else if([segue.identifier isEqualToString:@"toLiveBand"]){
//        StaffRegistration4ViewController *controller = (StaffRegistration4ViewController *)segue.destinationViewController;
//        
//        //view controller 1 data
////        controller.accountType    = self.accountType;
//        controller.firstName    = self.firstName;
//        controller.middleName   = self.middleName;
//        controller.lastName     = self.lastName;
//        controller.nickName     = self.nickName;
//        controller.email        = self.email;
//        controller.password     = self.password;
////        controller.cellphone    = self.cellphone;
//        
//        //view controller 2 data
//        controller.address                  = self.address.text;
//        controller.city                     = self.city.text;
//        controller.zipcode                  = self.zipcode.text;
//        controller.stateSelected            = self.stateSelected;
// 
//    }
//    else     if([segue.identifier isEqualToString:@"toCateringCompany"]){
//        StaffRegistration5ViewController *controller = (StaffRegistration5ViewController *)segue.destinationViewController;
//        
//        //view controller 1 data
////        controller.accountType  = self.accountType;
//        controller.firstName    = self.firstName;
//        controller.middleName   = self.middleName;
//        controller.lastName     = self.lastName;
//        controller.nickName     = self.nickName;
//        controller.email        = self.email;
//        controller.password     = self.password;
////        controller.cellphone    = self.cellphone;
//        
//        //view controller 2 data
//        controller.address                  = self.address.text;
//        controller.city                     = self.city.text;
//        controller.zipcode                  = self.zipcode.text;
//        controller.stateSelected            = self.stateSelected;
//        
//
//
//    }
//    else if([segue.identifier isEqualToString:@"toOtherServices"]){
//        StaffRegistration6ViewController *controller = (StaffRegistration6ViewController *)segue.destinationViewController;
//        
//        //view controller 1 data
////        controller.accountType    = self.accountType;
//        controller.firstName    = self.firstName;
//        controller.middleName   = self.middleName;
//        controller.lastName     = self.lastName;
//        controller.nickName     = self.nickName;
//        controller.email        = self.email;
//        controller.password     = self.password;
////        controller.cellphone    = self.cellphone;
//        
//        //view controller 2 data
//        controller.address                  = self.address.text;
//        controller.city                     = self.city.text;
//        controller.zipcode                  = self.zipcode.text;
//        controller.stateSelected            = self.stateSelected;
//        
//
//    }
//
//    else if([segue.identifier isEqualToString:@"staffRegistration7"]){
//        StaffRegistration7ViewController *controller = (StaffRegistration7ViewController *)segue.destinationViewController;
//        
//        //view controller 1 data
////        controller.accountType    = self.accountType;
//        controller.firstName    = self.firstName;
//        controller.middleName   = self.middleName;
//        controller.lastName     = self.lastName;
//        controller.nickName     = self.nickName;
//        controller.email        = self.email;
//        controller.password     = self.password;
////        controller.cellphone    = self.cellphone;
//        
//        //view controller 2 data
//        controller.address                  = self.address.text;
//        controller.city                     = self.city.text;
//        controller.zipcode                  = self.zipcode.text;
//        controller.stateSelected            = self.stateSelected;
//        
// 
//    }
//}//eom
//
///* route to proper controllers */
//-(void) routeToProperController
//{
////    if(self.djSelected){
////        [self performSegueWithIdentifier:@"toDj" sender:self];
////    }
////    else if(self.liveBandSelected){
////        [self performSegueWithIdentifier:@"toLiveBand" sender:self];
////    }
////    else if(self.cateringCompanySelected){
////        [self performSegueWithIdentifier:@"toCateringCompany" sender:self];
////    }
////    else if(self.otherServicesSelected){
////        [self performSegueWithIdentifier:@"toOtherServices" sender:self];
////    }
////    else{
////        //moving to the next controller
////        [self performSegueWithIdentifier:@"staffRegistration7" sender:self];
////    }
//    
//}//eom
//
///* create UIAlert*/
//-(void) showAlert:(NSString*)title withMessage:(NSString*)message and:(NSString*) cancelTitle
//{
//    
//    //creating UIAlert
//    UIAlertView * alert =[[UIAlertView alloc] initWithTitle:title
//                                                    message:message
//                                                   delegate:self
//                                          cancelButtonTitle:cancelTitle
//                                          otherButtonTitles: nil];
//    [alert show];//display alert
//}//eom
//
///****** UIPicker Methods ********/
//
//    /* creates the picker for state selection*/
//    -(void) createPickerForState
//    {
//        //setting up UIpicker for states selection
//        stateOptions = [[NSArray alloc] initWithObjects:@"",@"AL", @"AK", @"AZ", @"AR", @"CA", @"CO", @"CT", @"DE", @"FL",@"GA", @"HI", @"ID", @"IL", @"IN", @"IA", @"KS", @"KY", @"LA", @"ME", @"MD", @"MA", @"MI", @"MN", @"MS", @"MO", @"MT", @"NE", @"NV", @"NH", @"NJ", @"NM", @"NY", @"NC", @"ND", @"OH", @"OK", @"PA", @"RI", @"SC", @"SD", @"TN", @"TX", @"UT", @"VT", @"VA", @"WA", @"WV", @"WI", @"WY", nil];
//        
//        // create a UIPicker view as a custom keyboard view
//        statePickerView = [[UIPickerView alloc] init];
//        [statePickerView sizeToFit];
//        statePickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
//        statePickerView.delegate = self;
//        statePickerView.dataSource = self;
//        statePickerView.showsSelectionIndicator = YES;
//        
//        //updating k
//        self.state.inputView = statePickerView;
//        
//        // creating toolbar for 'Cancel' and 'Done' actions
//        UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
//        keyboardDoneButtonView.barStyle = UIBarStyleBlack;
//        keyboardDoneButtonView.translucent = YES;
//        keyboardDoneButtonView.tintColor = nil;
//        [keyboardDoneButtonView sizeToFit];
//        
//        //creating empty UIBarItem to force first item to the right
//        UIBarButtonItem* empty1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
//        
//        //creating 'Done' UIBarItem to be the exit point for the picker
//        UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
//                                                                         style:UIBarButtonItemStyleBordered
//                                                                        target:self
//                                                                        action:@selector(cancelClicked:)];
//        
//        //creating 'Done' UIBarItem to be the exit point for the picker
//        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
//                                                                       style:UIBarButtonItemStyleBordered target:self
//                                                                      action:@selector(doneClicked:)] ;
//        //adding UIBarItems to the Keyboard/Picker
//        [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty1, cancelButton, doneButton, nil]];
//        
//        
//        // Plug the keyboardDoneButtonView into the text field...
//        self.state.inputAccessoryView = keyboardDoneButtonView;
//        
//    }//eom
//
//    /* creates the picker for 1st 2nd 3rd language selection */
//    -(void) createPickerForLanguages
//    {
//        //setting up UIpicker for states selection
//        languageOptions = [[NSArray alloc] initWithObjects:@"",@"English",@"Spanish",@"Arabic",@"French", @"German", @"Italian",@"Japanese", @"Mandarin", @"Portuguese", @"Russian",nil];
//        
//        // creating toolbar for 'Cancel' and 'Done' actions
//        UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
//        keyboardDoneButtonView.barStyle = UIBarStyleBlack;
//        keyboardDoneButtonView.translucent = YES;
//        keyboardDoneButtonView.tintColor = nil;
//        [keyboardDoneButtonView sizeToFit];
//        
//        //creating empty UIBarItem to force first item to the right
//        UIBarButtonItem* empty = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
//        
//        //creating 'Done' UIBarItem to be the exit point for the picker
//        UIBarButtonItem* cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
//                                                                          style:UIBarButtonItemStyleBordered
//                                                                         target:self
//                                                                         action:@selector(cancelClicked:)];
//        
//        //creating 'Done' UIBarItem to be the exit point for the picker
//        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
//                                                                        style:UIBarButtonItemStyleBordered target:self
//                                                                        action:@selector(doneClicked:)] ;
//        
//   
//        //adding UIBarItems to the Keyboard/Picker
//        [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty, cancelButton, doneButton, nil]];
//        
//        /* native language */
//            // create a UIPicker view as a custom keyboard view
//            nativeLanguagePickerView = [[UIPickerView alloc] init];
//            [nativeLanguagePickerView sizeToFit];
//            nativeLanguagePickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
//            nativeLanguagePickerView.delegate = self;
//            nativeLanguagePickerView.dataSource = self;
//            nativeLanguagePickerView.showsSelectionIndicator = YES;
//            
//            self.nativeLanguage.inputView = nativeLanguagePickerView;
//            
//            // Plug the keyboardDoneButtonView into the text field
//            self.nativeLanguage.inputAccessoryView = keyboardDoneButtonView;
//        
//        /* second language */
//            // create a UIPicker view as a custom keyboard view
//            secondLanguagePickerView = [[UIPickerView alloc] init];
//            [secondLanguagePickerView sizeToFit];
//            secondLanguagePickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
//            secondLanguagePickerView.delegate = self;
//            secondLanguagePickerView.dataSource = self;
//            secondLanguagePickerView.showsSelectionIndicator = YES;
//            
//            self.secondLanguage.inputView = secondLanguagePickerView;
//        
//            // Plug the keyboardDoneButtonView into the text field
//            self.secondLanguage.inputAccessoryView = keyboardDoneButtonView;
//    
//        /* third language */
//            // create a UIPicker view as a custom keyboard view
//            thirdLanguagePickerView = [[UIPickerView alloc] init];
//            [thirdLanguagePickerView sizeToFit];
//            thirdLanguagePickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
//            thirdLanguagePickerView.delegate = self;
//            thirdLanguagePickerView.dataSource = self;
//            thirdLanguagePickerView.showsSelectionIndicator = YES;
//            
//            self.thirdLanguage.inputView = thirdLanguagePickerView;
//        
//            // Plug the keyboardDoneButtonView into the text field
//            self.thirdLanguage.inputAccessoryView = keyboardDoneButtonView;
//    }//eom
//
//
//    //process the data after the user click done on the uipicker
//    //   and resign being the first reponsder
//    - (void)doneClicked:(id)sender
//    {
//        [self.state resignFirstResponder];
//        [self.nativeLanguage resignFirstResponder];
//        [self.secondLanguage resignFirstResponder];
//        [self.thirdLanguage resignFirstResponder];
//    }//eom
//
//    //process the date selected after the user click cancel
//    //   and resign being the first reponsder
//    - (void)cancelClicked:(id)sender
//    {
//        [self.state resignFirstResponder];
//        [self.nativeLanguage resignFirstResponder];
//        [self.secondLanguage resignFirstResponder];
//        [self.thirdLanguage resignFirstResponder];
//    }//eom
//
//
//    // returns the number of 'columns' to display.
//    - (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
//    {
//        return 1;
//    }
//
//    // returns the # of rows in each component..
//    - (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
//    {
//        //state options
//        if(pickerView == statePickerView)
//        {
//           return [stateOptions count];
//        }
//        
//        //languages
//        return [languageOptions count];
//        
//    }//wom
//
//    #pragma mark - UIPickerView Delegate
//    - (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
//    {
//        return 30.0;
//    }
//
//    - (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//    {
//        //language options
//        if( ( pickerView == nativeLanguagePickerView) ||
//           ( pickerView == secondLanguagePickerView) ||
//           ( pickerView == thirdLanguagePickerView) )
//        {
//            return [languageOptions objectAtIndex:row];
//        }
//        
//        //states
//        return [stateOptions objectAtIndex:row];
//        
//    }//eom
//
//    //If the user chooses from the pickerview, it calls this function;
//    - (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
//    {
//        //state options
//        if(pickerView == statePickerView)
//        {
//            //updating values
//            state.text = [stateOptions objectAtIndex:row];
//            stateSelected = [stateOptions objectAtIndex:row];
//            
//            //updating hidden label
//            if(self.state.text.length == 0)
//            {
//                [self->stateLabel setHidden:YES];
//            }
//            else
//            {
//                [self->stateLabel setHidden:NO];
//            }
//        }
//        //native language
//        else if(pickerView == nativeLanguagePickerView)
//        {
//            //updating values
//            nativeLanguage.text = [languageOptions objectAtIndex:row];
//            nativeSelected = [languageOptions objectAtIndex:row];
//
//            //updating hidden label
//            if(self.nativeLanguage.text.length == 0)
//            {
//                [self->nativeLanguageLabel setHidden:YES];
//            }
//            else
//            {
//                [self->nativeLanguageLabel setHidden:NO];
//            }
//        }
//        //second language
//        else if(pickerView == secondLanguagePickerView)
//        {
//            //updating values
//            secondLanguage.text = [languageOptions objectAtIndex:row];
//            secondSelected = [languageOptions objectAtIndex:row];
//            
//            //updating hidden label
//            if(self.secondLanguage.text.length == 0)
//            {
//                [self->secondLanguageLabel setHidden:YES];
//            }
//            else
//            {
//                [self->secondLanguageLabel setHidden:NO];
//            }
//        }
//        //third language
//        else if(pickerView == thirdLanguagePickerView)
//        {
//            //updating values
//            thirdLanguage.text = [languageOptions objectAtIndex:row];
//            thirdSelected = [languageOptions objectAtIndex:row];
//            
//            //updating hidden label
//            if(self.thirdLanguage.text.length == 0)
//            {
//                [self->thirdLanguageLabel setHidden:YES];
//            }
//            else
//            {
//                [self->thirdLanguageLabel setHidden:NO];
//            }
//        }
//    }//eom
//
//
///******** textfields  functions********/
//
//        /* dimmisses UITextField as soon the background is touched */
//        -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//        {
//            [cellphone resignFirstResponder];
//            [address resignFirstResponder];
//            [city resignFirstResponder];
//            [zipcode resignFirstResponder];
//        }//eom
//
//        /* dimisses UITextField as soon the return key is pressed */
//        -(BOOL)textFieldShouldReturn:(UITextField *)textField {
//            
//            if(textField == self.cellphone){
//                [self.cellphone resignFirstResponder];
//                [self.address becomeFirstResponder];
//            }
//            else if(textField == self.address){
//                [self.address resignFirstResponder];
//                [self.city becomeFirstResponder];
//            }
//            else if(textField == self.city){
//                [self.city resignFirstResponder];
//                [self.zipcode becomeFirstResponder];
//            }
//            else if(textField == self.zipcode){
//                [self.zipcode resignFirstResponder];
//            }
//            
//            return YES;
//        }//eom
//
//    /* shows and hides the label above the textfield depending if the textfield is blank or filled */
//    - (IBAction)textFieldValuesChanged:(UITextField *)sender {
//        
//        int labelID = (int)sender.tag;
//        
//        if(labelID == 0)//cellphone
//        {
//            if(self.cellphone.text.length == 0)
//            {
//                [self->cellphoneLabel setHidden:YES];
//            }
//            else
//            {
//                [self->cellphoneLabel setHidden:NO];
//            }
//        }
//        else if(labelID == 1)//address
//        {
//            if(self.address.text.length == 0)
//            {
//                [self->addressLabel setHidden:YES];
//            }
//            else
//            {
//                [self->addressLabel setHidden:NO];
//            }
//        }
//        else if(labelID == 2)//city
//        {
//            if(self.city.text.length == 0)
//            {
//                [self->cityLabel setHidden:YES];
//            }
//            else
//            {
//                [self->cityLabel setHidden:NO];
//            }
//        }
//        else if(labelID == 3)//zipcode
//        {
//            if(self.zipcode.text.length == 0)
//            {
//                [self->zipcodeLabel setHidden:YES];
//            }
//            else
//            {
//                [self->zipcodeLabel setHidden:NO];
//            }
//        }
//    }//eoa
//
//
//
//-(void)testDataPassed
//{
//    
//    NSLog(@" ");
//    NSLog(@" ");
//    NSLog(@" *****  Staff Registration| View controller #2 ******");
//    //view controller 1
//    NSLog(@" account type:    %@", self.accountType);
//    NSLog(@" firstName:       %@", self.firstName);
//    NSLog(@" middleName:      %@", self.middleName);
//    NSLog(@" lastName:        %@", self.lastName);
//    NSLog(@" nickName:        %@", self.nickName);
//    NSLog(@" email:           %@", self.email);
//    NSLog(@" password:        %@", self.password);
//    NSLog(@" dob:             %@", self.dateOfBirth);
//    
//    NSLog(@" - - - - - - - - - - - - - ");
//}//eom
//
//
//
//- (IBAction)genderValueChanged:(id)sender {
//}
//@end
