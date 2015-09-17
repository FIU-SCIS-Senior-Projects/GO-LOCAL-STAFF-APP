//
//  StaffRegistration9ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/16/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration10ViewController.h"
#import "StaffRegistration11ViewController.h"

@interface StaffRegistration10ViewController ()
{

    __weak IBOutlet UILabel *ssnLabel;
    __weak IBOutlet UILabel *businessNameLabel;
    __weak IBOutlet UILabel *employerIdentificationNumberLabel;
    __weak IBOutlet UILabel *desiredHourlyRateLabel;
    __weak IBOutlet UILabel *desiredWeeklyRateLabel;
    
    BOOL isIncorporated;
    NSString * travelDesired;
}

@end

@implementation StaffRegistration10ViewController


@synthesize scrollView, travel25percentButton, travel50percentButton, travel75percentButton,
travel100percentButton, hasProfessionalInsuranceSwitch, incorporatedSwitch, ssnTextField, businessNameTextField, einTextField, desiredHourlyRateTextField, desiredWeeklyRateTextField,
chestSize, waistSize, hipsSize, dressSize,
hasDriverLicense, hasCommercialLicense, hasTattos, hasPiercings, ethnicity, height, weight, hairColor, pantSize, shoeSize, tshirtSize,
staffTypeExperience,
cellphone, completeAddress, gender, languages,
accountType, firstName, middleName, lastName, nickName, username, email, password, dateOfBirth;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testDataPassed];
}//EOM

-(void)viewDidAppear:(BOOL)animated
{

}//eom

/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    
}

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
        NSLog(@"missing some/all required fields staffRegistration11");
    }
}//eoa

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"goToStaffRegister11"]){
        StaffRegistration11ViewController *controller = (StaffRegistration11ViewController *)segue.destinationViewController;
        
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
        controller.completeAddress          = self.completeAddress;
        controller.gender                   = self.gender;
        controller.languages                = self.languages;
        
        //view controller 3 data
        controller.staffTypeExperience      = self.staffTypeExperience;
        
        //view controller 8 data
        controller.hasDriverLicense         = self.hasDriverLicense;
        controller.hasCommercialLicense     = self.hasCommercialLicense;
        controller.hasTattos                = self.hasTattos;
        controller.hasPiercings             = self.hasPiercings;
        controller.ethnicity                = self.ethnicity;
        controller.height                   = self.height;
        controller.weight                   = self.weight;
        controller.hairColor                = self.hairColor;
        controller.pantSize                 = self.pantSize;
        controller.shoeSize                 = self.shoeSize;
        controller.tshirtSize               = self.tshirtSize;
        
        //view controller 9 data
        controller.chestSize                = self.chestSize;
        controller.waistSize                = self.waistSize;
        controller.hipsSize                 = self.hipsSize;
        controller.dressSize                = self.dressSize;
        
        //view controller 10 data
        controller.isIncorporated           = self->isIncorporated;
        controller.ssn                      = self.ssnTextField.text;
        controller.ein                      = self.einTextField.text;
        controller.businessName             = self.businessNameTextField.text;
        controller.desiredHourlyRate        = self.desiredHourlyRateTextField.text;
        controller.desiredWeeklyRate        = self.desiredWeeklyRateTextField.text;
        controller.travelPercentage         = self->travelDesired;
        
    }
    
}//eom



/* */
- (IBAction)incorporatedValueChanged:(UISwitch *)sender {

}//eo-action

/**/
- (IBAction)travelPercentValueChanged:(UIButton *)sender {

}//eo-action


-(void)testDataPassed
{
    
    NSLog(@" ");
    NSLog(@" ");
    NSLog(@" *****  Staff Registration| View controller #10 ******");
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
    NSLog(@" staff experience:      %@", self.staffTypeExperience);
    
    //view controller 8
    NSLog(@" driver license?        %@", self.hasDriverLicense);
    NSLog(@" commercial license?    %@", self.hasCommercialLicense);
    NSLog(@" tattoos?               %@", self.hasTattos);
    NSLog(@" piercings?             %@", self.hasPiercings);
    NSLog(@" ethnicity              %@", self.ethnicity);
    NSLog(@" height                 %@", self.height);
    NSLog(@" weight                 %@", self.weight);
    NSLog(@" hairColor              %@", self.hairColor);
    NSLog(@" pantSize               %@", self.pantSize);
    NSLog(@" shoeSize               %@", self.shoeSize);
    NSLog(@" tshirtSize             %@", self.tshirtSize);
    
    //view controller 9
    NSLog(@" chestSize              %@", self.chestSize);
    NSLog(@" waistSize              %@", self.waistSize);
    NSLog(@" hipsSize               %@", self.hipsSize);
    NSLog(@" dressSize              %@", self.dressSize);
    
    NSLog(@" - - - - - - - - - - - - - ");
}//eom


@end
