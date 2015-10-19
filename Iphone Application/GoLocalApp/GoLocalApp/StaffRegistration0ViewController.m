//
//  StaffRegistrationViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/1/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration0ViewController.h"
#import "StaffRegistration1ViewController.h"


#import "RegisteredStaff.h" //needed this to use the registration model

@interface StaffRegistration0ViewController ()
{
    RegisteredStaff *registeredStaff;
    UIDatePicker * dobPickerView;
    
    __weak IBOutlet UILabel *firstNameLabel;
    __weak IBOutlet UILabel *MiddleNameLabel;
    __weak IBOutlet UILabel *LastNameLabel;
    __weak IBOutlet UILabel *UsernameLabel;
    __weak IBOutlet UILabel *NicknameLabel;
    __weak IBOutlet UILabel *EmailLabel;
    __weak IBOutlet UILabel *ConfirmEmailLabel;
    __weak IBOutlet UILabel *PasswordLabel;
    __weak IBOutlet UILabel *ConfirmPasswordLabel;
    __weak IBOutlet UILabel *DateOfBirthLabel;
}

@end

@implementation StaffRegistration0ViewController


@synthesize firstName, middleName, lastName, nickName, username, email, confirmEmail, password, confirmPassword, dateOfBirth, dateOfBirthSelected, scrollView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
}//eom


-(void)viewDidAppear:(BOOL)animated
{
    registeredStaff = [[RegisteredStaff alloc]init];
    
    [self setUpTapGesture];
    
    [self createDatePickerForDOB];
}//eom

#pragma mark - verify Data Enter
    /* verifying the required input fileds */
    - (BOOL)verifyDataEnter
    {
        BOOL emailFilled       = false;
        BOOL passwordFilled    = false;
        BOOL dateofBirthFilled = false;
        BOOL validEmailFormat  = false;
        
        //checking for valid input
        NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
        
            NSString * testing = firstName.text;
            NSString *trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                [self scrollVievEditingFinished:firstName]; //take scroll to textfield so user can see their error
                firstName.text =@""; //clearing field
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Please enter your first name" and:@"Okay"];
                return 0;
            }
            
            testing = middleName.text; //not required
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                middleName.text =@""; //clearing field
            }
            else if( self.middleName.text.length > 1)
            {
                [self showAlert:@"Registration Field" withMessage:@"Please enter only your middle initial" and:@"Okay"];
                return 0;
            }
        
            testing = lastName.text;
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                [self scrollVievEditingFinished:lastName]; //take scroll to textfield so user can see their error
                lastName.text =@""; //clearing field
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Please enter your  last name" and:@"Okay"];
                return 0;
            }
        
            testing = username.text; 
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                [self scrollVievEditingFinished:username]; //take scroll to textfield so user can see their error
                username.text =@""; //clearing field
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Please enter your desired username" and:@"Okay"];
                return 0;
            }
        
            testing = nickName.text; //not required
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                nickName.text =@""; //clearing field
            }
        
            testing = email.text;
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                [self scrollVievEditingFinished:email]; //take scroll to textfield so user can see their error
                email.text =@""; //clearing field
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Please enter your email" and:@"Okay"];
                return 0;
            }

            testing = password.text;
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                [self scrollVievEditingFinished:password]; //take scroll to textfield so user can see their error
                password.text =@""; //clearing field
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Please enter your desired password" and:@"Okay"];
                return 0;
            }

        

         /* checking email are the same */
            if( [email.text isEqualToString: confirmEmail.text])
            {
                emailFilled = true;
                
                /*making sure email has the correct format*/
                bool emailQuality = [self validateEmail:email.text];
                if(emailQuality)
                {
                    validEmailFormat = true;
                }
                else {
                    [self scrollVievEditingFinished:email]; //take scroll to textfield so user can see their error
                    [self showAlert:@"Registration Field" withMessage:@"Email is not in the correct format." and:@"Okay"];
                    return 0;
                }

            }
            else {
                [self showAlert:@"Registration Field" withMessage:@"Emails do not match" and:@"Okay"];
                return 0;
            }

        
        /* checking password are the same */
            if([password.text length] > 6 ){
                    if( [password.text isEqualToString:confirmPassword.text] )
                    {
                        passwordFilled = true;
                    }
                    else {
                        [self scrollVievEditingFinished:password]; //take scroll to textfield so user can see their error
                        [self showAlert:@"Registration Field" withMessage:@"passwords do not match" and:@"Okay"];
                        return 0;
                    }
            }
            else
            {
                [self showAlert:@"Registration Field" withMessage:@"minimum password length must be atleast 7 characters" and:@"Okay"];
                return 0;
            }
        
        if(self.dateOfBirth.hasText){
            dateofBirthFilled = true;
            
            
            NSString *currentDateString = self.dateOfBirth.text;
            NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
            [dateFormater setDateFormat:@"yyyy-MM-DD HH:mm:ss"];
            NSDate *selectDate = [dateFormater dateFromString:currentDateString];
            NSLog(@" selectDate %@", selectDate);
            
            //converted needed for nsstring
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"MM-dd-yyyy"];
            
            //Optionally for time zone conversions
            [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
            
            NSDate *selectedDate = [NSDate date]; //getting date from datepicker
            
            //updating dob NSstring to be sent to the next controller
            NSString *todayCleanDate = [formatter stringFromDate:selectedDate];
            
            NSLog(@" today date is %@ and selected date is %@" ,todayCleanDate, self.dateOfBirth.text);
            
            
        }
        else {
            [self scrollVievEditingFinished:dateOfBirth]; //take scroll to textfield so user can see their error
            [self showAlert:@"Registration Field" withMessage:@"Please enter your Date of Birth" and:@"Okay"];
            return 0;
        }
        
        //updating values
        [registeredStaff setName:self.firstName.text withMiddleInitial:self.middleName.text andLastName:self.lastName.text];
        [registeredStaff setNickname: self.nickName.text];
        [registeredStaff setEmail:self.email.text];
        [registeredStaff setUserName:self.username.text];
        [registeredStaff setPassword:self.password.text];
        [registeredStaff setDOB:self.dateOfBirth.text];
        
        return 1;
    }//eom

