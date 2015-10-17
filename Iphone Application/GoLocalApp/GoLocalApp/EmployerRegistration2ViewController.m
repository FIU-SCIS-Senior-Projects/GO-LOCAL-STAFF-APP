//
//  EmployerRegistration2ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/26/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "EmployerRegistration2ViewController.h"
#import "EmployerRegistration3ViewController.h"

#import "RegisteredEmployer.h"//needed this to use the registration model

@interface EmployerRegistration2ViewController ()

@end

@implementation EmployerRegistration2ViewController
{
    //arrays
    NSArray *stateOptions;
    NSString * stateSelected; //state selected
    
    //pickers
    UIPickerView * statePickerView;
    
    
    __weak IBOutlet UILabel *stateLabel;


}
@synthesize registeredEmployer, employerNameField, typeOfEmployerField, addressField, zipCodeField, stateField, cityField, insuranceSwitch, scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    //waitingOnVerificationResponce = FALSE;
    
    [registeredEmployer printUserData];//testing
    
    [self setUpTapGesture];
    
    [self createPickerForState];
    
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

/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    //checking for valid input
//    NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
//    
//    NSString * testing = firstName.text;
//    NSString *trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
    
    
    //updating values
    [registeredEmployer setEmployerName:employerNameField.text];
    [registeredEmployer setTypeOfEmployer:typeOfEmployerField.text];
    [registeredEmployer setAddress:addressField.text];
    [registeredEmployer setCity:cityField.text];
    [registeredEmployer setState:stateField.text];
    [registeredEmployer setZipCode:zipCodeField.text];
    
    if( insuranceSwitch.on )
        [registeredEmployer setIsuranceStatus:YES];
    else
        [registeredEmployer setIsuranceStatus:NO];
    
    [registeredEmployer printUserData];
    
    return 1;
}//eom


-(IBAction)submit:(id)sender
{
    if( [self verifyDataEnter] )
    {
        [self sendData];
        
        [self performSegueWithIdentifier:@"goToEmployerRegister3" sender:self];
    }
}


/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"goToEmployerRegister3"]){
        EmployerRegistration3ViewController *controller = (EmployerRegistration3ViewController *)segue.destinationViewController;
        
        controller.registeredEmployer = registeredEmployer;
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



/****** JSON Methods *******/

//Encapsulates the data in a Dictionary to send to the server
-(NSMutableDictionary *) prepareDataToSend
{
    NSMutableDictionary *list = [[NSMutableDictionary alloc] init];
    
    list[@"employerID"] = [registeredEmployer getEmployerID];
    list[@"employerName"] = [registeredEmployer getEmployerName];
    list[@"typeOfEmployer"] = [registeredEmployer getTypeOfEmployer];
    list[@"address"] = [registeredEmployer getAddress];
    list[@"city"] = [registeredEmployer getCity];
    list[@"state"] = [registeredEmployer getState];
    list[@"zipCode"] = [registeredEmployer getZipCode];
    
    if( [registeredEmployer hasInsurance] )
        list[@"hasInsurance"] = @"1";
    else
        list[@"hasInsurance"] = @"0";
    
    return list;
}

//Sends data of employer to the server
-(void) sendData
{
    NSString *serverAddress = @"http://45.55.208.175/Website/jsonPOST_registration.php";//hard coding website
    
    NSMutableDictionary *list = [self prepareDataToSend];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:serverAddress]];
    
    [request setHTTPMethod:@"POST"];
    
    NSError *error;
    NSData *data = [NSJSONSerialization dataWithJSONObject:list options:0 error:&error];
    
    [request setHTTPBody:data];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
}

-(void) processServerResponse:(NSDictionary *) responce
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
        
    }
    else //invalid response
    {
        //notifying user code was accepted
        [self showAlert:@"Information invalid" withMessage:message and:@"Okay"];
    }
}//eom



/****** JSON POST METHODS *******/

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
    [self processServerResponse:rawExhibits];
    
    //        }
}//eom


/****** UIPicker Methods ********/

    /* creates the picker for state selection*/
    -(void) createPickerForState
    {
        //setting up UIpicker for states selection
        stateOptions = [[NSArray alloc] initWithObjects:@"",@"AL", @"AK", @"AZ", @"AR", @"CA", @"CO", @"CT", @"DE", @"FL",@"GA", @"HI", @"ID", @"IL", @"IN", @"IA", @"KS", @"KY", @"LA", @"ME", @"MD", @"MA", @"MI", @"MN", @"MS", @"MO", @"MT", @"NE", @"NV", @"NH", @"NJ", @"NM", @"NY", @"NC", @"ND", @"OH", @"OK", @"PA", @"RI", @"SC", @"SD", @"TN", @"TX", @"UT", @"VT", @"VA", @"WA", @"WV", @"WI", @"WY", nil];
        
        // create a UIPicker view as a custom keyboard view
        statePickerView = [[UIPickerView alloc] init];
        [statePickerView sizeToFit];
        statePickerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        statePickerView.delegate = self;
        statePickerView.dataSource = self;
        statePickerView.showsSelectionIndicator = YES;
        
        //updating keyboard
        self.stateField.inputView = statePickerView;
        
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
        
        
        // Plug the keyboardDoneButtonView into the text field...
        self.stateField.inputAccessoryView = keyboardDoneButtonView;
        
    }//eom

    //process the data after the user click done on the uipicker
    //   and resign being the first reponsder
    - (void)doneClicked:(id)sender
    {
        [self.stateField resignFirstResponder];
    }//eom

    //process the date selected after the user click cancel
    //   and resign being the first reponsder
    - (void)cancelClicked:(id)sender
    {
        [self.stateField resignFirstResponder];
    }//eom


    // returns the number of 'columns' to display.
    - (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
    {
        return 1;
    }

    // returns the # of rows in each component..
    - (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
    {
            return [stateOptions count];

    }//wom

    #pragma mark - UIPickerView Delegate
    - (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
    {
        return 30.0;
    }

    - (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
    {

        //states
        return [stateOptions objectAtIndex:row];
        
    }//eom

    //If the user chooses from the pickerview, it calls this function;
    - (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
    {
        //state options
        if(pickerView == statePickerView)
        {
            //updating values
            stateField.text = [stateOptions objectAtIndex:row];
            stateSelected = [stateOptions objectAtIndex:row];
            
            //updating hidden label
            if(self.stateField.text.length == 0)
            {
                [self->stateLabel setHidden:YES];
            }
            else
            {
                [self->stateLabel setHidden:NO];
            }
        }
     
    }//eom


/******** textfields  functions********/

    /* dimisses UITextField as soon the return key is pressed */
    -(BOOL)textFieldShouldReturn:(UITextField *)textField {
        
    //    if(textField == self.address){
    //        [self.address resignFirstResponder];
    //        [self.city becomeFirstResponder];
    //    }
    //    
        
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
        
        if(labelID == 6)//state
        {
            if(self.stateField.text.length == 0)
            {
                [self->stateLabel setHidden:YES];
            }
            else
            {
                [self->stateLabel setHidden:NO];
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



@end
