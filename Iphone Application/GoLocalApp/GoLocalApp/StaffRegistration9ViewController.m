//
//  StaffRegistration10ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration9ViewController.h"
#import "StaffRegistration10ViewController.h"


#import "RegisteredStaff.h" //needed for staff registration

@interface StaffRegistration9ViewController ()
{
    __weak IBOutlet UILabel *chestSizeLabel;
    __weak IBOutlet UILabel *waistSizeLabel;
    __weak IBOutlet UILabel *hipsSizeLabel;
    __weak IBOutlet UILabel *dressSizeLabel;
}
@end

@implementation StaffRegistration9ViewController

@synthesize scrollView, registeredStaff,
chestSize, waistSize, hipsSize, dressSize;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}//eom

-(void)viewDidAppear:(BOOL)animated
{
    [self setUpTapGesture];
    
    [registeredStaff printUserData];//testing
}//eom


#pragma mark - verify data
    /* verifying the required input fileds */
    - (BOOL)verifyDataEnter
    {
        //checking for valid input
        NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
        NSString * testing;
        NSString *trimmedString;
        
        testing = self.chestSize.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:chestSize]; //take scroll to textfield so user can see their error
            chestSize.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter your chest size" and:@"Okay"];
            return 0;
        }
        
        testing = self.waistSize.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:waistSize]; //take scroll to textfield so user can see their error
            waistSize.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter your waist size" and:@"Okay"];
            return 0;
        }
        
        
        testing = self.hipsSize.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:hipsSize]; //take scroll to textfield so user can see their error
            hipsSize.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter your hips size" and:@"Okay"];
            return 0;
        }
        
        testing = self.dressSize.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:dressSize]; //take scroll to textfield so user can see their error
            dressSize.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Please enter your dress size" and:@"Okay"];
            return 0;
        }
        
        //updating values
        [registeredStaff setChest:self.chestSize.text];
        [registeredStaff setWaist:self.waistSize.text];
        [registeredStaff setHipSize: self.hipsSize.text];
        [registeredStaff setDressSize:self.dressSize.text];
            
        return 1;
    }//eom

#pragma mark - sending data

    /* submmitting form */
    - (IBAction)submitForm:(id)sender
    {
        //verifying the data enter
        bool result = [self verifyDataEnter];
        if(result)
        {
            [self performSegueWithIdentifier:@"goToStaffRegister10a" sender:self];
        }
        else
        {
            NSLog(@"missing some/all required fields for staffRegistration9");
        }
        
    }//eom

    /* preparing the data to sent to the next view controller */
    -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
            if([segue.identifier isEqualToString:@"goToStaffRegister10a"]){
                StaffRegistration10ViewController *controller = (StaffRegistration10ViewController *)segue.destinationViewController;
        
               controller.registeredStaff = registeredStaff;
            }
    }//eom


#pragma mark - helper methods
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
        /* shows/hides textfield depending if they are filled or empty*/
        - (IBAction)textFieldValueChanged:(id)sender {
            
            //chestSize
            if(self.chestSize.text.length == 0)
            {
                [self->chestSizeLabel setHidden:YES];
            }
            else
            {
                [self->chestSizeLabel setHidden:NO];
            }
            
            //waistSize
            if(self.waistSize.text.length == 0)
            {
                [self->waistSizeLabel setHidden:YES];
            }
            else
            {
                [self->waistSizeLabel setHidden:NO];
            }
            
            //waistSize
            if(self.hipsSize.text.length == 0)
            {
                [self->hipsSizeLabel setHidden:YES];
            }
            else
            {
                [self->hipsSizeLabel setHidden:NO];
            }
            
            
            //waistSize
            if(self.dressSize.text.length == 0)
            {
                [self->dressSizeLabel setHidden:YES];
            }
            else
            {
                [self->dressSizeLabel setHidden:NO];
            }
        }//eom


        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField
        {
            
                if(textField == self.chestSize){
                    [self.chestSize resignFirstResponder];
                    [self.waistSize becomeFirstResponder];
                }
                else if(textField == self.waistSize){
                    [self.waistSize resignFirstResponder];
                    [self.hipsSize becomeFirstResponder];
                }
                else if(textField == self.hipsSize){
                    [self.hipsSize resignFirstResponder];
                    [self.dressSize becomeFirstResponder];
                }
                else if(textField == self.dressSize){
                    [self.dressSize resignFirstResponder];
                }
            
            return YES;
        }//eom

        /* uitextfield is about to be edit*/
        - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
        {
            [self scrollViewAdaptToStartEditingTextField:textField];
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
