//
//  StaffRegistration1ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/25/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration1ViewController.h"
#import "StaffRegistration2ViewController.h"


#import "RegisteredStaff.h" //needed for staff registration
#import "ServerAPI.h"

@interface StaffRegistration1ViewController ()
{
    // registered user ID on server
    NSString * userID;
    int userIDProvided;
//    BOOL waitingOnVerificationResponce;
    
    //labels
    __weak IBOutlet UILabel *cellphoneLabel;
    __weak IBOutlet UILabel *verificationCodeLabel;
    __weak IBOutlet UILabel *verificationAsterisk;
    __weak IBOutlet UILabel *verificationCodeIntroMessage;
    
    ServerAPI * api;

}

@end

@implementation StaffRegistration1ViewController

@synthesize scrollView, cellphone, verificationCode, submitPhoneNumber, verifyCodeButton, submitButton, registeredStaff;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    api = [[ServerAPI alloc]init];

}

-(void)viewDidAppear:(BOOL)animated
{
//    waitingOnVerificationResponce = FALSE;
    
//    [registeredStaff printUserData];//testing
    
    [self setUpTapGesture];
    
}//eom

#pragma mark - verify Data Enter
    /* verifying input fields
     */
    - (BOOL)verifyDataEnter
    {
        //checking for valid input
        NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
        NSString * testing;
        NSString *trimmedString;
        
        testing = self.cellphone.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:cellphone]; //take scroll to textfield so user can see their error
            self.cellphone.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter your cellphone number" and:@"Okay"];
            return 0;
        }
        else if( self.cellphone.text.length < 10)
        {
            [self scrollVievEditingFinished:cellphone]; //take scroll to textfield so user can see their error
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please make sure to enter your complete cellphone number" and:@"Okay"];
            return 0;
        }
        
        //updating values
        [registeredStaff setCellphone:cellphone.text];
        
         return 1;
    }//eom

#pragma mark - sending data
    - (IBAction)submitForm:(id)sender {
        bool result = [self verifyDataEnter];
        if(result)
        {
            [self performSegueWithIdentifier:@"goToStaffRegister2" sender:self];
        }
        else
        {
            NSLog(@"missing some/all required fields on staffRegistration1");
        }
    }//eom

    /* preparing the data to sent to the next view controller */
    -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
    {
        if([segue.identifier isEqualToString:@"goToStaffRegister2"]){
            StaffRegistration2ViewController *controller = (StaffRegistration2ViewController *)segue.destinationViewController;
            
            controller.registeredStaff = registeredStaff;
            
        }
    }//eom

#pragma mark - helper functions
    /* create UIAlert*/
    -(void) showAlert:(NSString*)title withMessage:(NSString*)message and:(NSString*) cancelTitle
    {
        //creating controller
        UIAlertController * actionController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleDefault handler:nil];
        
        [actionController addAction:defaultAction];
        
        [self presentViewController:actionController animated:YES completion:nil];
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

#pragma mark - textfields  functions

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField {
            
            if(textField == self.cellphone){
                [self.cellphone resignFirstResponder];
            }
            if(textField == self.verificationCode){
                [self.verificationCode resignFirstResponder];
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
                if(self.cellphone.text.length == 0)
                {
                    [self->cellphoneLabel setHidden:YES];
                }
                else
                {
                    [self->cellphoneLabel setHidden:NO];
                }
            }
            else if(labelID == 2)//verification code
            {
                if(self.verificationCode.text.length == 0)
                {
                    [self->verificationCodeLabel setHidden:YES];
                }
                else
                {
                    [self->verificationCodeLabel setHidden:NO];
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

#pragma mark - SMS Authentication

    -(BOOL) verifyPhoneNumberDataEnter
    {
        //checking for valid input
        NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
        NSString * testing;
        NSString *trimmedString;
        
        
        testing = self.cellphone.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:cellphone]; //take scroll to textfield so user can see their error
            self.cellphone.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter your cellphone number" and:@"Okay"];
            return 0;
        }
        else if( self.cellphone.text.length < 10)
        {
            [self scrollVievEditingFinished:cellphone]; //take scroll to textfield so user can see their error
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please make sure to enter your complete cellphone number" and:@"Okay"];
            return 0;
        }
        
        return 1;
    }//eom

    /* */
    - (IBAction)phoneNumberSubmitted:(id)sender
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
            [verificationCodeIntroMessage setHidden:NO];
            [verificationCodeLabel setHidden:NO];
            [verificationAsterisk setHidden:NO];
            [verificationCode setHidden:NO];
            [verifyCodeButton setHidden:NO];
            
            //moving on to the next textfield
            [cellphone resignFirstResponder];
            [verificationCode becomeFirstResponder];
        }
    }//eom

    -(BOOL) verifyVerificationCodeEnter
    {
        //checking for valid input
        NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
        NSString * testing;
        NSString *trimmedString;
        
        
        testing = self.verificationCode.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:verificationCode]; //take scroll to textfield so user can see their error
            self.verificationCode.text =@""; //clearing field
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

    /* sending verification code to server */
    - (IBAction)verifyCodeSubmitted:(id)sender
    {
        //verify
        BOOL results = [self verifyVerificationCodeEnter ];
        if(results)
        {
            //sending info to server
            [self sendDataVerificationNumberToServer];
        }
        
    }//eom


