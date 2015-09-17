//
//  StaffRegistration10ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration9ViewController.h"
#import "StaffRegistration10ViewController.h"

@interface StaffRegistration9ViewController ()

@end

@implementation StaffRegistration9ViewController

@synthesize scrollView, chestSize, waistSize, hipsSize, dressSize,
hasDriverLicense, hasCommercialLicense, hasTattos, hasPiercings, ethnicity, height, weight, hairColor, pantSize, shoeSize, tshirtSize,
staffTypeExperience,
cellphone, completeAddress, gender, languages,
accountType, firstName, middleName, lastName, nickName, username, email, password, dateOfBirth;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTapGesture];
    
    [self testDataPassed];//testing
}//eom


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
    
    return 1;
}//eom

/* submmitting form */
- (IBAction)submitForm:(id)sender
{
    //verifying the data enter
    bool result = [self verifyDataEnter];
    if(result)
    {
        [self performSegueWithIdentifier:@"staffRegistration10a" sender:self];
    }
    else
    {
        NSLog(@"missing some/all required fields for staffRegistration9");
    }
    
}//eom

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        if([segue.identifier isEqualToString:@"staffRegistration10"]){
            StaffRegistration10ViewController *controller = (StaffRegistration10ViewController *)segue.destinationViewController;
    
            //view controller 1 data
            controller.accountType  = self.accountType;
            controller.firstName    = self.firstName;
            controller.middleName   = self.middleName;
            controller.lastName     = self.lastName;
            controller.nickName     = self.nickName;
            controller.email        = self.email;
            controller.password     = self.password;
            controller.dateOfBirth  = self.dateOfBirth;
            
            //view controller 2 data
            controller.cellphone                = self.cellphone;
            controller.completeAddress          = self->completeAddress;
            controller.gender                   = self->gender;
            controller.languages                = self->languages;
            
            //view controller 3 data
            controller.staffTypeExperience      = self->staffTypeExperience;
            
            //view controller 8 data
            controller.hasDriverLicense         = self->hasDriverLicense;
            controller.hasCommercialLicense     = self->hasCommercialLicense;
            controller.hasTattos                = self->hasTattos;
            controller.hasPiercings             = self->hasPiercings;
            controller.ethnicity                = self.ethnicity;
            controller.height                   = self.height;
            controller.weight                   = self.weight;
            controller.hairColor                = self.hairColor;
            controller.pantSize                 = self.pantSize;
            controller.shoeSize                 = self.shoeSize;
            controller.tshirtSize               = self.tshirtSize;
            
            //view controller 9 data
            controller.chestSize                = self.chestSize.text;
            controller.waistSize                = self.waistSize.text;
            controller.hipsSize                 = self.hipsSize.text;
            controller.dressSize                = self.dressSize.text;
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

        //        /* dimmisses UITextField as soon the background is touched - this will not work with UiScrollview*/
        //        -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
        //        {
        //            [firstName resignFirstResponder];
        //            [middleName resignFirstResponder];
        //            [lastName resignFirstResponder];
        //            [nickName resignFirstResponder];
        //            [email resignFirstResponder];
        //            [confirmEmail resignFirstResponder];
        //            [password resignFirstResponder];
        //            [confirmPassword resignFirstResponder];
        //            [cellphone resignFirstResponder];
        //        }//eom

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField {
            
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

        - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
        {
            [self scrollViewAdaptToStartEditingTextField:textField];
            return YES;
        }



-(void)testDataPassed
{
    NSLog(@" ");
    NSLog(@" ");
    NSLog(@" *****  Staff Registration| View controller #9 ******");
    //view controller 1
    NSLog(@" account type:    %@", self.accountType);
    NSLog(@" firstName:       %@", self.firstName);
    NSLog(@" middleName:      %@", self.middleName);
    NSLog(@" lastName:        %@", self.lastName);
    NSLog(@" nickName:        %@", self.nickName);
    NSLog(@" email:           %@", self.email);
    NSLog(@" password:        %@", self.password);
    NSLog(@" dob:             %@", self.dateOfBirth);
    //view controller 2
    NSLog(@" cellphone:       %@", self.cellphone);
    NSLog(@" address:         %@", self.completeAddress);
    NSLog(@" gender:          %d", self.gender);//0 female 1 male
    NSLog(@" languages:       %@", self.languages);
    
    //view controller 3
    NSLog(@" staff experience:%@", self.staffTypeExperience);
    
    //view controller 8
    NSLog(@" driver license?        %d", self.hasDriverLicense);
    NSLog(@" commercial license?    %d", self.hasCommercialLicense);
    NSLog(@" tattoos?               %d", self.hasTattos);
    NSLog(@" piercings?             %d", self.hasPiercings);
    NSLog(@" ethnicity              %@", self.ethnicity);
    NSLog(@" height                 %@", self.height);
    NSLog(@" weight                 %@", self.weight);
    NSLog(@" hairColor              %@", self.hairColor);
    NSLog(@" pantSize               %@", self.pantSize);
    NSLog(@" shoeSize               %@", self.shoeSize);
    NSLog(@" tshirtSize             %@", self.tshirtSize);
    
    NSLog(@" - - - - - - - - - - - - - ");
}//eom


@end
