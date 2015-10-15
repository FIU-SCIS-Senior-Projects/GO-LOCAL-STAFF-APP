//
//  ForgotPasswordViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/2/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController ()
{
    int userIDProvided;
    NSString * userID;
}

@end

@implementation ForgotPasswordViewController
@synthesize phoneNumberTextfield, verificationCodeAsterisk, verificationCodeLabel, verificationCodeTextField,
passwordProvidedAsterisk, passwordProvidedLabel, passwordProvidedTextField, confirmNewPasswordProvidedAsterisk, confirmNewPasswordProvidedLabel, confirmNewPasswordProvidedTextField, resetPassword, scrollView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [self setUpTapGesture];

}//eom



/********************************/
    //MARK: helper functions

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

/********************************/
    //MARK: Tap gesture functions

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

/********************************/
    //MARK: scrollview functions
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

/********************************/
    //MARK: textfields functions

    /* dimisses UITextField as soon the return key is pressed */
    -(BOOL)textFieldShouldReturn:(UITextField *)textField
    {
        
        if(textField == self.phoneNumberTextfield){
            [self.phoneNumberTextfield resignFirstResponder];
            
            //submit number
        }
        else if(textField == self.verificationCodeTextField){
            [self.verificationCodeTextField resignFirstResponder];
            [self.passwordProvidedTextField becomeFirstResponder];
        }
        else if(textField == self.passwordProvidedTextField){
            [self.passwordProvidedTextField resignFirstResponder];
            [self.confirmNewPasswordProvidedTextField becomeFirstResponder];
        }
        else if(textField == self.confirmNewPasswordProvidedTextField){
            [self.confirmNewPasswordProvidedTextField resignFirstResponder];
        }
        
        return YES;
    }//eom


/********************************/
    //MARK: reset password SMS Part 1

    -(BOOL) verifyPhoneNumberDataEnter
    {
        //checking for valid input
        NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
        NSString * testing;
        NSString *trimmedString;
        
        testing = self.phoneNumberTextfield.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:phoneNumberTextfield]; //take scroll to textfield so user can see their error
            self.phoneNumberTextfield.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter your cellphone number" and:@"Okay"];
            return 0;
        }
        else if( self.phoneNumberTextfield.text.length < 10)
        {
            [self scrollVievEditingFinished:phoneNumberTextfield]; //take scroll to textfield so user can see their error
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please make sure to enter your complete cellphone number" and:@"Okay"];
            return 0;
        }
        
        return 1;
    }//eom

    /* start reset password process */
    - (IBAction)startResetPasswordAction:(id)sender
    {
        //verify
        BOOL results = [self verifyPhoneNumberDataEnter ];
        if(results)
        {
            //sending info to server
            [self sendDataPhoneNumberToServer];
            
            //displaying instruction message
            [self showAlert:@"Registration Field" withMessage:@"A verification code has been sent to your cellphone, Please enter the verification code" and:@"Okay"];
            
            //displaying verification fields
            [verificationCodeLabel setHidden:NO];
            [verificationCodeAsterisk setHidden:NO];
            [verificationCodeTextField setHidden:NO];
            
            [passwordProvidedLabel setHidden:NO];
            [passwordProvidedAsterisk setHidden:NO];
            [passwordProvidedTextField setHidden:NO];
            
            [confirmNewPasswordProvidedLabel setHidden:NO];
            [confirmNewPasswordProvidedAsterisk setHidden:NO];
            [confirmNewPasswordProvidedTextField setHidden:NO];
            
            [resetPassword setHidden:NO];
        }
    }//eom

/********************************/
    //MARK: reset password SMS Part 2

    -(BOOL) verifyFinalData
    {
        //checking for valid input
        NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
        NSString * testing;
        NSString *trimmedString;
        
        
        testing = self.verificationCodeTextField.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""])
        {
            //take scroll to textfield so user can see their error
            [self scrollVievEditingFinished:verificationCodeTextField];
            self.verificationCodeTextField.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter the verification Code" and:@"Okay"];
            return 0;
        }
        else if( self.verificationCodeTextField.text.length < 4)
        {
            //take scroll to textfield so user can see their error
            [self scrollVievEditingFinished:verificationCodeTextField];
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please make sure to enter the full verification Code number" and:@"Okay"];
            return 0;
        }
        
        testing = passwordProvidedTextField.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            //take scroll to textfield so user can see their error
            [self scrollVievEditingFinished:passwordProvidedTextField];
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter your new password" and:@"Okay"];
            return 0;
        }

        
        testing = confirmNewPasswordProvidedTextField.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:confirmNewPasswordProvidedTextField]; //take scroll to textfield so user can see their error
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter confirm your new password" and:@"Okay"];
            return 0;
        }

        
        /* checking new password length is acceptable*/
        if([passwordProvidedTextField.text length] > 6 )
        {
            /* checking password are the same */
            bool samePassword =[passwordProvidedTextField.text isEqualToString:confirmNewPasswordProvidedTextField.text];
            if( samePassword == false )
            {
                //take scroll to textfield so user can see their error
                [self scrollVievEditingFinished:passwordProvidedTextField];
                
                [self showAlert:@"Registration Field" withMessage:@"passwords do not match" and:@"Okay"];
                return 0;
            }
        }
        else
        {
            [self showAlert:@"Registration Field" withMessage:@"minimum password length must be atleast 7 characters" and:@"Okay"];
            return 0;
        }
        
        
        return 1;
    }//eom

    /* finalizes the reset password process */
    - (IBAction)resetPasswordAction:(UIButton *)sender
    {
        //verify
        BOOL results = [self verifyFinalData ];
        if(results)
        {
            //sending info to server
            [self sendFinalDataToServer];
        }
    }//eo-action



