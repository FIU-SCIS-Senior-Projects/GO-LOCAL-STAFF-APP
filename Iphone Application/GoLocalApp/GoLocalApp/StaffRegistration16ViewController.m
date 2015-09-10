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
    
    [self sendDataToServer];
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

/* terms and agreements */
- (IBAction)agreeTermsValueChanged:(id)sender {
    
    if(self.agreeTermsSwitch.on)
    {
        bool result = [self verifyDataEnter];
        if(result)
        {
            //since user to terms, display 'submit registration' button
            self.submitButton.hidden = NO;
        }
    }
    else
    {
        self.submitButton.hidden = YES;
    }
    
}//eo-action

/* sends data to server */
-(void)sendDataToServer
{
        NSString *serverAddress = @"http://45.55.208.175/Website/jsonReceiver.php";//hard coding website
    
        /*** preparing data to be sent ***/
//        //data sending
//        NSString *DBfirstName           = self.firstName;
//        NSString *DBmiddleName          = self.middleName;
//        NSString *DBlastName            = self.lastName ;
//        NSString *DBnickName            = self.nickName ;
//        NSString *DBemail               = self.email ;
//        NSString *DBpassword            = self.password ;
//        NSString *DBcellphone           = self.cellphone ;
//        NSString *DBaddress                     = self.address ;
//        NSString *DBcity                        = self.city ;
//        NSString *DBzipcode                     = self.zipcode ;
//        NSString *DBstateSelected               = self.stateSelected ;
//        NSString *DBdjSelected                  = [NSString stringWithFormat:@"%d",self.djSelected];
//        NSString *DBliveBandSelected            = [NSString stringWithFormat:@"%d",self.liveBandSelected];
//        NSString *DBcateringCompanySelected     = [NSString stringWithFormat:@"%d",self.cateringCompanySelected];
//        NSString *DBotherServicesSelected       = [NSString stringWithFormat:@"%d",self.otherServicesSelected];
//        NSString *DBdjDescription       = self.djDescription ;
//        NSString *DBdjWebsite           = self.djWebsite ;
//        NSString *DBdjSocialMedia       = self.djSocialMedia ;
//        NSString *DBliveBandDescription     = self.liveBandDescription ;
//        NSString *DBliveBandWebsite         = self.liveBandWebsite ;
//        NSString *DBliveBandSocialMedia     = self.liveBandSocialMedia ;
//        NSString *DBcateringCompanyDescription      = self.cateringCompanyDescription ;
//        NSString *DBcateringCompanyWebsite          = self.cateringCompanyWebsite ;
//        NSString *DBcateringCompanySocialMedia      = self.cateringCompanySocialMedia ;
//        NSString *DBotherServicesDescription    = self.otherServicesDescription ;
//        NSString *DBotherServicesWebsite        = self.otherServicesWebsite ;
//        NSString *DBotherServicesSocialMedia    = self.otherServicesSocialMedia ;
//        NSString *DBdob                                 = self.dob ;
//        NSString *DBgender                              = [NSString stringWithFormat:@"%d",self.gender];
//        NSString *DBlanguages                           = self.languages ;
//        NSString *DBethnicity       = [NSString stringWithFormat:@"%d",self.ethnicity];
//        NSString *DBtypeOfLicense   = [NSString stringWithFormat:@"%d",self.typeOfLicense];
//        NSString *DBheight              = self.height ;
//        NSString *DBweight              = self.weight ;
//        NSString *DBhairColor           = self.hairColor ;
//        NSString *DBeyeColor            = self.eyeColor ;
//        NSString *DBpantSize            = self.pantSize ;
//        NSString *DBshoeSize            = self.shoeSize ;
//        NSString *DBtshirtSize          = self.tshirtSize ;
//        NSString *DBdesiredHourlyRate   = self.desiredHourlyRate ;
//        NSString *DBdesiredWeeklyRate   = self.desiredWeeklyRate ;
//        NSString *DBtattoos             = [NSString stringWithFormat:@"%d",self.tattoos];
//        NSString *DBpiercings           = [NSString stringWithFormat:@"%d",self.piercings];
////        NSString *DBchestSize       = self.chestSize ;
////        NSString *DBwaistSize       = self.waistSize ;
////        NSString *DBhipsSize        = self.hipsSize ;
////        NSString *DBdressSize       = self.dressSize ;
////        NSString *DBtypeCorporated          = [NSString stringWithFormat:@"%d",self.typeCorporated];
////        NSString *DBssn                     = self.ssn ;
////        NSString *DBein                     = self.ein ;
////        NSString *DBbusinessName            = self.businessName ;
////        NSString *DBcitiesWillingToWork     = self.citiesWillingToWork ;
////        NSString *DBtravel                  = [NSString stringWithFormat:@"%d",self.travel];
////        NSString *DBprofessionalInsurance   = [NSString stringWithFormat:@"%d",self.professionalInsurance];
////        NSString *DBdirectDepositDesired        = [NSString stringWithFormat:@"%d",self.directDepositDesired];

    
        //converting items to be send as Dictionary items
        NSDictionary *tmp = [[NSDictionary alloc] initWithObjectsAndKeys:
             self.firstName,  @"firstName",
             self.middleName, @"middleName",
             self.lastName, @"lastName",
             self.nickName, @"nickName",
             self.email, @"email",
             self.password, @"password",
             self.cellphone, @"cellphone",
                             
             self.city, @"city",
             self.zipcode, @"zipcode",
             self.stateSelected, @"stateSelected",
             [NSString stringWithFormat:@"%d",self.djSelected], @"djSelected",
             [NSString stringWithFormat:@"%d",self.liveBandSelected], @"liveBandSelected",
             [NSString stringWithFormat:@"%d",self.cateringCompanySelected], @"cateringCompanySelected",
             [NSString stringWithFormat:@"%d",self.otherServicesSelected], @"otherServicesSelected",

                             
             self.djDescription,  @"djDescription",
             self.djWebsite, @"djWebsite",
             self.djSocialMedia, @"djSocialMedia",
                             
             self.liveBandDescription, @"liveBandDescription",
             self.liveBandWebsite, @"liveBandWebsite",
             self.liveBandSocialMedia, @"liveBandSocialMedia",
                             
             self.cateringCompanyDescription, @"cateringCompanyDescription",
             self.cateringCompanyWebsite, @"cateringCompanyWebsite",
             self.cateringCompanySocialMedia, @"cateringCompanySocialMedia",
                             
             self.otherServicesDescription, @"otherServicesDescription",
             self.otherServicesWebsite, @"otherServicesWebsite",
             self.otherServicesSocialMedia, @"otherServicesSocialMedia",
                             
            self.dob, @"dob",
            [NSString stringWithFormat:@"%d",self.gender], @"gender",
            self.languages, @"languages",
                             
             [NSString stringWithFormat:@"%d",self.ethnicity], @"ethnicity",
             [NSString stringWithFormat:@"%d",self.typeOfLicense], @"typeOfLicense",

                             
             self.height, @"height",
             self.weight, @"weight",
             self.hairColor, @"hairColor",
             self.eyeColor, @"eyeColor",
             self.pantSize, @"pantSize",
             self.shoeSize, @"shoeSize",
             self.tshirtSize, @"tshirtSize",
             self.desiredHourlyRate, @"desiredHourlyRate",
             self.desiredWeeklyRate, @"desiredWeeklyRate",
             [NSString stringWithFormat:@"%d",self.tattoos], @"firstName",
             [NSString stringWithFormat:@"%d",self.piercings], @"middleName",
                             
             self.chestSize, @"chestSize",
             self.waistSize, @"waistSize",
             self.hipsSize, @"hipsSize",
             self.dressSize, @"dressSize",
                             
             [NSString stringWithFormat:@"%d",self.typeCorporated], @"typeCorporated",
             self.ssn, @"ssn",
             self.ein, @"ein",
             self.businessName, @"businessName",
             self.citiesWillingToWork, @"citiesWillingToWork",
             [NSString stringWithFormat:@"%d",self.travel], @"travel",
             [NSString stringWithFormat:@"%d",self.professionalInsurance], @"professionalInsurance",
                             
             [NSString stringWithFormat:@"%d",self.directDepositDesired], @"directDepositDesired",
             self.DirectDepositRoutingNumber, @"DirectDepositRoutingNumber",
             self.DirectDepositAccountNumber, @"DirectDepositAccountNumber",
                             
             [NSString stringWithFormat:@"%d",self.isModel], @"isModel",
             [NSString stringWithFormat:@"%d",self.isBrandAmbassador], @"isBrandAmbassador",
             [NSString stringWithFormat:@"%d",self.isFlyerDistributor], @"isFlyerDistributor",
             [NSString stringWithFormat:@"%d",self.isFieldMarketingManager], @"isFieldMarketingManager",
             [NSString stringWithFormat:@"%d",self.isDancer], @"isDancer",
             [NSString stringWithFormat:@"%d",self.iswaiterOrWaitress], @"iswaiterOrWaitress",
             [NSString stringWithFormat:@"%d",self.isProductionAssistant], @"isProductionAssistant",
             [NSString stringWithFormat:@"%d",self.isSalesExecutive], @"isSalesExecutive",
             nil];
    
        /*** Sending data ***/
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                        initWithURL:[NSURL URLWithString:  serverAddress ]];
    
        [request setHTTPMethod:@"POST"]; //request type
        
        //sending data
        NSError *error;
        NSData *postdata = [NSJSONSerialization dataWithJSONObject:tmp options:0 error:&error];
        [request setHTTPBody:postdata];
    
//        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//        NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
        [NSURLConnection connectionWithRequest:request delegate:self];
}//eo-action

/* responce from server */
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    
    NSLog(@" responce: %@", httpResponse.description);
    
    NSInteger statusCode = httpResponse.statusCode;
    
    NSLog(@" status Code: %ld", (long)statusCode);
//    NSString *string = [NSString stringWithFormat:@"%ld", (long)statusCode];
    
}//eo-action

/* data received from server */
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData{
    NSString *dataResponce = [[NSString alloc] initWithData:theData encoding:NSUTF8StringEncoding];
    NSLog(@" responce from server %@",dataResponce);
}

/* error occurred sending data to server */
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@" Failed with error '%@'", error);
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
