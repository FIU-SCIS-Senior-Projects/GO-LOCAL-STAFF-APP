//
//  StaffRegistration3ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/16/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration3ViewController.h"
#import "StaffRegistration8ViewController.h"

//service headers:
#import "StaffRegistration4ViewController.h"
#import "StaffRegistration5ViewController.h"
#import "StaffRegistration6ViewController.h"
#import "StaffRegistration7ViewController.h"


#import "RegisteredStaff.h" //needed for staff registration


@interface StaffRegistration3ViewController ()
{
    NSMutableArray *staffTypeExperience;
    NSMutableArray *servicesExperience;
    BOOL djSelected;
    BOOL liveBandSelected;
    BOOL cateringCompanySelected;
    BOOL otherServicesSelected;
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

@synthesize scrollView,registeredStaff;

- (void)viewDidLoad {
    [super viewDidLoad];
  
}//eom

-(void)viewDidAppear:(BOOL)animated
{
//    [registeredStaff printUserData];
    
}//eom


#pragma mark - verify data

    /* verifying the below input fileds were filled:
     */
    - (BOOL)verifyDataEnter
    {
        //clearing list just incase
        self->staffTypeExperience = [[NSMutableArray alloc] init]; //creating
        
        self->servicesExperience = [[NSMutableArray alloc] init]; //creating array
        
        BOOL somethingSelected  = FALSE;
        
        if(self.brandAmbassadorSwitch.on)
        {
            [self->staffTypeExperience addObject:@"Brand Ambassador"];
            somethingSelected = TRUE;
            
        }

        if(self.cateringCompanySwitch.on)
        {
            [self->staffTypeExperience addObject:@"Catering Company"];
            self->cateringCompanySelected = true;
            somethingSelected = TRUE;
            [self->servicesExperience addObject:@"Catering Company"];
        }
        else
        {
            self->cateringCompanySelected= FALSE;
        }
        
        if(self.dancerSwitch.on)
        {
            [self->staffTypeExperience addObject:@"Dancer"];
            somethingSelected = TRUE;
        }
        
        if(self.djSwitch.on)
        {
            [self->staffTypeExperience addObject:@"Dj"];
            self->djSelected= true;
            somethingSelected = TRUE;
            
            [self->servicesExperience addObject:@"Dj"];
        }
        else
        {
            self->djSelected= FALSE;
        }
        
        if(self.fieldMarketingDistributorSwitch.on)
        {
            [self->staffTypeExperience addObject:@"Field Marketing Distributor"];
            somethingSelected = TRUE;
        }
        
        if(self.flyerDistributorSwitch.on)
        {
            [self->staffTypeExperience addObject:@"Flyer Distributor"];
            somethingSelected = TRUE;
        }
        
        if(self.liveBandSwitch.on)
        {
            [self->staffTypeExperience addObject:@"Live Band"];
            self->liveBandSelected = true;
            somethingSelected = TRUE;
            
            [self->servicesExperience addObject:@"Live Band"];
        }
        else
        {
            self->liveBandSelected = FALSE;
        }

        if(self.modelSwitch.on)
        {
            [self->staffTypeExperience addObject:@"Model"];
            somethingSelected = TRUE;
        }
        
        if(self.productionAssistantSwitch.on)
        {
            [self->staffTypeExperience addObject:@"Production"];
            somethingSelected = TRUE;
        }
        
        if(self.salesExecutiveSwitch.on)
        {
            [self->staffTypeExperience addObject:@"Sales Executive"];
            somethingSelected = TRUE;
        }

        if(self.waiterOrWaitressSwitch.on)
        {
            [self->staffTypeExperience addObject:@"Waiter Waitress"];
            somethingSelected = TRUE;
        }
        
        if(self.otherServicesSwitch.on)
        {
            [self->staffTypeExperience addObject:@"Other Services"];
            self->otherServicesSelected = true;
            somethingSelected = TRUE;
            
            [self->servicesExperience addObject:@"Other Services"];
        }
        else
        {
            self->otherServicesSelected= FALSE;
        }

        
    //    NSLog(@" staff experience %@", self->staffTypeExperience.description);//testing
    //
    //      //making sure atleast one experience is selected
    //    if(somethingSelected == FALSE)
    //    {
    //        [self showAlert:@"Registration Field" withMessage:@"Please select atleast one field" and:@"Okay"];
    //        return 0;
    //    }
        
        //updating values
        [registeredStaff setExperience:self->staffTypeExperience];
        [registeredStaff setServicesSelected:self->djSelected liveBand:self->liveBandSelected cateringCompany:self->cateringCompanySelected otherServices:self->otherServicesSelected];
        [registeredStaff setServiceExperience:self->servicesExperience];
        
          NSLog(@"final selection dj = %d | liveband = %d | catering = %d | other = %d", self->djSelected , self->liveBandSelected, self->cateringCompanySelected, self->otherServicesSelected);
        return 1;
    }//EOM



#pragma mark - sending data
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
        if(self->djSelected)
        {
            [self performSegueWithIdentifier:@"goToDJ" sender:self];
        }
        else if(self->liveBandSelected)
        {
            [self performSegueWithIdentifier:@"goToLiveBand" sender:self];
        }
        else if(self->cateringCompanySelected)
        {
            [self performSegueWithIdentifier:@"goToCateringCompany" sender:self];
        }
        else if(self->otherServicesSelected)
        {
            [self performSegueWithIdentifier:@"goToOtherServices" sender:self];
        }
        else
        {
            //moving to the next controller
            [self performSegueWithIdentifier:@"goToStaffRegister8" sender:self];
        }

    }//eom

    /* preparing the data to sent to the next view controller */
    -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
    {
        //no services selected
        if([segue.identifier isEqualToString:@"goToStaffRegister8"])
        {
            StaffRegistration8ViewController *controller = (StaffRegistration8ViewController *)segue.destinationViewController;
            
            controller.registeredStaff = registeredStaff;
        }
        else if([segue.identifier isEqualToString:@"goToDJ"]) //DJ
        {
            StaffRegistration4ViewController *controller = (StaffRegistration4ViewController *)segue.destinationViewController;
            
            controller.registeredStaff = registeredStaff;
            
        }
        else if([segue.identifier isEqualToString:@"goToLiveBand"]) //LIVE BAND
        {
            StaffRegistration5ViewController *controller = (StaffRegistration5ViewController *)segue.destinationViewController;

            controller.registeredStaff = registeredStaff;
        }
        else if([segue.identifier isEqualToString:@"goToCateringCompany"]) //CATERING COMPANY
        {
            StaffRegistration6ViewController *controller = (StaffRegistration6ViewController *)segue.destinationViewController;

            controller.registeredStaff = registeredStaff;
        }
        else if([segue.identifier isEqualToString:@"goToOtherServices"]) //OTHER SERVICES
        {
            StaffRegistration7ViewController *controller = (StaffRegistration7ViewController *)segue.destinationViewController;
           
            controller.registeredStaff = registeredStaff;
        }
    }//EOM


#pragma mark - helper methods
    /* create UIAlert*/
    -(void) showAlert:(NSString*)title withMessage:(NSString*)message and:(NSString*) cancelTitle
    {
        //creating controller
        UIAlertController * actionController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleDefault handler:nil];
        
        [actionController addAction:defaultAction];
        
        [self presentViewController:actionController animated:YES completion:nil];
    }//eom




@end