#pragma mark - JSON POST functions

            /*
             processing server response about the phone number
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
                        
                        //            //hiding submit phone number button
                        //            [submitPhoneNumber setHidden:YES];
                        
                        userIDProvided = responceType;
                        [registeredStaff setStaffID:userID];
                    }
                    //sms part 2
                    else
                    {
                        
                        [self.verificationCode resignFirstResponder];   //resign verification code
                        
                        //notifying user code was accepted
                        [self showAlert:@"SMS Authentication" withMessage:@"Verification Code Accepted!" and:@"Okay"];
                        
                        [self scrollVievEditingFinished:cellphone];     //moving scroll view so user can see submit button on bottom
                        
                        //showing submit
                        [submitButton setHidden:NO];
                        
                        [self performSegueWithIdentifier:@"goToStaffRegister2" sender:self];
                    }
                }
                else //invalid response
                {
                    if(userResults)
                    {
                        //notifying user code was accepted
                        [self showAlert:@"SMS Authentication" withMessage:message and:@"Okay"];
                    }
                    else
                    {
//                        NSString * msgToDisplay = @"";
//                        [self showAlert:@"SMS Authentication" withMessage:msgToDisplay and:@"Okay"];
                    }
                }
            }//eom

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
         */

        /* error occurred sending data to server */
        -(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
        {
            NSLog(@" Failed with error '%@'", error);
        }//eom


        /* SMS Authentication, part 1 :
         sends:
             registrationType = Staff;
             carrier = usCelular;
             dob = "09-08-1994";
             email = "Luoandre29@yahoo.com";
             firstName = Luis;
             lastName = Castillo;
             middleName = a;
             nickName = Lu;
             password = poiuytrewq;
             phone = 3056099250;
             username = Luandre28;
         */
        -(void)sendDataPhoneNumberToServer
        {
            NSString *serverAddress = api.registerUserVerifySMSPt1;
            
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


        /* 
         prepares the data that will be sent to server in
         part 1 of SMS Authentication 
         */
        -(NSMutableDictionary *) preparePhotoNumberData
        {
            //creating initial list
            NSMutableDictionary * finalList = [[NSMutableDictionary alloc] init];
            
            finalList[@"registrationType"]     = [registeredStaff getAccountType];
            
            //adding view controller 0 info
            finalList[@"firstName"]     = [registeredStaff getFirstName];
            finalList[@"middleName"]    = [registeredStaff getMiddleName];
            finalList[@"lastName"]      = [registeredStaff getLastName];
            finalList[@"nickName"]      = [registeredStaff getNickName];
            finalList[@"username"]      = [registeredStaff getUserName];
            finalList[@"email"]         = [registeredStaff getEmail];
            finalList[@"password"]      = [registeredStaff getPassword];
            finalList[@"dob"]           = [registeredStaff getDateOfBirth];
            
            //adding view controller 1 info
            finalList[@"phone"]             = self.cellphone.text;
            
            return finalList;
        }//eom


        /* 
         SMS Authentication, part 2 :
            sends:
                    registrationType = Staff;
                    code = 8297;
                    userID = 10;
         */
        -(void)sendDataVerificationNumberToServer
        {
            NSString *serverAddress = api.registerUserVerifySMSPt2;
            
            /*** preparing data to be sent ***/
            NSMutableDictionary * staffInfo = [self prepareVerificationNumberData];
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


        /* 
         prepares the data that will be sent to server in
            part 2 of SMS Authentication 
         */
        -(NSMutableDictionary *) prepareVerificationNumberData
        {
            //creating initial list
            NSMutableDictionary * finalList = [[NSMutableDictionary alloc] init];
            
            finalList[@"registrationType"]      = [registeredStaff getAccountType];
            finalList[@"userID"]                = userID;
            finalList[@"code"]                  = verificationCode.text;
            finalList[@"phone"]                 = self.cellphone.text;
            
            return finalList;
        }//eom

@end
