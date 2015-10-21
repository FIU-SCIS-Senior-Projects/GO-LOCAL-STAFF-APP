//
//  StaffRegistration9ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/16/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration10ViewController.h"
#import "StaffRegistration11ViewController.h"


#import "RegisteredStaff.h" //needed for staff registration

@interface StaffRegistration10ViewController ()
{

    __weak IBOutlet UILabel *ssnLabel;
    __weak IBOutlet UILabel *businessNameLabel;
    __weak IBOutlet UILabel *employerIdentificationNumberLabel;
    __weak IBOutlet UILabel *desiredHourlyRateLabel;
    __weak IBOutlet UILabel *desiredWeeklyRateLabel;
    
    __weak IBOutlet UILabel *ssnAsteriskLabel;
    __weak IBOutlet UILabel *einAsteriskLabel;
    __weak IBOutlet UILabel *businessNameAsteriskLabel;
    BOOL isIncorporated;
    NSString * travelDesired;
}

@end

@implementation StaffRegistration10ViewController


@synthesize scrollView, registeredStaff,
travel25percentButton, travel50percentButton, travel75percentButton,
travel100percentButton, hasProfessionalInsuranceSwitch, incorporatedSwitch, ssnTextField, businessNameTextField, einTextField, desiredHourlyRateTextField, desiredWeeklyRateTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}//EOM

-(void)viewDidAppear:(BOOL)animated
{
//    [registeredStaff printUserData];//testing
    
    [self setUpTapGesture];
    [self setUpTravelButtons];
}//eom

#pragma mark - sending data
    /* verifying the required input fileds */
    - (BOOL)verifyDataEnter
    {
            //checking for valid input
            NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
            NSString * testing;
            NSString *trimmedString ;
        
            if(self.incorporatedSwitch.on)
            {
                NSLog(@"checking for Incorporated");
                
                testing = self.einTextField.text;
                trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
                if ([trimmedString isEqualToString:@""]) {
                    [self scrollVievEditingFinished:self.einTextField]; //take scroll to textfield so user can see their error
                    self.einTextField.text =@""; //clearing field
                    // it's empty or contains only white spaces
                    [self showAlert:@"Registration Field" withMessage:@"Please enter your Employer identification Number" and:@"Okay"];
                    return 0;
                }
                
                testing = self.businessNameTextField.text;
                trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
                if ([trimmedString isEqualToString:@""]) {
                    [self scrollVievEditingFinished:self.businessNameTextField]; //take scroll to textfield so user can see their error
                    self.businessNameTextField.text =@""; //clearing field
                    // it's empty or contains only white spaces
                    [self showAlert:@"Registration Field" withMessage:@"Please enter your Business Name" and:@"Okay"];
                    return 0;
                }

            }
            else
            {
                NSLog(@"checking for NOT Incorporated");
                
                testing = self.ssnTextField.text;
                trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
                if ([trimmedString isEqualToString:@""]) {
                    [self scrollVievEditingFinished:self.ssnTextField]; //take scroll to textfield so user can see their error
                    self.ssnTextField.text =@""; //clearing field
                    // it's empty or contains only white spaces
                    [self showAlert:@"Registration Field" withMessage:@"Please enter your Social Security Number " and:@"Okay"];
                    return 0;
                }

            }
        
        //updating values
        [registeredStaff setProfessionalInsurance:self.hasProfessionalInsuranceSwitch.on];
        [registeredStaff setIncorporatedInfo:self.incorporatedSwitch.on ssn:self.ssnTextField.text ein:self.einTextField.text businessName:self.businessNameTextField.text];
        [registeredStaff setWageRate:self.desiredHourlyRateTextField.text orDesiredWeeklyRate:self.desiredWeeklyRateTextField.text];
        [registeredStaff setTravelPercentage:self->travelDesired];
     
        return 1;
    }

#pragma mark - sending data
    /* submmitting form */
    - (IBAction)submitForm:(id)sender
    {
        //verifying the data enter
        bool result = [self verifyDataEnter];
        if(result)
        {
            //    moving to the next controller
            [self performSegueWithIdentifier:@"goToStaffRegister11" sender:self];
        }
        else
        {
            NSLog(@"missing some/all required fields staffRegistration10");
        }
    }//eoa

    /* preparing the data to sent to the next view controller */
    -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        if([segue.identifier isEqualToString:@"goToStaffRegister11"]){
            StaffRegistration11ViewController *controller = (StaffRegistration11ViewController *)segue.destinationViewController;
            
            controller.registeredStaff = registeredStaff;
            
        }
        
    }//eom


#pragma mark - incorporated functions
    /* shows/hides the incorporated values depending on the switch selection */
    - (IBAction)incorporatedValueChanged:(UISwitch *)sender
    {
        if(self.incorporatedSwitch.on)
        {
            //hiding textfields
            [self.ssnTextField setHidden:YES];
            
            //hiding labels
            [self->ssnLabel setHidden:YES];
            [self->ssnAsteriskLabel setHidden:YES];
            
            //displaying textfields
            [self.einTextField setHidden:NO];
            [self.businessNameTextField setHidden:NO];
            
            //displaying labels
            [self->businessNameLabel setHidden:NO];
            [self->employerIdentificationNumberLabel setHidden:NO];
            [self->einAsteriskLabel setHidden:NO];
            [self->businessNameAsteriskLabel setHidden:NO];
        }
        else
        {
            //hiding textfields
            [self.einTextField setHidden:YES];
            [self.businessNameTextField setHidden:YES];
            
           
            //hiding labels
            [self->employerIdentificationNumberLabel setHidden:YES];
            [self->businessNameLabel setHidden:YES];
            [self->einAsteriskLabel setHidden:YES];
            [self->businessNameAsteriskLabel setHidden:YES];
            
            //displaying textfields
            [self.ssnTextField setHidden:NO];
            
            //displaying labels
            [self->ssnLabel setHidden:NO];
            [self->ssnAsteriskLabel setHidden:NO];
        }
    }//eo-action

