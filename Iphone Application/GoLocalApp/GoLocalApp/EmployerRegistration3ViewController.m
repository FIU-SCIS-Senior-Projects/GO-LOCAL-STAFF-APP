//
//  EmployerRegistration3ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/26/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "EmployerRegistration3ViewController.h"
#import "EmployerRegistration4ViewController.h"

@interface EmployerRegistration3ViewController ()

@end

@implementation EmployerRegistration3ViewController
{
    NSMutableArray *employeesInterested;
}

@synthesize registeredEmployer, scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    //clearing list just incase
    self->employeesInterested = [[NSMutableArray alloc] init];
    
    BOOL somethingSelected  = FALSE;
    
    if(self.brandAmbassadorSwitch.on)
    {
        [self->employeesInterested addObject:@"Brand Ambassador"];
        somethingSelected = TRUE;
        
    }
    
    if(self.cateringCompanySwitch.on)
    {
        [self->employeesInterested addObject:@"Catering Company"];
        somethingSelected = TRUE;
    }
    
    if(self.dancerSwitch.on)
    {
        [self->employeesInterested addObject:@"Dancer"];
        somethingSelected = TRUE;
    }
    
    if(self.djSwitch.on)
    {
        [self->employeesInterested addObject:@"Dj"];
        somethingSelected = TRUE;
    }
    
    if(self.fieldMarketingManagerSwitch.on)
    {
        [self->employeesInterested addObject:@"Field Marketing Manager"];
        somethingSelected = TRUE;
    }
    
    if(self.flyerDistributorSwitch.on)
    {
        [self->employeesInterested addObject:@"Flyer Distributor"];
        somethingSelected = TRUE;
    }
    
    if(self.liveBandSwitch.on)
    {
        [self->employeesInterested addObject:@"Live Band"];
        somethingSelected = TRUE;
    }
    
    if(self.modelSwitch.on)
    {
        [self->employeesInterested addObject:@"Model"];
        somethingSelected = TRUE;
    }
    
    if(self.productionAssistantSwitch.on)
    {
        [self->employeesInterested addObject:@"Production"];
        somethingSelected = TRUE;
    }
    
    if(self.salesExecutiveSwitch.on)
    {
        [self->employeesInterested addObject:@"Sales Executive"];
        somethingSelected = TRUE;
    }
    
    if(self.waiterOrWaitressSwitch.on)
    {
        [self->employeesInterested addObject:@"Waiter Waitress"];
        somethingSelected = TRUE;
    }
    
    if(self.otherServicesSwitch.on)
    {
        [self->employeesInterested addObject:@"Other Services"];
        somethingSelected = TRUE;
    }
    
    
    //updating values
    
    return 1;
}//eom


-(IBAction)submit:(id)sender
{
    if( [self verifyDataEnter] )
    {
        [self performSegueWithIdentifier:@"goToEmployerRegister4" sender:self];
    }
}

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"goToEmployerRegister4"]){
        EmployerRegistration4ViewController *controller = (EmployerRegistration4ViewController *)segue.destinationViewController;
        
        controller.registeredEmployer = registeredEmployer;
    }
}//eom

@end
