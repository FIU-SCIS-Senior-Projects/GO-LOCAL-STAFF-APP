//
//  EmployerRegistrationViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/1/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "EmployerRegistration1ViewController.h"
#import "EmployerRegistration2ViewController.h"//need this for the prepare for segue!!

#import "RegisteredEmployer.h"//needed this to use the registration model

@interface EmployerRegistration1ViewController ()
{
    NSString * userID;
    int userIDProvided;
}

@end

@implementation EmployerRegistration1ViewController

@synthesize scrollView, registeredEmployer, submitButton, verificationCodeMessage, verificationCodeLabel, verificationCodeAsterisk, cellphoneField, verificationCodeField, verificationCodeButton;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    //waitingOnVerificationResponce = FALSE;
    
    [registeredEmployer printUserData];//testing
    
    [self setUpTapGesture];
    
}//eom

#pragma mark - verifying data

/* verifying input fields
 */
- (BOOL)verifyDataEnter
{
    //checking for valid input
    NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
    NSString * testing;
    NSString *trimmedString;
    
    testing = self.cellphoneField.text;
    trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
    if ([trimmedString isEqualToString:@""]) {
        [self scrollVievEditingFinished:cellphoneField]; //take scroll to textfield so user can see their error
        self.cellphoneField.text =@""; //clearing field
        // it's empty or contains only white spaces
        [self showAlert:@"Registration Field" withMessage:@"Please enter your cellphone number" and:@"Okay"];
        return 0;
    }
    else if( self.cellphoneField.text.length < 10)
    {
        [self scrollVievEditingFinished:cellphoneField]; //take scroll to textfield so user can see their error
        // it's empty or contains only white spaces
        [self showAlert:@"Registration Field" withMessage:@"Please make sure to enter your complete cellphone number" and:@"Okay"];
        return 0;
    }
    
    //updating values
    NSString *phoneNumber = self.cellphoneField.text;
    [registeredEmployer setPhoneNumber:phoneNumber];
    
    return 1;
}//eom


-(IBAction)submit:(id)sender
{
    bool result = [self verifyDataEnter];
    if(result)
    {
        [self performSegueWithIdentifier:@"goToEmployerRegister2" sender:self];
    }
    else
    {
        NSLog(@"missing some/all required fields on goToEmployerRegister1");
    }

}

#pragma mark - helper methods

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"goToEmployerRegister2"]){
        EmployerRegistration2ViewController *controller = (EmployerRegistration2ViewController *)segue.destinationViewController;
        
        controller.registeredEmployer = registeredEmployer;
    }
}//eom

/********* helper functions *******/

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

#pragma mark - textfields methods

/******** textfields  functions********/

/* dimisses UITextField as soon the return key is pressed */
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if(textField == self.cellphoneField){
        [self.cellphoneField resignFirstResponder];
    }
    if(textField == self.verificationCodeField){
        [self.verificationCodeField resignFirstResponder];
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
    
    if(labelID == 0)//cellphone
    {
        if(self.cellphoneField.text.length == 0)
        {
            //            [self->cellphoneLabel setHidden:YES];
        }
        else
        {
            //            [self->cellphoneLabel setHidden:NO];
        }
    }
    else if(labelID == 2)//verification code
    {
        if(self.verificationCodeField.text.length == 0)
        {
            [self->verificationCodeLabel setHidden:YES];
        }
        else
        {
            [self->verificationCodeLabel setHidden:NO];
        }
    }
}//eoa

#pragma mark - scrollview methods

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

#pragma mark - sms authentication methods

