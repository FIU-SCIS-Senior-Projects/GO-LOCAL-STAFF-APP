//
//  EmployerRegistration3ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/26/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisteredEmployer;

@interface EmployerRegistration3ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) RegisteredEmployer *registeredEmployer;

@property (weak, nonatomic) IBOutlet UISwitch *brandAmbassadorSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *cateringCompanySwitch;
@property (weak, nonatomic) IBOutlet UISwitch *dancerSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *djSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *flyerDistributorSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *fieldMarketingManagerSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *liveBandSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *modelSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *productionAssistantSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *salesExecutiveSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *waiterOrWaitressSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *otherServicesSwitch;

- (IBAction)submit:(id)sender;

@end
