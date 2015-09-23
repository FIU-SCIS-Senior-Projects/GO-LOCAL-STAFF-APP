//
//  StaffRegistration16ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/8/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration14ViewController.h"
#import "StaffDatabase.h"

@interface StaffRegistration14ViewController ()
{
    NSString * genderSelected;
    NSString * selectedDJ;
    NSString * selectedLiveBand;
    NSString * selectedCateringCompany;
    NSString * selectedOtherServices;
    StaffDatabase *staffDB;
    
    UIImage * selfiePhoto;
    UIImage * bodyPhoto;
}
@end

@implementation StaffRegistration14ViewController

@synthesize scrollView,
directDepositDesired, directDepositRoutingNumber, directDepositAccountNumber,
isIncorporated, ssn, ein, businessName,
chestSize, waistSize, hipsSize, dressSize, desiredHourlyRate, desiredWeeklyRate, travelPercentage,
hasDriverLicense, hasCommercialLicense, hasTattos, hasPiercings, ethnicity, height, weight, hairColor, eyeColor, pantSize, shoeSize, tshirtSize,
djCostOfService, liveBandCostOfService, cateringCompanyCostOfService, otherServicesCostOfService,
staffTypeExperience, djSelected, liveBandSelected, cateringCompanySelected, otherServicesSelected,
cellphone, completeAddress, gender, languages,
accountType, firstName, middleName, lastName, nickName, username, email, password, dateOfBirth;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testDataPassed];//testing
    
   
}//eom

-(void)viewDidAppear:(BOOL)animated
{
    [self testDataPassed];//testing
    
}//eom


/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    
    if(!self.agreeTermsSwitch.on)
    {
        [self showAlert:@"Registration Field" withMessage:@"Please read and agree to terms" and:@"Okay"];
        return 0;
    }

    
    //genderSelected
    if(self.gender)//male
    {
        self->genderSelected = @"Male";
    }
    else
    {
        self->genderSelected = @"Female";
    }
    
    //updating services selection
    self->selectedDJ                = [NSString stringWithFormat:@"%d",self.djSelected ];
    self->selectedLiveBand          = [NSString stringWithFormat:@"%d",self.liveBandSelected ];
    self->selectedCateringCompany   = [NSString stringWithFormat:@"%d",self.cateringCompanySelected ];
    self->selectedOtherServices     = [NSString stringWithFormat:@"%d",self.otherServicesSelected ];
    
    //getting images from coredata
    UIImage * selfieImageResult = [staffDB getSelfiePhoto];
    if(selfieImageResult)
    {
        self->selfiePhoto = selfieImageResult;
    }
    UIImage * bodyImageResult = [staffDB getSelfiePhoto];
    if(bodyImageResult)
    {
        self->bodyPhoto = bodyImageResult;
    }
    
    return 1;
}//eom