#pragma mark - submmitting form
    /* submmitting form */
    - (IBAction)submit:(id)sender {

        //verifying the data enter
        bool result = [self verifyDataEnter];
        if(result)
        {
            //moving to the next controller
            [self performSegueWithIdentifier:@"goToStaffRegister1" sender:self];
        }
        else
        {
            NSLog(@"missing some/all required fields on staffRegistration1");
        }
    }//eom


    /* preparing the data to sent to the next view controller */
    -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        if([segue.identifier isEqualToString:@"goToStaffRegister1"]){
            StaffRegistration1ViewController *controller = (StaffRegistration1ViewController *)segue.destinationViewController;
            
            controller.registeredStaff = registeredStaff;
        }
    }//eom

#pragma mark - Helper Methods

        /* validating email */
        - (BOOL) validateEmail: (NSString *) candidate {
            NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
            NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
            //  return 0;
            return [emailTest evaluateWithObject:candidate];
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

#pragma mark - UIDatePicker Methods


         /* creating a UiDatePicker for date of birth textfiled*/
        -(void)createDatePickerForDOB
        {
            //calculating starting date for datepicker
            NSDate *now = [NSDate date];
            NSDateComponents *minusYears = [NSDateComponents new];
            minusYears.year = -21;
            NSDate *calculatedDate = [[NSCalendar currentCalendar] dateByAddingComponents:minusYears
                                                                                   toDate:now
                                                                                  options:0];
            
            // create a UIPicker view as a custom keyboard view
            dobPickerView = [[UIDatePicker alloc] init];
            [dobPickerView sizeToFit];
            dobPickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
            [dobPickerView setDatePickerMode:UIDatePickerModeDate];
            [dobPickerView setDate:calculatedDate];//setting starting date
            self.dateOfBirth.inputView = dobPickerView;
            
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
                                                                style:UIBarButtonItemStyleBordered
                                                                          target:self
                                                                    action:@selector(doneClicked:)];
            
            //adding UIBarItems to the Keyboard/DatePicker
            [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:empty1, cancelButton, doneButton, nil]];
            
            // Plug the keyboardDoneButtonView into the text field
            self.dateOfBirth.inputAccessoryView = keyboardDoneButtonView;
        }//eom

        //makes the date of birth first responder upon touching the uitextfield
        - (void)setDateClicked:(id)sender
        {
            [self.dateOfBirth becomeFirstResponder];
        }

        //process the date selected after the user click cancel
        //   and resign being the first reponsder
        - (void)cancelClicked:(id)sender
        {
             [self.dateOfBirth resignFirstResponder];
            
            //update dob hidden field
            if(self.dateOfBirth.text.length == 0)
            {
                [self->DateOfBirthLabel setHidden:YES];
            }
            else
            {
                [self->DateOfBirthLabel setHidden:NO];
            }
        }//eom

        //process the date selected after the user click done
        //   and resign being the first reponsder
        - (void)doneClicked:(id)sender
        {
            [self.dateOfBirth resignFirstResponder];
            
            //converted needed for nsstring
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"MM-dd-yyyy"];
            
            //Optionally for time zone conversions
            [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
            
            NSDate *selectedDate = [self->dobPickerView date]; //getting date from datepicker
            
            //updating dob NSstring to be sent to the next controller
            self.dateOfBirthSelected = [formatter stringFromDate:selectedDate];
            
            //updating the texfield so the user can see the date selected
            self.dateOfBirth.text = [formatter stringFromDate:selectedDate];
            
            
            //update dob hidden field
            if(self.dateOfBirth.text.length == 0)
            {
                [self->DateOfBirthLabel setHidden:YES];
            }
            else
            {
                [self->DateOfBirthLabel setHidden:NO];
            }
        }//eom


