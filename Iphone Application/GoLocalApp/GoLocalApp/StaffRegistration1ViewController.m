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

@interface StaffRegistration1ViewController ()
{

    // carrier items
    UIPickerView * carrierPickerView;
    NSArray *carrierOptions;
    
    // registered user ID on server
    NSString * peopleID;
    BOOL waitingOnVerificationResponce;
    
    //labels
    __weak IBOutlet UILabel *cellphoneLabel;
    __weak IBOutlet UILabel *carrierLabel;
    __weak IBOutlet UILabel *verificationCodeLabel;
    __weak IBOutlet UILabel *verificationAsterisk;
    __weak IBOutlet UILabel *verificationCodeIntroMessage;
    
}

@end

@implementation StaffRegistration1ViewController

@synthesize scrollView, cellphone, verificationCode, carrier, submitPhoneNumber, verifyCodeButton, registeredStaff;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    waitingOnVerificationResponce = FALSE;
    [registeredStaff printUserData];//testing
    
    [self setUpTapGesture];
    [self createPickerForCarrier];
    
}//eom

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
    [registeredStaff setCellphone:self.cellphone.text withCarrier:@""];
    
     return 1;
}//eom

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
    
    testing = self.carrier.text;
    trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
    if ([trimmedString isEqualToString:@""]) {
        [self scrollVievEditingFinished:carrier]; //take scroll to textfield so user can see their error
        self.carrier.text =@""; //clearing field
        // it's empty or contains only white spaces
        [self showAlert:@"Registration Field" withMessage:@"Please enter your cellphone carrier" and:@"Okay"];
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
    }
}//eom

/* processing server response about the phone number */
-(void) phoneNumberServerResponce:(NSDictionary *) responce
{
    NSLog(@" responce: %@", responce);
    NSDictionary * peopleIDResults = [responce objectForKey:@"results"];
    
    NSLog(@" results is %@", peopleIDResults);
    
    peopleID = [peopleIDResults objectForKey:@"peopleID"];
    NSLog(@" people ID is %@", peopleID);
    
    
    if(peopleID)
    {
        //hiding submit phone number button
        [submitPhoneNumber setHidden:YES];
        
        //updating json receiver flag
        waitingOnVerificationResponce = true;
    }
}//eom

/* processing server response about the verification code number */
-(void) verificationCodeResponce:(NSDictionary *) responce
{
    //
    NSLog(@" %@", responce);
    NSString * serverResponce = [responce objectForKey:@"peopleID"];
    NSLog(@" server responce %@", serverResponce);
//
//    if(peopleID)
//    {
//        //hiding submit phone number button
//        [submitPhoneNumber setHidden:YES];
//        
//        //updating json receiver flag
//        waitingOnVerificationResponce = true;
//    }
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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"goToStaffRegister2"]){
        StaffRegistration2ViewController *controller = (StaffRegistration2ViewController *)segue.destinationViewController;
        
        controller.registeredStaff = registeredStaff;
        
    }
}//eom


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


/******** textfields  functions********/

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


/****** UIPicker Methods ********/

        /* creates the picker for 1st 2nd 3rd language selection */
        -(void) createPickerForCarrier
        {
            //setting up UIpicker for states selection
            carrierOptions = [[NSArray alloc] initWithObjects:@"",@"aio",@"att",@"bootstMobile",@"cricket", @"metropcs", @"sprint",@"straightTalk", @"tmobile", @"usCelular", @"verizon",nil];
            
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
            
            /* native language */
            // create a UIPicker view as a custom keyboard view
            carrierPickerView = [[UIPickerView alloc] init];
            [carrierPickerView sizeToFit];
            carrierPickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
            carrierPickerView.delegate = self;
            carrierPickerView.dataSource = self;
            carrierPickerView.showsSelectionIndicator = YES;
            
            self.carrier.inputView = carrierPickerView;
            
            // Plug the keyboardDoneButtonView into the text field
            self.carrier.inputAccessoryView = keyboardDoneButtonView;
            
        }//eom

        //makes the date of birth first responder upon touching the uitextfield
        - (void)setDateClicked:(id)sender
        {
            [self.carrier becomeFirstResponder];
        }

        //process the date selected after the user click cancel
        //   and resign being the first reponsder
        - (void)cancelClicked:(id)sender
        {
            [self.carrier resignFirstResponder];
            
            //update hidden field
            if(self.carrier.text.length == 0)
            {
                [self->carrierLabel setHidden:YES];
            }
            else
            {
                [self->carrierLabel setHidden:NO];
            }
        }//eom

        //process the date selected after the user click done
        //   and resign being the first reponsder
        - (void)doneClicked:(id)sender
        {
            [self.carrier resignFirstResponder];
            
        }//eom


        // returns the number of 'columns' to display.
        - (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
        {
            return 1;
        }

        // returns the # of rows in each component..
        - (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
        {
            return [carrierOptions count];
            
        }//eom

        #pragma mark - UIPickerView Delegate
        - (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
        {
            return 30.0;
        }

        - (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
        {
            
            return [carrierOptions objectAtIndex:row];
            
        }//eom

        //If the user chooses from the pickerview, it calls this function;
        - (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
        {
            //updating values
            self.carrier.text = [carrierOptions objectAtIndex:row];
            
            //update hidden field
            if(self.carrier.text.length == 0)
            {
                [self->carrierLabel setHidden:YES];
            }
            else
            {
                [self->carrierLabel setHidden:NO];
            }
        }//eom


/***************** JSON POST functions *******************/

        /* responce from server */
        - (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
        {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            
            NSLog(@" responce: %@", httpResponse.description);
            
            NSInteger statusCode = httpResponse.statusCode;
            
            NSLog(@" status Code: %ld", (long)statusCode);
            //    NSString *string = [NSString stringWithFormat:@"%ld", (long)statusCode];
            
        }//eo-action


    /* data received from server */
    - (void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data
    {
        
        NSDictionary * rawExhibits = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@" from server replied: %@",rawExhibits);
        
        
        //            NSString *dataResponce = [[NSString alloc] initWithData:theData encoding:NSUTF8StringEncoding];
        //            NSLog(@" responce from server %@",dataResponce);
        
        //            // Get JSON objects into initial array
        //            NSArray *rawExhibits = (NSArray *)[NSJSONSerialization JSONObjectWithData:[dataResponce dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
        
        //waiting on verification responce
        if(waitingOnVerificationResponce)
        {
            [self verificationCodeResponce: rawExhibits];
        }
        else //waiting on phone number responce
        {
            //processing responce
            [self phoneNumberServerResponce:rawExhibits];
        }
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

        /* sends data to server */
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


        /* */
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
            finalList[@"email"]         = [registeredStaff getEmail];
            finalList[@"username"]      = [registeredStaff getUserName];
            finalList[@"password"]      = [registeredStaff getPassword];
            finalList[@"dob"]           = [registeredStaff getDateOfBirth];
            
            //adding view controller 1 info
            finalList[@"phone"]             = self.cellphone.text;
            finalList[@"carrier"]      = self.carrier.text;
            
            return finalList;
        }//eom

        /* sends data to server */
        -(void)sendDataVerificationNumberToServer
        {
            NSString *serverAddress = @"http://45.55.208.175/Website/jsonPOST_smsCode.php";//hard coding website
            
            
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



        -(NSMutableDictionary *) prepareVerificationNumberData
        {
            //creating initial list
            NSMutableDictionary * finalList = [[NSMutableDictionary alloc] init];
            
            finalList[@"peopleID"]     = peopleID;
            finalList[@"code"]     = verificationCode.text;
            
            return finalList;
        }//eom

@end