/* terms and agreements */
- (IBAction)agreeTermsValueChanged:(id)sender
{
    
    if(self.agreeTermsSwitch.on)
    {
        bool result = [self verifyDataEnter];
        if(result)
        {
            //since user to terms, display 'submit registration' button
            self.submitButton.hidden = NO;
            [self sendDataToServer];
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
        NSString *serverAddress = @"http://45.55.208.175/Website/jsonPOST_registration.php";//hard coding website
    
        /*** preparing data to be sent ***/
    
//        NSDictionary *tmp = [[NSDictionary alloc] initWithObjectsAndKeys: //converting items to be send as Dictionary items
//sample data
//         @"Luis",  @"firstName",
//         @"Andres", @"middleName",
//         @"Castillo", @"lastName",
//         @"Lu", @"nickName",
//         @"luoandre29@hotmail.com", @"email",
//         @"2987Andres", @"password",
//         @"3056099250", @"cellphone",
//         
//         @"Miami", @"city",
//         @"33016", @"zipcode",
//         @"FL", @"stateSelected",
//         @"0", @"djSelected",
//         @"0", @"liveBandSelected",
//         @"0", @"cateringCompanySelected",
//         @"0", @"otherServicesSelected",
//         
//         
//         @"",  @"djDescription",
//         @"", @"djWebsite",
//         @"", @"djSocialMedia",
//         
//         @"", @"liveBandDescription",
//         @"", @"liveBandWebsite",
//         @"", @"liveBandSocialMedia",
//         
//         @"", @"cateringCompanyDescription",
//         @"", @"cateringCompanyWebsite",
//         @"", @"cateringCompanySocialMedia",
//         
//         @"", @"otherServicesDescription",
//         @"", @"otherServicesWebsite",
//         @"", @"otherServicesSocialMedia",
//         
//         @"11/29/1987", @"dob",
//         @"male", @"gender",
//         @"english,spanish", @"languages",
//         
//         @"3", @"ethnicity",
//         @"0", @"typeOfLicense",
//         
//         
//         @"5'1", @"height",
//         @"150", @"weight",
//         @"black", @"hairColor",
//         @"brown", @"eyeColor",
//         @"30", @"pantSize",
//         @"8", @"shoeSize",
//         @"M", @"tshirtSize",
//         @"30", @"desiredHourlyRate",
//         @"3000", @"desiredWeeklyRate",
//         @"0", @"tattoos",
//         @"0", @"piercings",
//         
//         @"", @"chestSize",
//         @"", @"waistSize",
//         @"", @"hipsSize",
//         @"", @"dressSize",
//         
//         @"0", @"typeCorporated",
//         @"898347922", @"ssn",
//         @"", @"ein",
//         @"", @"businessName",
//         @"miami, kendall", @"citiesWillingToWork",
//         @"0", @"travel",
//         @"0", @"professionalInsurance",
//         
//         @"1", @"directDepositDesired",
//         @"898847731032837", @"DirectDepositRoutingNumber",
//         @"99899837782982333", @"DirectDepositAccountNumber",
//         
//         @"0", @"isModel",
//         @"0", @"isBrandAmbassador",
//         @"0", @"isFlyerDistributor",
//         @"0", @"isFieldMarketingManager",
//         @"0", @"isDancer",
//         @"0", @"iswaiterOrWaitress",
//         @"0", @"isProductionAssistant",
//         @"0", @"isSalesExecutive",
//         nil];

    
        //converting items to be send as Dictionary items
        NSDictionary *tmp = [[NSDictionary alloc] initWithObjectsAndKeys:
        self.accountType,  @"registration_type",
        self.firstName,  @"firstName",
        self.middleName, @"middleName",
        self.lastName, @"lastName",
        self.nickName, @"nickName",
        self.email, @"email",
        self.username, @"username",
        self.password, @"password",
        self.dateOfBirth, @"dob",
        self.cellphone, @"cellphone",
        self.completeAddress, @"completeAddress",
        self->selectedDJ , @"djSelected",
        self->selectedLiveBand , @"liveBandSelected",
        self->selectedCateringCompany , @"cateringCompanySelected",
        self->selectedOtherServices , @"otherServicesSelected",
        self.djDescription,  @"djDescription",
        self.djWebsite, @"djWebsite",
        self.djSocialMedia, @"djSocialMedia",
        self.djCostOfService, @"djCostOfService",
        self.liveBandDescription, @"liveBandDescription",
        self.liveBandWebsite, @"liveBandWebsite",
        self.liveBandSocialMedia, @"liveBandSocialMedia",
        self.liveBandCostOfService, @"liveBandCostOfService",
        self.cateringCompanyDescription, @"cateringCompanyDescription",
        self.cateringCompanyWebsite, @"cateringCompanyWebsite",
        self.cateringCompanySocialMedia, @"cateringCompanySocialMedia",
        self.cateringCompanyCostOfService, @"cateringCompanyCostOfService",
        self.otherServicesDescription, @"otherServicesDescription",
        self.otherServicesWebsite, @"otherServicesWebsite",
        self.otherServicesSocialMedia, @"otherServicesSocialMedia",
        self.otherServicesCostOfService, @"otherServicesCostOfService",
        self->genderSelected, @"gender",
        self.languages, @"languages",
        self.staffTypeExperience, @"experience",
        self.hasDriverLicense, @"hasDriverLicense",
        self.hasCommercialLicense, @"hasCommercialLicense",
        self.hasTattos, @"Tattos",
        self.hasPiercings, @"Piercings",
        self.ethnicity, @"ethnicity",
        self.height, @"height",
        self.weight, @"weight",
        self.hairColor, @"hairColor",
        self.eyeColor, @"eyeColor",
        self.pantSize, @"pantSize",
        self.shoeSize, @"shoeSize",
        self.tshirtSize, @"tshirtSize",
        self.chestSize, @"chestSize",
        self.waistSize, @"waistSize",
        self.hipsSize, @"hipsSize",
        self.dressSize, @"dressSize",
        self.hasProfessionalInsurance, @"ProfessionalInsurance",
        self.isIncorporated, @"Incorporated",
        self.ssn, @"ssn",
        self.ein, @"ein",
        self.businessName, @"businessName",
        self.desiredHourlyRate, @"desiredHourlyRate",
        self.desiredWeeklyRate, @"desiredWeeklyRate",
        self.travelPercentage, @"travelPercentage",
        self.directDepositDesired, @"DirectDeposit",
        self.directDepositRoutingNumber, @"DirectDepositRoutingNumber",
        self.directDepositAccountNumber, @"DirectDepositAccountNumber",
        nil];
    
        /*** Sending data ***/
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                        initWithURL:[NSURL URLWithString:  serverAddress ]];
    
        [request setHTTPMethod:@"POST"]; //request type
        
        //sending data
        NSError *error;
        NSData *postdata = [NSJSONSerialization dataWithJSONObject:tmp options:0 error:&error];
        [request setHTTPBody:postdata];
    
    
        NSLog(@" sending post data: %@", postdata);
    
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


-(void)testDataPassed
{
    NSLog(@" ");
    NSLog(@" ");
    NSLog(@" *****  Staff Registration| View controller #14 ******");
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
    NSLog(@" staff experience:          %@", self.staffTypeExperience);
    NSLog(@" Dj Selected?               %d", self.djSelected);
    NSLog(@" Live Band Selected?        %d", self.liveBandSelected);
    NSLog(@" Catering Company Selected? %d", self.cateringCompanySelected);
    NSLog(@" Other Services Selected?   %d", self.otherServicesSelected);
    
    //view controller 4
    NSLog(@" djDescription:      %@", self.djDescription);
    NSLog(@" djWebsite:          %@", self.djWebsite);
    NSLog(@" djSocialMedia:      %@", self.djSocialMedia);
    NSLog(@" djCostOfService:    %@", self.djCostOfService);
    
    //view controller 5
    NSLog(@" liveBandDescription:      %@", self.liveBandDescription);
    NSLog(@" liveBandWebsite:          %@", self.liveBandWebsite);
    NSLog(@" liveBandSocialMedia:      %@", self.liveBandSocialMedia);
    NSLog(@" liveBandCostOfService:    %@", self.liveBandCostOfService);
    
    //view controller 6
    NSLog(@" cateringCompanyDescription:      %@", self.cateringCompanyDescription);
    NSLog(@" cateringCompanyWebsite:          %@", self.cateringCompanyWebsite);
    NSLog(@" cateringCompanySocialMedia:      %@", self.cateringCompanySocialMedia);
    NSLog(@" cateringCompanyCostOfService:    %@", self.cateringCompanyCostOfService);
    
    //view controller 7
    NSLog(@" otherServicesDescription:      %@", self.otherServicesDescription);
    NSLog(@" otherServicesWebsite:          %@", self.otherServicesWebsite);
    NSLog(@" otherServicesSocialMedia:      %@", self.otherServicesSocialMedia);
    NSLog(@" otherServicesCostOfService:    %@", self.otherServicesCostOfService);
    
    //view controller 8
    NSLog(@" driver license?        %d", self.hasDriverLicense);
    NSLog(@" commercial license?    %d", self.hasCommercialLicense);
    NSLog(@" tattoos?               %d", self.hasTattos);
    NSLog(@" piercings?             %d", self.hasPiercings);
    NSLog(@" ethnicity              %@", self.ethnicity);
    NSLog(@" height                 %@", self.height);
    NSLog(@" weight                 %@", self.weight);
    NSLog(@" hairColor              %@", self.hairColor);
    NSLog(@" eyeColor               %@", self.eyeColor);
    NSLog(@" pantSize               %@", self.pantSize);
    NSLog(@" shoeSize               %@", self.shoeSize);
    NSLog(@" tshirtSize             %@", self.tshirtSize);
    
    //view controller 9
    NSLog(@" chestSize              %@", self.chestSize);
    NSLog(@" waistSize              %@", self.waistSize);
    NSLog(@" hipsSize               %@", self.hipsSize);
    NSLog(@" dressSize              %@", self.dressSize);
    
    //view controller 10
    NSLog(@" has professional insurance?    %d", self.hasProfessionalInsurance);
    NSLog(@" is Incorporated ?              %d", self.isIncorporated);
    NSLog(@" ssn                            %@", self.ssn);
    NSLog(@" ein                            %@", self.ein);
    NSLog(@" business Name                  %@", self.businessName);
    NSLog(@" desired Hourly Rate            %@", self.desiredHourlyRate);
    NSLog(@" desired Weekly Rate            %@", self.desiredWeeklyRate);
    NSLog(@" travel Percentage              %@", self.travelPercentage);
    
    //view controller 13
    NSLog(@" direct deposit selected    %d", self.directDepositDesired);
    NSLog(@" direct deposit routing     %@", self.directDepositRoutingNumber);
    NSLog(@" direct deposit account     %@", self.directDepositAccountNumber);
    
    
    NSLog(@" - - - - - - - - - - - - - ");
}//eom



@end
