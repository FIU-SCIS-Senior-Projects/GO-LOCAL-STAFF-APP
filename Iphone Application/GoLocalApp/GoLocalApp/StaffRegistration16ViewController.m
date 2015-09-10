//
//  StaffRegistration16ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/8/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration16ViewController.h"
//#import "LogInViewController.h"

@interface StaffRegistration16ViewController ()

@end

@implementation StaffRegistration16ViewController
@synthesize agreeTermsSwitch, termsAndAgreements, submitButton, scrollView,
firstName, middleName, lastName, nickName, email, cellphone,
password, address, city, zipcode, stateSelected,
djSelected, djDescription, djWebsite, djSocialMedia,
liveBandSelected, liveBandDescription, liveBandWebsite, liveBandSocialMedia,
cateringCompanySelected, cateringCompanyDescription, cateringCompanyWebsite, cateringCompanySocialMedia,
otherServicesSelected, otherServicesDescription, otherServicesWebsite, otherServicesSocialMedia,
dob, gender, languages,
ethnicity, typeOfLicense,
height, weight, hairColor, eyeColor, pantSize, shoeSize, tshirtSize, desiredHourlyRate, desiredWeeklyRate, piercings, tattoos,
chestSize, waistSize, hipsSize, dressSize,
typeCorporated, ssn, ein, businessName, citiesWillingToWork, travel, professionalInsurance,
directDepositDesired, DirectDepositRoutingNumber, DirectDepositAccountNumber,
isModel, isBrandAmbassador, isFlyerDistributor, isFieldMarketingManager, isDancer, iswaiterOrWaitress, isProductionAssistant, isSalesExecutive;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testDataPassed];//testing
}//eom

/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    if(!self.agreeTermsSwitch.on)
    {
        [self showAlert:@"Registration Field" withMessage:@"Please" and:@"Okay"];
    }

    return 1;
}//eom