#pragma mark - travel functions
    /* updates the select of desired travel percentages and disables all other travel percentage buttons */
    - (IBAction)travelPercentValueChanged:(UIButton *)sender
    {
        int travelValue = (int) sender.tag;
        
        if(travelValue == 0)//  0% travel
        {
            //enabling 25% button
            self.travel0percentButton.layer.borderColor     = [UIColor blackColor].CGColor;
            
            //disabling all travel percentages buttons
            self.travel25percentButton.layer.borderColor    = [UIColor clearColor].CGColor;
            self.travel50percentButton.layer.borderColor    = [UIColor clearColor].CGColor;
            self.travel75percentButton.layer.borderColor    = [UIColor clearColor].CGColor;
            self.travel100percentButton.layer.borderColor   = [UIColor clearColor].CGColor;
            
            self->travelDesired = @"0";
        }
        else if(travelValue == 25)//  25% travel
        {
            //enabling 25% button
            self.travel25percentButton.layer.borderColor = [UIColor blackColor].CGColor;
            
            //disabling all travel percentages buttons
            self.travel0percentButton.layer.borderColor     = [UIColor clearColor].CGColor;
            self.travel50percentButton.layer.borderColor    = [UIColor clearColor].CGColor;
            self.travel75percentButton.layer.borderColor    = [UIColor clearColor].CGColor;
            self.travel100percentButton.layer.borderColor   = [UIColor clearColor].CGColor;
            
            self->travelDesired = @"25";
        }
        else if(travelValue == 50) // 50% travel
        {
            //enabling 50% button
            self.travel50percentButton.layer.borderColor = [UIColor blackColor].CGColor;
            
            //disabling all travel percentages buttons
            self.travel0percentButton.layer.borderColor     = [UIColor clearColor].CGColor;
            self.travel25percentButton.layer.borderColor    = [UIColor clearColor].CGColor;
            self.travel75percentButton.layer.borderColor    = [UIColor clearColor].CGColor;
            self.travel100percentButton.layer.borderColor   = [UIColor clearColor].CGColor;
            
            self->travelDesired = @"50";
        }
        else if(travelValue == 75) // 75% travel
        {
            //enabling 75% button
            self.travel75percentButton.layer.borderColor = [UIColor blackColor].CGColor;
            
            //disabling all travel percentages buttons
            self.travel0percentButton.layer.borderColor     = [UIColor clearColor].CGColor;
            self.travel25percentButton.layer.borderColor    = [UIColor clearColor].CGColor;
            self.travel50percentButton.layer.borderColor    = [UIColor clearColor].CGColor;
            self.travel100percentButton.layer.borderColor   = [UIColor clearColor].CGColor;
            
            self->travelDesired = @"75";
        }
        else if(travelValue == 100) // 100% travel
        {
            //enabling 100% button
            self.travel100percentButton.layer.borderColor = [UIColor blackColor].CGColor;
            
            //disabling all travel percentages buttons
            self.travel0percentButton.layer.borderColor     = [UIColor clearColor].CGColor;
            self.travel25percentButton.layer.borderColor    = [UIColor clearColor].CGColor;
            self.travel50percentButton.layer.borderColor    = [UIColor clearColor].CGColor;
            self.travel75percentButton.layer.borderColor    = [UIColor clearColor].CGColor;
            
            self->travelDesired = @"100";
        }
    }//eo-action

/* setups visually all the travel buttons to clear */
-(void)setUpTravelButtons
{
    //0%
    self.travel0percentButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.travel0percentButton.layer.borderWidth = 4.5f;
    self.travel0percentButton.layer.cornerRadius = 10.0f;

    //25%
    self.travel25percentButton.layer.borderColor = [UIColor clearColor].CGColor;
    self.travel25percentButton.layer.borderWidth = 4.5f;
    self.travel25percentButton.layer.cornerRadius = 10.0f;

    //50%
    self.travel50percentButton.layer.borderColor = [UIColor clearColor].CGColor;
    self.travel50percentButton.layer.borderWidth = 4.5f;
    self.travel50percentButton.layer.cornerRadius = 10.0f;

    //75%
    self.travel75percentButton.layer.borderColor = [UIColor clearColor].CGColor;
    self.travel75percentButton.layer.borderWidth = 4.5f;
    self.travel75percentButton.layer.cornerRadius = 10.0f;

    //100%
    self.travel100percentButton.layer.borderColor = [UIColor clearColor].CGColor;
    self.travel100percentButton.layer.borderWidth = 4.5f;
    self.travel100percentButton.layer.cornerRadius = 10.0f;
}//eom

#pragma mark - helper functions

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

#pragma mark - textfields  functions

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField
        {
            
            if(textField == self.ssnTextField){
                [self.ssnTextField resignFirstResponder];
            }
            else if(textField == self.businessNameTextField){
                [self.businessNameTextField resignFirstResponder];
                [self.einTextField becomeFirstResponder];
            }
            else if(textField == self.einTextField){
                [self.einTextField resignFirstResponder];
            }
            else if(textField == self.desiredHourlyRateTextField){
                [self.desiredHourlyRateTextField resignFirstResponder];
            }
            
            else if(textField == self.desiredWeeklyRateTextField){
                [self.desiredWeeklyRateTextField resignFirstResponder];
            }
            
            return YES;
        }//eom

        /* uitextfield is about to be edit*/
        - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
        {
            [self scrollViewAdaptToStartEditingTextField:textField];//moving scrollview
            return YES;
        }

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


@end
