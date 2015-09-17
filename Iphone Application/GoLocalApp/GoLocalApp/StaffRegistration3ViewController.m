//
//  StaffRegistration3ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/16/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration3ViewController.h"
#import "StaffRegistration8ViewController.h"

@interface StaffRegistration3ViewController ()
{
     NSMutableArray *staffTypeExperience;
}

@property (weak, nonatomic) IBOutlet UISwitch *modelSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *djSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *dancerSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *liveBandSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *brandAmbassadorSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *flyerDistributorSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *fieldMarketingDistributorSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *salesExecutiveSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *waiterOrWaitressSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *productionAssistantSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *cateringCompanySwitch;
@property (weak, nonatomic) IBOutlet UISwitch *otherServicesSwitch;


@end

@implementation StaffRegistration3ViewController

@synthesize djSelected, liveBandSelected, cateringCompanySelected, otherServicesSelected,
cellphone, completeAddress, gender, languages,
accountType, firstName, middleName, lastName, nickName, username, email, password, dateOfBirth;

- (void)viewDidLoad {
    [super viewDidLoad];
  
}//eom

-(void)viewDidAppear:(BOOL)animated
{
    
}//eom

/* verifying the below input fileds were filled:
 */
- (BOOL)verifyDataEnter
{
    //clearing list just incase
    staffTypeExperience = [[NSMutableArray alloc] init]; //creating array
    
    BOOL somethingSelected  = FALSE;
    
    if(self.modelSwitch.on)
    {
        [staffTypeExperience addObject:@"Model"];
        somethingSelected = TRUE;
    }
    
    if(self.djSwitch.on)
    {
        [staffTypeExperience addObject:@"Dj"];
        self.djSelected= true;
        somethingSelected = TRUE;
    }
    
    if(self.dancerSwitch.on)
    {
        [staffTypeExperience addObject:@"Dancer"];
        somethingSelected = TRUE;
    }
    
    
    if(self.liveBandSwitch.on)
    {
        [staffTypeExperience addObject:@"Live Band"];
        self.liveBandSelected = true;
        somethingSelected = TRUE;
    }
    
    
    if(self.brandAmbassadorSwitch.on)
    {
        [staffTypeExperience addObject:@"Brand Ambassador"];
        somethingSelected = TRUE;
    }
    
    
    if(self.flyerDistributorSwitch.on)
    {
        [staffTypeExperience addObject:@"Flyer Distributor"];
        somethingSelected = TRUE;
    }
    
    
    if(self.fieldMarketingDistributorSwitch.on)
    {
        [staffTypeExperience addObject:@"Field Marketing Distributor"];
        somethingSelected = TRUE;
    }
    
    
    if(self.salesExecutiveSwitch.on)
    {
        [staffTypeExperience addObject:@"Sales Executive"];
        somethingSelected = TRUE;
    }

    if(self.waiterOrWaitressSwitch.on)
    {
        [staffTypeExperience addObject:@"Waiter Waitress"];
        somethingSelected = TRUE;
    }

    
    if(self.productionAssistantSwitch.on)
    {
        [staffTypeExperience addObject:@"Production"];
        somethingSelected = TRUE;
    }

    
    if(self.cateringCompanySwitch.on)
    {
         [staffTypeExperience addObject:@"Cateing Company"];
        self.cateringCompanySelected = true;
        somethingSelected = TRUE;
    }
    
    if(self.otherServicesSwitch.on)
    {
         [staffTypeExperience addObject:@"Other Services"];
        self.otherServicesSelected = true;
        somethingSelected = TRUE;
    }

//    NSLog(@" staff experience %@", self->staffTypeExperience.description);

//    if(somethingSelected == FALSE)
//    {
//        [self showAlert:@"Registration Field" withMessage:@"Please select atleast one field" and:@"Okay"];
//        return 0;
//    }
    
    return 1;
}//EOM

/* */
- (IBAction)submitForm:(id)sender
{
    bool result = [self verifyDataEnter];
    if(result)
    {
        
        [self routeToProperController];
    }
    else
    {
        NSLog(@"missing some/all required fields on staffRegistration3");
    }

}//eoa

/* route to proper controllers */
-(void) routeToProperController
{
//    if(self.djSelected){
//        [self performSegueWithIdentifier:@"toDj" sender:self];
//    }
//    else if(self.liveBandSelected){
//        [self performSegueWithIdentifier:@"toLiveBand" sender:self];
//    }
//    else if(self.cateringCompanySelected){
//        [self performSegueWithIdentifier:@"toCateringCompany" sender:self];
//    }
//    else if(self.otherServicesSelected){
//        [self performSegueWithIdentifier:@"toOtherServices" sender:self];
//    }
//    else{
        //moving to the next controller
            [self performSegueWithIdentifier:@"goToStaffRegister4" sender:self];
//    }

}//eom

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //        controller.djSelected                   =self.djSelected;
    //        controller.liveBandSelected             =self.liveBandSelected;
    //        controller.cateringCompanySelected      =self.cateringCompanySelected;
    //        controller.otherServicesSelected        =self.otherServicesSelected;
    
 
    if([segue.identifier isEqualToString:@"goToStaffRegister8"]){
        StaffRegistration8ViewController *controller = (StaffRegistration8ViewController *)segue.destinationViewController;
        
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
    }
}//EOM

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
    NSLog(@" *****  Staff Registration| View controller #3 ******");
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
    
    
    NSLog(@" - - - - - - - - - - - - - ");
}//eom


@end
