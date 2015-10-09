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
    
    //    [registeredStaff printUserData];//testing
    
    [self setUpTapGesture];
    
}//eom

-(void)setUpTapGesture
{
    //to dismiss keyboard when a tap is done outside the textfield
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.view addGestureRecognizer:tap];
    
}//eom

/* dimisses keyboard upon touching background */
- (void)dismissKeyboard:(UITapGestureRecognizer *)recognizer
{
    [self.view endEditing:YES];
}

- (IBAction)verifyNumber:(id)sender
{
    NSString *phoneNumber = cellphoneField.text;
    [registeredEmployer setPhoneNumber:phoneNumber];
    
    [verificationCodeMessage setHidden:NO];
    [verificationCodeAsterisk setHidden:NO];
    [verificationCodeField setHidden:NO];
    [submitButton setHidden:NO];
    [verificationCodeButton setHidden:NO];
}

- (IBAction)verifyCode:(id)sender {
}

-(IBAction)submit:(id)sender
{
    NSLog(@"%@", registeredEmployer.getPhoneNumber);
    //moving to the next controller
    [self performSegueWithIdentifier:@"goToEmployerRegister2" sender:self];
}

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"goToEmployerRegister2"]){
        EmployerRegistration2ViewController *controller = (EmployerRegistration2ViewController *)segue.destinationViewController;
        
        controller.registeredEmployer = registeredEmployer;
    }
}//eom

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
                NSLog(@"[1] from server replied: %@",rawExhibits);
        
        //        NSString *dataResponce = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //        NSLog(@"[2] responce from server %@",dataResponce);
        //
        //        // Get JSON objects into initial array
        //        NSArray *rawExhibits2 = (NSArray *)[NSJSONSerialization JSONObjectWithData:[dataResponce dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
        //        NSLog(@"[3] responce from server %@",rawExhibits2);
        
        //waiting on verification responce, part 2 of SMS Authentication
//        if(waitingOnVerificationResponce)
//        {
//            NSLog(@"waiting on verification responce.....");
//            [self verificationCodeResponce: rawExhibits];
//        }
//        else //waiting on phone number responce,  part 1 of SMS Authentication
//        {
//            NSLog(@"waiting on phone number responce.....");
//            //processing responce
//            [self phoneNumberServerResponce:rawExhibits];
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
        NSString *serverAddress = @"http://45.55.208.175/Website/jsonPOST_sms.php";//hard coding website
        
        
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
        finalList[@"nickName"]      = [registeredEmployer getNickName];
        finalList[@"username"]      = [registeredEmployer getUserName];
        finalList[@"email"]         = [registeredEmployer getEmail];
        finalList[@"password"]      = [registeredEmployer getPassword];
        finalList[@"dob"]           = [registeredEmployer getDateOfBirth];
        
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
        
        return finalList;
    }//eom

@end
