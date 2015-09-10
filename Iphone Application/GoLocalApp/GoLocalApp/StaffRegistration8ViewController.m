//
//  StaffRegistration8ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration8ViewController.h"
#import "StaffRegistration9ViewController.h"

@interface StaffRegistration8ViewController ()

@end

@implementation StaffRegistration8ViewController
{
    int ethnicityRowSelected;
}

@synthesize typeOfLicense, driverLicense, commercialLicense, ethnicityPicker, ethnicity,ethnicitiesOptions,scrollView,
    address, city, zipcode, stateSelected, firstName, middleName, lastName, nickName, email, password, cellphone, dob, gender, languages;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //setting up UIpicker for states selection
    ethnicitiesOptions = [[NSArray alloc] initWithObjects:@"",
                                                        @"Non-Hispanic White or Euro-American",
                                                        @"Black, Afro-Caribbean, or African American",
                                                        @"Latino or Hispanic American",
                                                        @"East Asian or Asian American",
                                                        @"South Asian or Indian American",
                                                        @"Middle Eastern or Arab American",
                                                        @"Native American or Alaskan Native",
                                                        @"Other",
                                                        nil];
    
        [self setUpTapGesture];
    
    [self testDataPassed];//testing
    
}//eom

/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    //double checking type of license is set
    if(self.driverLicense.on){
        self.typeOfLicense = false;
    }
    else {
        self.typeOfLicense = true;
    }
    
    //double checking ethnicity is set
    if(ethnicityRowSelected < 1)
    {
        [self showAlert:@"Registration Field" withMessage:@"Missing the ethnicity field" and:@"Okay"];
        return 0;
    }
    else
    {
        self.ethnicity = ethnicityRowSelected;
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
        //    moving to the next controller
        [self performSegueWithIdentifier:@"staffRegistration9" sender:self];
    }
    else
    {
        NSLog(@"missing some/all required fields");
    }
}//eom

- (IBAction)driverLicenseChanged:(id)sender {
    if(self.driverLicense.on){
        [self.commercialLicense setOn:false];
        self.typeOfLicense = false;
    }
    else {
        [self.commercialLicense setOn:true];
        self.typeOfLicense = true;
    }
}//eom

- (IBAction)commercialLicenseChanged:(id)sender {
    if(self.commercialLicense.on){
        [self.driverLicense setOn:false];
        self.typeOfLicense = true;
    }
    else {
        [self.driverLicense setOn:true];
        self.typeOfLicense = false;
    }
}//eom

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"staffRegistration9"]){
        StaffRegistration9ViewController *controller = (StaffRegistration9ViewController *)segue.destinationViewController;
        //view controller 1 & 2 data
        
        controller.firstName                = self.firstName;
        controller.middleName               = self.middleName;
        controller.lastName                 = self.lastName;
        controller.nickName                 = self.nickName;
        controller.email                    = self.email;
        controller.password                 = self.password;
        controller.cellphone                = self.cellphone;
        controller.address                  = self.address;
        controller.city                     = self.city;
        controller.zipcode                  = self.zipcode;
        controller.stateSelected            = self.stateSelected;
        controller.djSelected               = self.djSelected;
        controller.liveBandSelected         = self.liveBandSelected;
        controller.cateringCompanySelected  = self.cateringCompanySelected;
        controller.otherServicesSelected    = self.otherServicesSelected;

        controller.dob                      = self.dob;
        controller.gender                   = self.gender;
        controller.languages                = self.languages;
        
        
        controller.ethnicity                = self.ethnicity;
        controller.typeOfLicense            = self.typeOfLicense;
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

/****** UIPicker Methods ********/
        // returns the number of 'columns' to display.
        - (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
        {
            return 1;
        }

        // returns the # of rows in each component..
        - (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
        {
            return [ethnicitiesOptions count];
        }

        #pragma mark - UIPickerView Delegate
        - (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
        {
            return 30.0;
        }

        - (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
        {
            return [ethnicitiesOptions objectAtIndex:row];
        }

        //If the user chooses from the pickerview, it calls this function;
        - (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
        {
            //Let's print in the console what the user had chosen;
//            NSLog(@"Chosen item: %@", [ethnicitiesOptions objectAtIndex:row]);
//            NSLog(@"row is %ld", (long)row);
            ethnicityRowSelected = (int)row;
        }//eom

        /* uipicker delegate method to change font size and type*/
        - (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
            
            UILabel *label = [[UILabel alloc] init];
            label.backgroundColor = [UIColor blueColor];        //background color
            label.textColor = [UIColor whiteColor];             //text color
//            label.textAlignment = NSTextAlignmentCenter;        //text aligngment
            label.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:8];
            
            //WithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 60)];
            
            label.text = [ethnicitiesOptions objectAtIndex:row];
            
            return label;
        }


-(void)testDataPassed
{
    
    NSLog(@" ");
    NSLog(@" ");
    NSLog(@" *****  Staff Registration| View controller #8 ******");
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
    
//    //view controller 8
//    NSLog(@" ethnicity:     %d", self.ethnicity);//see db legend
//    NSLog(@" typeOfLicense: %d", self.typeOfLicense);//0-driver 1-commercial
//    
//    //view controller 9
//    NSLog(@" height:            %@", self.height);
//    NSLog(@" weight:            %@", self.weight);
//    NSLog(@" hairColor:         %@", self.hairColor);
//    NSLog(@" eyeColor:          %@", self.eyeColor);
//    NSLog(@" pantSize:          %@", self.pantSize);
//    NSLog(@" shoeSize:          %@", self.shoeSize);
//    NSLog(@" tshirtSize:        %@", self.tshirtSize);
//    NSLog(@" desiredHourlyRate: %@", self.desiredHourlyRate);
//    NSLog(@" desiredWeeklyRate: %@", self.desiredWeeklyRate);
//    NSLog(@" tattoos:           %d", self.tattoos);//0 - no | 1 - yes
//    NSLog(@" piercings:         %d", self.piercings);//0 - no | 1 - yes
//    
//    //view controller 10 - females ONLY
//    NSLog(@" chestSize: %@", self.chestSize);
//    NSLog(@" waistSize: %@", self.waistSize);
//    NSLog(@" hipsSize: %@", self.hipsSize);
//    NSLog(@" dressSize: %@", self.dressSize);
//    
//    //view controller 11
//    NSLog(@" typeCorporated:        %d", self.typeCorporated);//0-not incorporated| 1- corporated
//    NSLog(@" ssn:                   %@", self.ssn);//NotIncorporated field
//    NSLog(@" ein:                   %@", self.ein);         //incorporated field
//    NSLog(@" businessName:          %@", self.businessName);//incorporated field
//    NSLog(@" citiesWillingToWork:   %@", self.citiesWillingToWork);
//    NSLog(@" travel:                %d", self.travel);
//    NSLog(@" professionalInsurance: %d", self.professionalInsurance);
//    
//    
//    //view controller 14
//    NSLog(@" directDepositDesired:          %d", self.directDepositDesired);
//    NSLog(@" DirectDepositRoutingNumber:    %@", self.DirectDepositRoutingNumber);
//    NSLog(@" DirectDepositAccountNumber:    %@", self.DirectDepositAccountNumber);
//    
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