#pragma mark - textfields  functions


//        /* dimmisses UITextField as soon the background is touched - this will not work with UiScrollview*/
//        -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//        {
//            [firstName resignFirstResponder];
//            [middleName resignFirstResponder];
//            [lastName resignFirstResponder];
//            [nickName resignFirstResponder];
//            [email resignFirstResponder];
//            [confirmEmail resignFirstResponder];
//            [password resignFirstResponder];
//            [confirmPassword resignFirstResponder];
//            [cellphone resignFirstResponder];
//        }//eom

        /* shows and hides the label above the textfield depending if the textfield is blank or filled */
        - (IBAction)textFieldValuesChanged:(UITextField *)sender
        {
            
            int labelID = (int)sender.tag;
            
            if(labelID == 0)//first name
            {
                if(self.firstName.text.length == 0)
                {
                    [self->firstNameLabel setHidden:YES];
                }
                else
                {
                    [self->firstNameLabel setHidden:NO];
                }
            }
            else if(labelID == 1)//middle name
            {
                if(self.middleName.text.length == 0)
                {
                    [self->MiddleNameLabel setHidden:YES];
                }
                else
                {
                    [self->MiddleNameLabel setHidden:NO];
                }
            }
            else if(labelID == 2)//last name
            {
                if(self.lastName.text.length == 0)
                {
                    [self->LastNameLabel setHidden:YES];
                }
                else
                {
                    [self->LastNameLabel setHidden:NO];
                }
            }
            else if(labelID == 3)//username
            {
                if(self.username.text.length == 0)
                {
                    [self->UsernameLabel setHidden:YES];
                }
                else
                {
                    [self->UsernameLabel setHidden:NO];
                }
            }
            else if(labelID == 4)//nickname
            {
                if(self.nickName.text.length == 0)
                {
                    [self->NicknameLabel setHidden:YES];
                }
                else
                {
                    [self->NicknameLabel setHidden:NO];
                }
            }
            else if(labelID == 5)//email
            {
                if(self.email.text.length == 0)
                {
                    [self->EmailLabel setHidden:YES];
                }
                else
                {
                    [self->EmailLabel setHidden:NO];
                }
            }
            else if(labelID == 6)//confirm email
            {
                if(self.confirmEmail.text.length == 0)
                {
                    [self->ConfirmEmailLabel setHidden:YES];
                }
                else
                {
                    [self->ConfirmEmailLabel setHidden:NO];
                }
            }
            else if(labelID == 7)//password
            {
                if(self.password.text.length == 0)
                {
                    [self->PasswordLabel setHidden:YES];
                }
                else
                {
                    [self->PasswordLabel setHidden:NO];
                }
            }
            else if(labelID == 8)//confirm password
            {
                if(self.confirmPassword.text.length == 0)
                {
                    [self->ConfirmPasswordLabel setHidden:YES];
                }
                else
                {
                    [self->ConfirmPasswordLabel setHidden:NO];
                }
            }
        }//eo-action

        /* uitextfield is about to be edit*/
        - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
        {
            [self scrollViewAdaptToStartEditingTextField:textField];
            return YES;
        }

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField {
            
            if(textField == self.firstName){
                [self.firstName resignFirstResponder];
                [self.middleName becomeFirstResponder];
            }
            else if(textField == self.middleName)
            {
                [self.middleName resignFirstResponder];
                [self.lastName becomeFirstResponder];
            }
            else if(textField == self.lastName){
                [self.lastName resignFirstResponder];
                [self.username becomeFirstResponder];
            }
            else if(textField == self.username){
                [self.username resignFirstResponder];
                [self.nickName becomeFirstResponder];
            }
            else if(textField == self.nickName){
                [self.nickName resignFirstResponder];
                [self.email becomeFirstResponder];
            }
            else if(textField == self.email){
                [self.email resignFirstResponder];
                [self.confirmEmail becomeFirstResponder];
            }
            else if(textField == self.confirmEmail){
                [self.confirmEmail resignFirstResponder];
                [self.password becomeFirstResponder];
            }
            else if(textField == self.password){
                [self.password resignFirstResponder];
                [self.confirmPassword becomeFirstResponder];
            }
            else if(textField == self.confirmPassword){
                [self.confirmPassword resignFirstResponder];
                [self.dateOfBirth becomeFirstResponder];
            }
            else if(textField == self.dateOfBirth){
                [self.dateOfBirth resignFirstResponder];
            }

            return YES;
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



@end


