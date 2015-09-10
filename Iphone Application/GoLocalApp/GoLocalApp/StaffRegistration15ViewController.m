//
//  StaffRegistration15ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/8/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration15ViewController.h"
#import "StaffRegistration16ViewController.h"

@interface StaffRegistration15ViewController ()

@end

@implementation StaffRegistration15ViewController
@synthesize modelSwitch, brandAmbassadorSwitch, flyerDistributorSwitch, fieldMarketingManagerSwitch, dancerSwitch, waiterOrWaitressSwitch, productionAssistantSwitch, salesExecutiveSwitch, scrollView,
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
    directDepositDesired, DirectDepositRoutingNumber, DirectDepositAccountNumber;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testDataPassed];//testing
}

/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    return 1;
}//eom


- (IBAction)submitForm:(id)sender
{
    //verifying the data enter
    bool result = [self verifyDataEnter];
    if(result)
    {
        [self performSegueWithIdentifier:@"staffRegistration16" sender:self];
    }
    else
    {
        NSLog(@"missing some/all required fields");
    }
}//eo-action


/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"staffRegistration16"]){
        StaffRegistration16ViewController *controller = (StaffRegistration16ViewController *)segue.destinationViewController;
        
        //view controller 1
        controller.firstName                = self.firstName;
        controller.middleName               = self.middleName;
        controller.lastName                 = self.lastName;
        controller.nickName                 = self.nickName;
        controller.email                    = self.email;
        controller.password                 = self.password;
        controller.cellphone                = self.cellphone;
        
        //view controller 2
        controller.address                      = self.address;
        controller.city                         = self.city;
        controller.zipcode                      = self.zipcode;
        controller.stateSelected                = self.stateSelected;
        controller.djSelected                   = self.djSelected;
        controller.liveBandSelected             = self.liveBandSelected;
        controller.cateringCompanySelected      = self.cateringCompanySelected;
        controller.otherServicesSelected        = self.otherServicesSelected;
        
        //view controller 3
        controller.djDescription                = self.djDescription;
        controller.djWebsite                    = self.djWebsite;
        controller.djSocialMedia                = self.djSocialMedia;
        
        //view controller 4
        controller.liveBandDescription          = self.liveBandDescription;
        controller.liveBandWebsite              = self.liveBandWebsite;
        controller.liveBandSocialMedia          = self.liveBandSocialMedia;
        
        //view controller 5
        controller.cateringCompanyDescription   = self.cateringCompanyDescription;
        controller.cateringCompanyWebsite       = self.cateringCompanyWebsite;
        controller.cateringCompanySocialMedia   = self.cateringCompanySocialMedia;
        
        //view controller 6
        controller.otherServicesDescription     = self.otherServicesDescription;
        controller.otherServicesWebsite         = self.otherServicesWebsite;
        controller.otherServicesSocialMedia     = self.otherServicesSocialMedia;
        
        //view controller 7
        controller.dob                      = self.dob;
        controller.gender                   = self.gender;
        controller.languages                = self.languages;
        
        //view controller 8
        controller.ethnicity                = self.ethnicity;
        controller.typeOfLicense            = self.typeOfLicense;
        
        //view controller 9
        controller.height                   = self.height;
        controller.weight                   = self.weight;
        controller.hairColor                = self.hairColor;
        controller.eyeColor                 = self.eyeColor;
        controller.pantSize                 = self.pantSize;
        controller.shoeSize                 = self.shoeSize;
        controller.tshirtSize               = self.tshirtSize;
        controller.desiredHourlyRate        = self.desiredHourlyRate;
        controller.desiredWeeklyRate        = self.desiredWeeklyRate;
        controller.tattoos                  = self.tattoos;
        controller.piercings                = self.piercings;
        
        //view controller 10 - females ONLY
        controller.chestSize                = self.chestSize;
        controller.waistSize                = self.waistSize;
        controller.hipsSize                 = self.hipsSize;
        controller.dressSize                = self.dressSize;
        
        //view controller 11
        controller.typeCorporated           = self.typeCorporated; //0-not incorporated | 1-corporated
        controller.ssn                      = self.ssn;
        controller.ein                      = self.ein;
        controller.businessName             = self.businessName;
        controller.citiesWillingToWork      = self.citiesWillingToWork;
        controller.travel                   = self.travel; // 0 - not traveling | 1 - traveling
        controller.professionalInsurance    = self.professionalInsurance; // 0 - not prof insurance | 1 - prof insurance
        
        //view controller 14
        controller.directDepositDesired         = self.directDepositDesired;
        controller.DirectDepositRoutingNumber   = self.DirectDepositRoutingNumber;
        controller.DirectDepositAccountNumber   = self.DirectDepositAccountNumber;
        
        //view controller 15
        controller.isModel                      = self.modelSwitch.on;
        controller.isBrandAmbassador            = self.brandAmbassadorSwitch.on;
        controller.isFlyerDistributor           = self.flyerDistributorSwitch.on;
        controller.isFieldMarketingManager      = self.fieldMarketingManagerSwitch.on;
        controller.isDancer                     = self.dancerSwitch.on;
        controller.iswaiterOrWaitress           = self.waiterOrWaitressSwitch.on;
        controller.isProductionAssistant        = self.productionAssistantSwitch.on;
        controller.isSalesExecutive             = self.salesExecutiveSwitch.on;
        
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


-(void)testDataPassed
{
    
    NSLog(@" ");
    NSLog(@" ");
    NSLog(@" *****  Staff Registration| View controller #15 ******");
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
    
//    //view controller 15
//    NSLog(@" isModel:                   %d", self.isModel);
//    NSLog(@" isBrandAmbassador:         %d", self.isBrandAmbassador);
//    NSLog(@" isFlyerDistributor:        %d", self.isFlyerDistributor);
//    NSLog(@" isFieldMarketingManager:   %d", self.isFieldMarketingManager);
//    NSLog(@" isDancer:                  %d", self.isDancer);
//    NSLog(@" iswaiterOrWaitress:        %d", self.iswaiterOrWaitress);
//    NSLog(@" isProductionAssistant:     %d", self.isProductionAssistant);
//    NSLog(@" isSalesExecutive:          %d", self.isSalesExecutive);
//    
    NSLog(@" - - - - - - - - - - - - - ");
}//eom

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"MEMORY WARNING");
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