/******** SMS Authentication ********/

    /* sending verification code to server */
    - (IBAction)verifyCode:(id)sender
    {
        //verify
        BOOL results = [self verifyVerificationCodeEnter ];
        if(results)
        {
            //sending info to server
            [self sendDataVerificationNumberToServer];
        }
        
    }//eom

    -(BOOL) verifyPhoneNumberDataEnter
    {
        //checking for valid input
        NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
        NSString * testing;
        NSString *trimmedString;
        
        
        testing = self.cellphoneField.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:cellphoneField]; //take scroll to textfield so user can see their error
            self.cellphoneField.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter your cellphone number" and:@"Okay"];
            return 0;
        }
        else if( self.cellphoneField.text.length < 10)
        {
            [self scrollVievEditingFinished:cellphoneField]; //take scroll to textfield so user can see their error
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please make sure to enter your complete cellphone number" and:@"Okay"];
            return 0;
        }
        
        return 1;
    }//eom

    -(BOOL) verifyVerificationCodeEnter
    {
        //checking for valid input
        NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
        NSString * testing;
        NSString *trimmedString;
        
        
        testing = self.verificationCodeField.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:verificationCodeField]; //take scroll to textfield so user can see their error
            self.verificationCodeField.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter the verification Code" and:@"Okay"];
            return 0;
        }
        //    else if( self.verificationCode.text.length < 10)
        //    {
        //        [self scrollVievEditingFinished:cellphone]; //take scroll to textfield so user can see their error
        //        // it's empty or contains only white spaces
        //        [self showAlert:@"Registration Field" withMessage:@"Please make sure to enter your complete cellphone number" and:@"Okay"];
        //        return 0;
        //    }
        
        
        return 1;
    }//eom

    /* */
    - (IBAction)verifyNumber:(id)sender
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
            [verificationCodeMessage setHidden:NO];
            [verificationCodeLabel setHidden:NO];
            [verificationCodeAsterisk setHidden:NO];
            [verificationCodeField setHidden:NO];
            [verificationCodeButton setHidden:NO];
        }
    }//eom

    /* processing server response about the phone number
     part 1 of SMS Authentication
     */
    -(void) phoneNumberServerResponce:(NSDictionary *) responce
    {
        //    NSLog(@"[1] responce: %@", responce);
        
        NSDictionary * userResults = [responce objectForKey:@"results"];
        int responceType = [[userResults objectForKey:@"responseType"] intValue];
        NSDictionary * responceMessage = [userResults objectForKey:@"message"];
        NSString * message = [NSString stringWithFormat:@"%@", responceMessage];
        
        NSLog(@"[1] results is %@", userResults);
        NSLog(@"[1] responceType is %d", responceType);
        if(responceType > 0) //responce was good
        {
            self->userID = [userResults objectForKey:@"userID"];
            //sms part 1
            if(userID)
            {
                NSLog(@"[1] userID ID is %@  (which means we are ready for part 2)", userID);
                
                
                
                userIDProvided = responceType;
                [registeredEmployer setEmployerID:userID];
                
                //            //hiding submit phone number button
                //            [submitPhoneNumber setHidden:YES];
            }
            //sms part 2
            else
            {
//                
//                userIDProvided = responceType;
//                [registeredEmployer setEmployerID:responceType];
                
                [self.verificationCodeField resignFirstResponder];   //resign verififcation code
                
                //notifying user code was accepted
                [self showAlert:@"SMS Authentication" withMessage:@"Verification Code Accepted!" and:@"Okay"];
                
                [self scrollVievEditingFinished:cellphoneField];     //moving scroll view so user can see submit button on bottom
                
                //showing submit
                [submitButton setHidden:NO];
            }
        }
        else //invalid response
        {
            //notifying user code was accepted
            [self showAlert:@"SMS Authentication" withMessage:message and:@"Okay"];
        }
    }//eom

#pragma mark - JSON methods

