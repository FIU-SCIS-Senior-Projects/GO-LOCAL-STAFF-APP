//
//  StaffRegistrationViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/1/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration1ViewController.h"
#import "StaffRegistration2ViewController.h"

@interface StaffRegistration1ViewController ()

@end

@implementation StaffRegistration1ViewController


@synthesize firstName, middleName, lastName, nickName, email, confirmEmail, password, confirmPassword, cellphone, textInputScrollView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    [self setupTextFields];
}//eom


/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    BOOL emailFilled       = false;
    BOOL passwordFilled    = false;
    BOOL cellphoneFilled   = false;
    BOOL validEmailFormat  = false;
    
    //checking for valid input
    NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
    
        NSString * testing = firstName.text;
        NSString *trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:firstName]; //take scroll to textfield so user can see their error
            firstName.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Missing the first Name field" and:@"Okay"];
            return 0;
        }
        
        testing = middleName.text; //not required
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            middleName.text =@""; //clearing field
        }
    
        testing = lastName.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:lastName]; //take scroll to textfield so user can see their error
            lastName.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Missing the last Name field" and:@"Okay"];
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
            [self showAlert:@"Registration Field" withMessage:@"Missing the last email field" and:@"Okay"];
            return 0;
        }

        testing = password.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:password]; //take scroll to textfield so user can see their error
            password.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Missing the last password field" and:@"Okay"];
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
                    [self showAlert:@"Registration Field" withMessage:@"password do not match" and:@"Okay"];
                    return 0;
                }
        }
        else
        {
            [self showAlert:@"Registration Field" withMessage:@"minimum password length must be atleast 7 characters" and:@"Okay"];
            return 0;
        }
    
    if(cellphone.hasText){
        cellphoneFilled = true;
    }
    else {
        [self scrollVievEditingFinished:cellphone]; //take scroll to textfield so user can see their error
        [self showAlert:@"Registration Field" withMessage:@"Missing the Cell Phone field" and:@"Okay"];
        return 0;
    }
    
    return 1;
}//eom

/* submmitting form */
- (IBAction)submit:(id)sender {

    //verifying the data enter
    bool result = [self verifyDataEnter];
    if(result)
    {
        //moving to the next controller
        [self performSegueWithIdentifier:@"staffRegistration2" sender:self];
    }
    else
    {
        NSLog(@"missing some/all required fields");
    }
}//eom


/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"staffRegistration2"]){
        StaffRegistration2ViewController *controller = (StaffRegistration2ViewController *)segue.destinationViewController;
        controller.firstName    = self.firstName.text;
        controller.middleName   = self.middleName.text;
        controller.lastName     = self.lastName.text;
        controller.nickName     = self.nickName.text;
        controller.email        = self.email.text;
        controller.password     = self.password.text;
        controller.cellphone    = self.cellphone.text;
    }
}//eom

/* Helper Methods */
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


/******** textfields  functions********/

        /* setup textfields */
        -(void) setupTextFields
        {
            //setup of texfields
            self.firstName.delegate         = self;
            self.middleName.delegate        = self;
            self.lastName.delegate          = self;
            self.nickName.delegate          = self;
            self.email.delegate             = self;
            self.confirmEmail.delegate      = self;
            self.password.delegate          = self;
            self.confirmPassword.delegate   = self;
            self.cellphone.delegate         = self;
            
            //to dismiss keyboard when a tap is done outside the textfield
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard:)];
            [self.view addGestureRecognizer:tap];
            
        }//eom

        /* dimisses keyboard upon touching background */
        - (void)dismissKeyboard:(UITapGestureRecognizer *)recognizer {
            [self.view endEditing:YES];
        }

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

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField {
            
            if(textField == self.firstName){
                [self.firstName resignFirstResponder];
                [self.middleName becomeFirstResponder];
            }
            else if(textField == self.middleName){
                [self.middleName resignFirstResponder];
                [self.lastName becomeFirstResponder];
            }
            else if(textField == self.lastName){
                [self.nickName becomeFirstResponder];
            }
            else if(textField == self.nickName){
                [self.email becomeFirstResponder];
            }
            else if(textField == self.email){
                [self.confirmEmail becomeFirstResponder];
            }
            else if(textField == self.confirmEmail){
                [self.password becomeFirstResponder];
            }
            else if(textField == self.password){
                [self.confirmPassword becomeFirstResponder];
            }
            else if(textField == self.confirmPassword){
                [self.cellphone becomeFirstResponder];
            }
            else if(textField == self.cellphone){
                [self.cellphone resignFirstResponder];
            }
            else{
                NSLog(@"none are the same");
            }

            return YES;
        }//eom


    /********* scrollview functions **********/
        - (void) scrollViewAdaptToStartEditingTextField:(UITextField*)textField
        {
            CGPoint point = CGPointMake(0, textField.frame.origin.y - 3 * textField.frame.size.height);
            [textInputScrollView setContentOffset:point animated:YES];
        }

        - (void) scrollVievEditingFinished:(UITextField*)textField
        {
            CGPoint point = CGPointMake(0, 0);
            [textInputScrollView setContentOffset:point animated:YES];
        }

        - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
        {
            [self scrollViewAdaptToStartEditingTextField:textField];
            return YES;
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