/********************************/
    //MARK: process server responce for part 1 and part 2

    /*
     process Server Responce
     */
    -(void) processServerResponce:(NSDictionary *) responce
    {
        //    NSLog(@"[1] responce: %@", responce);
        
        NSDictionary * userResults = [responce objectForKey:@"results"];
        int responseType = [[userResults objectForKey:@"responseType"] intValue];
       
        int part = [[userResults objectForKey:@"part"] intValue];
        
        NSDictionary * responceMessage = [userResults objectForKey:@"message"];
        NSString * message = [NSString stringWithFormat:@"%@", responceMessage];
        
        NSLog(@"[1] results is %@", userResults);
        NSLog(@"[1] responseType is %d", responseType);
        NSLog(@"[1] part is %d", part);
        
        /*
         reponse returns the following:
             1   phone number code successfully sent
             0   database not responding
             -1  No Username or Email exist with the information provided
             -2  Unable to send sms code
             -3  account is locked
             -4  the maximum number of attempts for reset password has been exceeded
             -5  Unable to store changes to Database
         */
        
        //part 1 responce
        if(part == 1)
        {
            if(responseType == 1) // phone number code successfully sent
            {
                self->userID = [userResults objectForKey:@"userID"];
                if(userID)
                {
                    NSLog(@"[1] userID ID is %@  (which means we are ready for part 2)", userID);
                }
                
            }
            else if( (responseType == 0) || (responseType == -2) || (responseType == -4) )
            {
                //notifying user code was accepted
                [self showAlert:@"Log In" withMessage:@"We Apologize but our system is currently down" and:@"Okay"];
            }
            else if(responseType == -1)//no user found
            {
                //notifying user code was accepted
                [self showAlert:@"Log In" withMessage:@"Invalid credentials" and:@"Okay"];
            }
            else if(responseType == -3)//no user found
            {
                //notifying user code was accepted
                [self showAlert:@"Log In" withMessage:@"No account found with the provided credentials" and:@"Okay"];
            }
            else if(responseType == -4)//account locked
            {
                //notifying user code was accepted
                [self showAlert:@"Log In" withMessage:@"Account locked" and:@"Okay"];
            }
            else //invalid response
            {
                //notifying user code was accepted
                [self showAlert:@"Log In" withMessage:message and:@"Okay"];
            }
        }
        //part 2 responce
        else if(part == 2)
        {
        
        }
        //invalid response
        else
        {
            //notifying user code was accepted
            [self showAlert:@"SMS Authentication" withMessage:message and:@"Okay"];
        }
        
    }//eom



/************************************/
    //MARK: JSON functins for reset password,Part 1

    /*  sends data to server */
    -(void)sendDataPhoneNumberToServer
    {
        NSString *serverAddress = @"http://45.55.208.175/Website/jsonPOST_smsForgotPassword.php";//hard coding website
        
        
        /*** preparing data to be sent ***/
        NSMutableDictionary * staffInfo = [self preparePhotoNumberData];
        NSLog(@"");
        NSLog(@" about to send the following data: %@", staffInfo);
        NSLog(@"");
        
        /*** Sending data ***/
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                        initWithURL:[NSURL URLWithString:  serverAddress ]];
        
        [request setHTTPMethod:@"POST"]; //request type
        
        //sending data
        NSError *error;
        NSData *postdata = [NSJSONSerialization dataWithJSONObject:staffInfo options:0 error:&error];
        
        [request setHTTPBody:postdata];
        
        //        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        //        NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
        
        [NSURLConnection connectionWithRequest:request delegate:self];
        
    }//eo-action

    /*  prepares the data to be send for forgot password */
    -(NSMutableDictionary *) preparePhotoNumberData
    {
        //creating initial list
        NSMutableDictionary * finalList = [[NSMutableDictionary alloc] init];
        
        finalList[@"phone"]   = self.phoneNumberTextfield.text;
        
        return finalList;
    }//eom


/************************************/
    //MARK: JSON functins for reset password,Part 2


    /*  sends data to server */
    -(void)sendFinalDataToServer
    {
        NSString *serverAddress = @"http://45.55.208.175/Website/jsonPOST_forgotPassword.php";//hard coding website
        
        
        /*** preparing data to be sent ***/
        NSMutableDictionary * staffInfo = [self prepareFinalData];
        NSLog(@"");
        NSLog(@" about to send the following data: %@", staffInfo);
        NSLog(@"");
        
        /*** Sending data ***/
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                        initWithURL:[NSURL URLWithString:  serverAddress ]];
        
        [request setHTTPMethod:@"POST"]; //request type
        
        //sending data
        NSError *error;
        NSData *postdata = [NSJSONSerialization dataWithJSONObject:staffInfo options:0 error:&error];
        
        [request setHTTPBody:postdata];
        
        //        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        //        NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
        
        [NSURLConnection connectionWithRequest:request delegate:self];
        
    }//eo-action

    /*  prepares the data to be send for forgot password */
    -(NSMutableDictionary *) prepareFinalData
    {
        //creating initial list
        NSMutableDictionary * finalList = [[NSMutableDictionary alloc] init];
        
        finalList[@"userID"]        = self->userID;
        finalList[@"code"]          = self.verificationCodeTextField.text;
        finalList[@"newPassword"]   = self.passwordProvidedTextField.text;
        
        return finalList;
    }//eom

/************************************/
    //MARK: JSON POST functions

    /* responce from server */
    - (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
    {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        NSLog(@" responce: %@", httpResponse.description);
        
    }//eo-action


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
        [self processServerResponce:rawExhibits];
    }//eom

    /* error occurred sending data to server */
    -(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
    {
        NSLog(@" Failed with error '%@'", error);
    }//eom

@end