/***************** JSON POST functions *******************/

    /* responce from server */
    - (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
    {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        NSLog(@" responce: %@", httpResponse.description);
        
        //            NSInteger statusCode = httpResponse.statusCode;
        //            NSLog(@" status Code: %ld", (long)statusCode);
        
        //    NSString *string = [NSString stringWithFormat:@"%ld", (long)statusCode];
        
    }//eo-action


    /* data received from server */
    - (void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data
    {
        
        NSDictionary * rawExhibits = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        //        NSLog(@"[1] from server replied: %@",rawExhibits);
        
        //        NSString *dataResponce = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //        NSLog(@"[2] responce from server %@",dataResponce);
        //
        //        // Get JSON objects into initial array
        //        NSArray *rawExhibits2 = (NSArray *)[NSJSONSerialization JSONObjectWithData:[dataResponce dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
        //        NSLog(@"[3] responce from server %@",rawExhibits2);
        
        //processing responce
        [self phoneNumberServerResponce:rawExhibits];
        
        //        }
    }//eom


    /*
     - (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
     {
     data = [[NSMutableData alloc] init];
     NSLog(@"Data Data , %@", data);
     }
     
     - (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData
     {
     [data appendData:theData];
     }
     
     */
    /* error occurred sending data to server */
    -(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
    {
        NSLog(@" Failed with error '%@'", error);
    }//eom


    /* SMS Authentication, part 1 :
     sends:
     registrationType = Employer;
     email = "Luoandre29@yahoo.com";
     firstName = Luis;
     lastName = Castillo;
     middleName = a;
     password = poiuytrewq;
     phone = 3056099250;
     username = Luandre28;
     */
    -(void)sendDataPhoneNumberToServer
    {
        NSString *serverAddress = @"http://45.55.208.175/Website/jsonPOST_sms.php";//hard coding website
        
        
        /*** preparing data to be sent ***/
        NSMutableDictionary * employerInfo = [self preparePhotoNumberData];
        NSLog(@"");
        NSLog(@" about to send the following data: %@", employerInfo);
        NSLog(@"");
        
        /*** Sending data ***/
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                        initWithURL:[NSURL URLWithString:  serverAddress ]];
        
        [request setHTTPMethod:@"POST"]; //request type
        
        //sending data
        NSError *error;
        NSData *postdata = [NSJSONSerialization dataWithJSONObject:employerInfo options:0 error:&error];
        
        [request setHTTPBody:postdata];
        
        //        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        //        NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
        
        [NSURLConnection connectionWithRequest:request delegate:self];
        
    }//eo-action


    /* prepares the data that will be sent to server in
     part 1 of SMS Authentication */
    -(NSMutableDictionary *) preparePhotoNumberData
    {
        //creating initial list
        NSMutableDictionary * finalList = [[NSMutableDictionary alloc] init];
        
        finalList[@"registrationType"]     = [registeredEmployer getAccountType];
        
        //adding view controller 0 info
        finalList[@"firstName"]     = [registeredEmployer getFirstName];
        finalList[@"middleName"]    = [registeredEmployer getMiddleName];
        finalList[@"lastName"]      = [registeredEmployer getLastName];
        finalList[@"username"]      = [registeredEmployer getUserName];
        finalList[@"email"]         = [registeredEmployer getEmail];
        finalList[@"password"]      = [registeredEmployer getPassword];
        
        //adding view controller 1 info
        finalList[@"phone"]             = self.cellphoneField.text;
        
        return finalList;
    }//eom


    /* SMS Authentication, part 2 :
     sends:
     registrationType = Staff;
     code = 8297;
     userID = 10;
     */
    -(void)sendDataVerificationNumberToServer
    {
        NSString *serverAddress = @"http://45.55.208.175/Website/jsonPOST_smsCode.php";//hard coding website
        
        
        /*** preparing data to be sent ***/
        NSMutableDictionary * employerInfo = [self prepareVerificationNumberData];
        NSLog(@"");
        NSLog(@" about to send the following data: %@", employerInfo);
        NSLog(@"");
        
        /*** Sending data ***/
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                        initWithURL:[NSURL URLWithString:  serverAddress ]];
        
        [request setHTTPMethod:@"POST"]; //request type
        
        //sending data
        NSError *error;
        NSData *postdata = [NSJSONSerialization dataWithJSONObject:employerInfo options:0 error:&error];
        
        [request setHTTPBody:postdata];
        
        //        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        //        NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
        
        [NSURLConnection connectionWithRequest:request delegate:self];
        
    }//eo-action


    /* prepares the data that will be sent to server in
     part 2 of SMS Authentication */
    -(NSMutableDictionary *) prepareVerificationNumberData
    {
        //creating initial list
        NSMutableDictionary * finalList = [[NSMutableDictionary alloc] init];
        
        finalList[@"registrationType"]      = [registeredEmployer getAccountType];
        finalList[@"userID"]                = userID;
        finalList[@"code"]                  = self.verificationCodeField.text;
        finalList[@"phone"]                 = self.cellphoneField.text;
        
        return finalList;
    }//eom




@end
