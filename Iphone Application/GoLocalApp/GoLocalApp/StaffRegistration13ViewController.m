//
//  StaffRegistration14ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/8/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration13ViewController.h"
#import "StaffRegistration14ViewController.h"


#import "RegisteredStaff.h" //needed for staff registration

@interface StaffRegistration13ViewController ()

@end

@implementation StaffRegistration13ViewController

@synthesize scrollView, registeredStaff,
wantsDirectDeposit, DirectDepositRoutingNumber, DirectDepositAccountNumber;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
}//eom

-(void)viewDidAppear:(BOOL)animated
{
    [self setUpTapGesture];
    
//    [registeredStaff printUserData];//testing
}//eom


#pragma mark - direct deposit functions
    /* */
    - (IBAction)directDepositSelectionChanged:(id)sender
    {
    //    if(!self.wantsDirectDeposit.on){
    //        [self showAlert:@"Registration Field" withMessage:@"Our Apologies but at the moment we only support direct deposit. More options and features coming soon!" and:@"Okay"];
    //        [self.wantsDirectDeposit setOn:true];
    //    }
    }//eo-action

#pragma mark - verify data

    /* verifying the required input fileds */
    - (BOOL)verifyDataEnter
    {
        //checking for valid input
        NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
        NSString * testing;
        NSString *trimmedString;

        //checking direct deposit fields are NOT empty
            if(self.wantsDirectDeposit.on)
            {
                    testing = self.DirectDepositRoutingNumber.text;
                    trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
                    if ([trimmedString isEqualToString:@""]) {
                        [self scrollVievEditingFinished:DirectDepositRoutingNumber]; //take scroll to textfield so user can see their error
                        self.DirectDepositRoutingNumber.text =@""; //clearing field
                        // it's empty or contains only white spaces
                        [self showAlert:@"Registration Field" withMessage:@"Missing the 'Routing Number' field" and:@"Okay"];
                        return 0;
                    }

                    testing = self.DirectDepositAccountNumber.text;
                    trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
                    if ([trimmedString isEqualToString:@""]) {
                        self.DirectDepositAccountNumber.text =@""; //clearing field
                        // it's empty or contains only white spaces
                        [self showAlert:@"Registration Field" withMessage:@"Missing the 'Account Number' field" and:@"Okay"];
                        return 0;
                    }
                
                //updating values
                
                [registeredStaff setDirectDeposit:self.wantsDirectDeposit.on withRouting:self.DirectDepositRoutingNumber.text andWithAccountNumber:self.DirectDepositAccountNumber.text];
                
            }//eo-direct deposit
        
        return 1;
    }

#pragma mark - sending data
    - (IBAction)submitForm:(id)sender
    {
        //verifying the data enter
        bool result = [self verifyDataEnter];
        if(result)
        {
            [self performSegueWithIdentifier:@"goToStaffRegister14" sender:self];
        }
        else
        {
            NSLog(@"missing some/all required fields StaffRegister 13 ");
        }
        
    }//eo-action


    /* preparing the data to sent to the next view controller */
    -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        if([segue.identifier isEqualToString:@"goToStaffRegister14"]){
            StaffRegistration14ViewController *controller = (StaffRegistration14ViewController *)segue.destinationViewController;
            
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
            
            if(textField == self.DirectDepositRoutingNumber){
                [self.DirectDepositRoutingNumber resignFirstResponder];
                [self.DirectDepositAccountNumber becomeFirstResponder];
            }
            else if(textField == self.DirectDepositAccountNumber){
                [self.DirectDepositAccountNumber resignFirstResponder];
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
