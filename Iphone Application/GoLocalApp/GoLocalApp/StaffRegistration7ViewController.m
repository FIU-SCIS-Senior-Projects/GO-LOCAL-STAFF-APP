//
//  StaffRegistration6ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration7ViewController.h"
#import "StaffRegistration10ViewController.h"


#import "RegisteredStaff.h" //needed for staff registration

@interface StaffRegistration7ViewController ()
{
    __weak IBOutlet UILabel *costOfServiceLabel;
}
@end

@implementation StaffRegistration7ViewController


@synthesize  scrollView, registeredStaff,
otherServicesDescription, otherServicesWebsite, otherServicesSocialMedia, costOfServiceTextField;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    if(otherServicesSelected == false){
//        [self determineWhereToGo];
//    }

}

-(void)viewDidAppear:(BOOL)animated
{
    [self setUpTapGesture];
//    [registeredStaff printUserData];
    
}//eom

/* verify required fields */
- (BOOL)verifyDataEnter
{
    BOOL otherServicesDescriptionFilled        = false;
    BOOL otherServicesWebsiteFilled            = false;
    BOOL otherServicesSocialMediaFilled        = false;
    
    if(otherServicesDescription.hasText){
        otherServicesDescriptionFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the description field" and:@"Okay"];
        return 0;
    }
    
    if(otherServicesWebsite.hasText){
        otherServicesWebsiteFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the website field" and:@"Okay"];
        return 0;
    }
    
    if(otherServicesSocialMedia.hasText){
        otherServicesSocialMediaFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the social media field" and:@"Okay"];
        return 0;
    }
        
    //updating values
    NSDictionary *info = [[NSDictionary alloc] initWithObjectsAndKeys:
                          self.otherServicesDescription.text, @"description",
                          self.otherServicesWebsite.text, @"website",
                          self.otherServicesSocialMedia.text, @"socialMedia",
                          self.costOfServiceTextField.text, @"costOfService",
                          nil];
    
    NSMutableArray *service = [[NSMutableArray alloc] init];
    [service addObject:info];
    [registeredStaff setOtherServicesInfo:service];

    
    return 1;
}//eom

/*submitting form*/
- (IBAction)submitForm:(id)sender
{
    bool results = [self verifyDataEnter];
    if( results)
    {
        [self determineWhereToGo];
    }
}//eom

-(void)determineWhereToGo
{
    //skipping to staff registration 10 controller
    [self performSegueWithIdentifier:@"otherServicesToStaffRegistration10" sender:self];
}//eom

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"otherServicesToStaffRegistration10"]){
        StaffRegistration10ViewController *controller = (StaffRegistration10ViewController *)segue.destinationViewController;
        
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
            
        }//eom

        /* dimisses keyboard upon touching background */
        - (void)dismissKeyboard:(UITapGestureRecognizer *)recognizer {
            [self.view endEditing:YES];
        }//eom

/******** textfields  functions********/

        /* shows and hides the label above the textfield depending if the textfield is blank or filled */
        - (IBAction)textFieldValuesChanged:(UITextField *)sender
        {
            int labelID = (int)sender.tag;
            
            if(labelID == 4)
            {
                if(self.costOfServiceTextField.text.length == 0)
                {
                    [self->costOfServiceLabel setHidden:YES];
                }
                else
                {
                    [self->costOfServiceLabel setHidden:NO];
                }
            }
        }//eom


        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField {
            
            if(textField == self.otherServicesWebsite){
                [self.otherServicesWebsite resignFirstResponder];
                [self.otherServicesSocialMedia becomeFirstResponder];
            }
            else{
                NSLog(@"none are the same");
            }
            
            return YES;
        }//eom

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textViewShouldReturn:(UITextView *)textView {
            
            if(textView == self.otherServicesDescription){
                [self.otherServicesDescription resignFirstResponder];
                [self.otherServicesWebsite becomeFirstResponder];
            }
            else if(textView == self.otherServicesSocialMedia){
                [self.otherServicesSocialMedia resignFirstResponder];
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
            [scrollView setContentOffset:point animated:YES];
        }

        - (void) scrollVievEditingFinished:(UITextField*)textField
        {
            CGPoint point = CGPointMake(0, 0);
            [scrollView setContentOffset:point animated:YES];
        }

        /* textfield */
        - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
        {
            [self scrollViewAdaptToStartEditingTextField:textField];
            return YES;
        }

        /* textview */
        - (BOOL) textViewShouldBeginEditing:(UITextField *)textView
        {
            [self scrollViewAdaptToStartEditingTextField:textView];
            return YES;
        }

@end
