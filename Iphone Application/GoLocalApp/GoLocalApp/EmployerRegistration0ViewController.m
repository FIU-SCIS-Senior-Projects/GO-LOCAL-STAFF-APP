//
//  EmployerRegistration0ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/26/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "EmployerRegistration0ViewController.h"
#import "EmployerRegistration1ViewController.h" //need this for the prepare for segue!!

#import "RegisteredEmployer.h" //needed this to use the registration model


@interface EmployerRegistration0ViewController ()
{
    RegisteredEmployer *registeredEmployer;
    
    __weak IBOutlet UILabel *firstNameLabel;
    __weak IBOutlet UILabel *MiddleNameLabel;
    __weak IBOutlet UILabel *LastNameLabel;
    __weak IBOutlet UILabel *UsernameLabel;
    __weak IBOutlet UILabel *EmailLabel;
    __weak IBOutlet UILabel *ConfirmEmailLabel;
    __weak IBOutlet UILabel *PasswordLabel;
    __weak IBOutlet UILabel *ConfirmPasswordLabel;
}
@end

@implementation EmployerRegistration0ViewController

@synthesize firstName, middleName, lastName, username, email, confirmEmail, password, confirmPassword, scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    registeredEmployer = [[RegisteredEmployer alloc]init];
    
    [self setUpTapGesture];
    
}//eom

#pragma mark - verifying data

/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    BOOL emailFilled       = false;
    BOOL passwordFilled    = false;
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
        [self showAlert:@"Registration Field" withMessage:@"Email and confirm do not match" and:@"Okay"];
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
            [self showAlert:@"Registration Field" withMessage:@"password do not match" and:@"Okay"];
            return 0;
        }
    }
    else
    {
        [self showAlert:@"Registration Field" withMessage:@"minimum password length must be atleast 7 characters" and:@"Okay"];
        return 0;
    }
    
    //updating values
    [registeredEmployer setName:self.firstName.text withMiddleInitial:self.middleName.text andLastName:self.lastName.text];
    [registeredEmployer setEmail:self.email.text];
    [registeredEmployer setUserName:self.username.text];
    [registeredEmployer setPassword:self.password.text];
    
    return 1;
}//eom


/* submmitting form */
- (IBAction)submit:(id)sender {
    
    //verifying the data enter
    bool result = [self verifyDataEnter];
    if(result)
    {
        //moving to the next controller
        [self performSegueWithIdentifier:@"goToEmployerRegister1" sender:self];
    }
    else
    {
        NSLog(@"missing some/all required fields on Employer Register 0");
    }
}//eom

#pragma mark - helper methods

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"goToEmployerRegister1"]){
        EmployerRegistration1ViewController *controller = (EmployerRegistration1ViewController *)segue.destinationViewController;
        
        controller.registeredEmployer = registeredEmployer;
    }
}//eom

/********** Helper Methods **********/
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

/********* tap gestures functions *******/
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

#pragma mark - textfield methods

/******** textfields  functions********/

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
            }

            return YES;
        }//eom

#pragma mark - scrolllview methods

/********* scrollview functions **********/
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
