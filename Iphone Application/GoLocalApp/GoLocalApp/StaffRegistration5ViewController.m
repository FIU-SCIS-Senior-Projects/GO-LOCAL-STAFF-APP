//
//  StaffRegistration4ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration5ViewController.h"
#import "StaffRegistration6ViewController.h"
#import "StaffRegistration7ViewController.h"
#import "StaffRegistration10ViewController.h"


#import "RegisteredStaff.h" //needed for staff registration

@interface StaffRegistration5ViewController ()
{
    __weak IBOutlet UILabel *costOfServiceLabel;
    
}
@end

@implementation StaffRegistration5ViewController

@synthesize scrollView, registeredStaff,
liveBandDescription, liveBandWebsite, liveBandSocialMedia, costOfServiceTextField;


- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void)viewDidAppear:(BOOL)animated
{
    
    [registeredStaff printUserData];//testing
    
    [self setUpTapGesture];
    

    
}//eom

#pragma mark - verify data
    /* verify required fields */
    - (BOOL)verifyDataEnter
    {
        BOOL liveBandDescriptionFilled        = false;
        BOOL liveBandWebsiteFilled            = false;
        BOOL liveBandSocialMediaFilled        = false;
        
        if(liveBandDescription.hasText){
            liveBandDescriptionFilled = true;
        }
        else {
            [self showAlert:@"Registration Field" withMessage:@"Missing the description field" and:@"Okay"];
            return 0;
        }
        
        if(liveBandWebsite.hasText){
            liveBandWebsiteFilled = true;
        }
        else {
            [self showAlert:@"Registration Field" withMessage:@"Missing the website field" and:@"Okay"];
            return 0;
        }
        
        if(liveBandSocialMedia.hasText){
            liveBandSocialMediaFilled = true;
        }
        else {
            [self showAlert:@"Registration Field" withMessage:@"Missing the social media field" and:@"Okay"];
            return 0;
        }
        
        //updating values
        NSDictionary *info = [[NSDictionary alloc] initWithObjectsAndKeys:
                                self.liveBandDescription.text, @"description",
                                self.liveBandWebsite.text, @"website",
                                self.liveBandSocialMedia.text, @"socialMedia",
                                self.costOfServiceTextField.text, @"costOfService",
                                nil];
        
        NSMutableArray *service = [[NSMutableArray alloc] init];
        [service addObject:info];
        [registeredStaff setLiveBandInfo:service];
        

        return 1;
    }//eom

#pragma mark - sending data
    /*submitting form*/
    - (IBAction)submitForm:(id)sender {
        bool results = [self verifyDataEnter];
        if( results)
        {
            [self determineWhereToGo];
        }
    }//eom


    /* */
    -(void)determineWhereToGo
    {
        
        //catering company
        if( [registeredStaff isCateringCompany] )
        {
            //skipping to catering company controller
            [self performSegueWithIdentifier:@"liveBandToCateringCompany" sender:self];
        }
        //other services
        else if( [registeredStaff isOtherServices])
        {
            //skipping to Other services controller
            [self performSegueWithIdentifier:@"liveBandToOtherServices" sender:self];
        }
        else
        {
            //skipping to staff registration 11 controller
            [self performSegueWithIdentifier:@"liveBandToStaffRegistration10" sender:self];
        }
        
    }//eom

    /* preparing the data to sent to the next view controller */
    -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        if([segue.identifier isEqualToString:@"liveBandToCateringCompany"]){
            StaffRegistration6ViewController *controller = (StaffRegistration6ViewController *)segue.destinationViewController;
            
            controller.registeredStaff = registeredStaff;
        }
        else if([segue.identifier isEqualToString:@"liveBandToOtherServices"]){
            StaffRegistration7ViewController *controller = (StaffRegistration7ViewController *)segue.destinationViewController;
            
             controller.registeredStaff = registeredStaff;
            
        }
        else if([segue.identifier isEqualToString:@"liveBandToStaffRegistration10"]){
            StaffRegistration10ViewController *controller = (StaffRegistration10ViewController *)segue.destinationViewController;
            
             controller.registeredStaff = registeredStaff;
        }
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
            
        }//eom

        /* dimisses keyboard upon touching background */
        - (void)dismissKeyboard:(UITapGestureRecognizer *)recognizer {
            [self.view endEditing:YES];
        }//eom

#pragma mark - textfields  functions

        /* shows and hides the label above the textfield depending if the textfield is blank or filled */
        - (IBAction)textFieldValuesChanged:(UITextField *)sender
        {
            int labelID = (int)sender.tag;
            
            if(labelID == 2)//cellphone
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
            
            if(textField == self.liveBandWebsite){
                [self.liveBandWebsite resignFirstResponder];
                [self.liveBandSocialMedia becomeFirstResponder];
            }
            else{
                NSLog(@"none are the same");
            }
            
            return YES;
        }//eom

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textViewShouldReturn:(UITextView *)textView {
            
            if(textView == self.liveBandDescription){
                [self.liveBandDescription resignFirstResponder];
                [self.liveBandWebsite becomeFirstResponder];
            }
            else if(textView == self.liveBandSocialMedia){
                [self.liveBandSocialMedia resignFirstResponder];
            }
            else{
                NSLog(@"none are the same");
            }
            
            return YES;
        }//eom

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