-(void)testDataPassed
{
    
    NSLog(@" ");
    NSLog(@" ");
    NSLog(@" *****  Staff Registration| View controller #16 ******");
    //view controller 1
    NSLog(@" firstName:       %@", self.firstName);
    NSLog(@" middleName:      %@", self.middleName);
    NSLog(@" lastName:        %@", self.lastName);
    NSLog(@" nickName:        %@", self.nickName);
    NSLog(@" email:           %@", self.email);
    NSLog(@" password:        %@", self.password);
    NSLog(@" cellphone:       %@", self.cellphone);
    
    //view controller 2
    NSLog(@" address:                   %@", self.address);
    NSLog(@" city:                      %@", self.city);
    NSLog(@" zipcode:                   %@", self.zipcode);
    NSLog(@" stateSelected:             %@", self.stateSelected);
    NSLog(@" djSelected:                %d", self.djSelected);
    NSLog(@" liveBandSelected:          %d", self.liveBandSelected);
    NSLog(@" djSelected:                %d", self.djSelected);
    NSLog(@" cateringCompanySelected:   %d", self.cateringCompanySelected);
    NSLog(@" otherServicesSelected:     %d", self.otherServicesSelected);
    
    //view controller 3 - DJ only
    
    NSLog(@" djDescription:     %@", self.djDescription);
    NSLog(@" djWebsite:         %@", self.djWebsite);
    NSLog(@" djSocialMedia:     %@", self.djSocialMedia);
    
    //view controller 4 - Live Band Only
    
    NSLog(@" liveBandDescription:   %@", self.liveBandDescription);
    NSLog(@" liveBandWebsite:       %@", self.liveBandWebsite);
    NSLog(@" liveBandSocialMedia:   %@", self.liveBandSocialMedia);
    
    //view controller 5 - Catering Company Only
    NSLog(@" cateringCompanyDescription:    %@", self.cateringCompanyDescription);
    NSLog(@" cateringCompanyWebsite:        %@", self.cateringCompanyWebsite);
    NSLog(@" cateringCompanySocialMedia:    %@", self.cateringCompanySocialMedia);
    
    //view controller 6
    NSLog(@" otherServicesDescription:  %@", self.otherServicesDescription);
    NSLog(@" otherServicesWebsite:      %@", self.otherServicesWebsite);
    NSLog(@" otherServicesSocialMedia:  %@", self.otherServicesSocialMedia);

    //view controller 7
    NSLog(@" dob:       %@", self.dob);
    NSLog(@" gender:    %d", self.gender);// 0-female 1-male
    NSLog(@" languages: %@", self.languages);
    
        //view controller 8
    NSLog(@" ethnicity:     %d", self.ethnicity);//see db legend
    NSLog(@" typeOfLicense: %d", self.typeOfLicense);//0-driver 1-commercial
    
    //view controller 9
    NSLog(@" height:            %@", self.height);
    NSLog(@" weight:            %@", self.weight);
    NSLog(@" hairColor:         %@", self.hairColor);
    NSLog(@" eyeColor:          %@", self.eyeColor);
    NSLog(@" pantSize:          %@", self.pantSize);
    NSLog(@" shoeSize:          %@", self.shoeSize);
    NSLog(@" tshirtSize:        %@", self.tshirtSize);
    NSLog(@" desiredHourlyRate: %@", self.desiredHourlyRate);
    NSLog(@" desiredWeeklyRate: %@", self.desiredWeeklyRate);
    NSLog(@" tattoos:           %d", self.tattoos);//0 - no | 1 - yes
    NSLog(@" piercings:         %d", self.piercings);//0 - no | 1 - yes
    
    //view controller 10 - females ONLY
    NSLog(@" chestSize: %@", self.chestSize);
    NSLog(@" waistSize: %@", self.waistSize);
    NSLog(@" hipsSize: %@", self.hipsSize);
    NSLog(@" dressSize: %@", self.dressSize);
    
    //view controller 11
    NSLog(@" typeCorporated:        %d", self.typeCorporated);//0-not incorporated| 1- corporated
    NSLog(@" ssn:                   %@", self.ssn);//NotIncorporated field
    NSLog(@" ein:                   %@", self.ein);         //incorporated field
    NSLog(@" businessName:          %@", self.businessName);//incorporated field
    NSLog(@" citiesWillingToWork:   %@", self.citiesWillingToWork);
    NSLog(@" travel:                %d", self.travel);
    NSLog(@" professionalInsurance: %d", self.professionalInsurance);
    

    //view controller 14
    NSLog(@" directDepositDesired:          %d", self.directDepositDesired);
    NSLog(@" DirectDepositRoutingNumber:    %@", self.DirectDepositRoutingNumber);
    NSLog(@" DirectDepositAccountNumber:    %@", self.DirectDepositAccountNumber);

    //view controller 15
    NSLog(@" isModel:                   %d", self.isModel);
    NSLog(@" isBrandAmbassador:         %d", self.isBrandAmbassador);
    NSLog(@" isFlyerDistributor:        %d", self.isFlyerDistributor);
    NSLog(@" isFieldMarketingManager:   %d", self.isFieldMarketingManager);
    NSLog(@" isDancer:                  %d", self.isDancer);
    NSLog(@" iswaiterOrWaitress:        %d", self.iswaiterOrWaitress);
    NSLog(@" isProductionAssistant:     %d", self.isProductionAssistant);
    NSLog(@" isSalesExecutive:          %d", self.isSalesExecutive);
    
    NSLog(@" - - - - - - - - - - - - - ");
}//eom

- (IBAction)agreeTermsValueChanged:(id)sender {
    
    if(self.agreeTermsSwitch.on)
    {
        //since user to terms, display 'submit registration' button
        self.submitButton.hidden = NO;
    }
    else
    {
        self.submitButton.hidden = YES;
    }
    
}//eo-action

- (IBAction)submitForm:(id)sender
{
    //verifying the data enter
    bool result = [self verifyDataEnter];
    if(result)
    {
//        [self performSegueWithIdentifier:@"registeredStaff" sender:self];
//        LogInViewController *logInView = [[UIStoryboard storyboardWithName:@"Main.storyboard" bundle:nil] instantiateViewControllerWithIdentifier:@"logInView"];
//        
//         [self.navigationController pushViewController:logInView animated:YES];
    }
    else
    {
        NSLog(@"missing some/all required fields");
    }
}//eo-action

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




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
