//
//  MapModeViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 11/12/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "EmployerMapViewController.h"
#import "StaffSearchResultTableViewController.h"

@interface EmployerMapViewController ()

@end

@implementation EmployerMapViewController

@synthesize staffDetail;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpMap];
    
}//eo-view


-(void)viewDidAppear:(BOOL)animated
{

}//eo-view

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* setups the initial map */
-(void)setUpMap
{
    //updating mapview settings
    self.myMapView.autoresizingMask         = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
    self.myMapView.showsUserLocation        = YES;  //shows/hides the user the current location
    self.myMapView.showsTraffic             = YES;  //shows/hides traffic on map
    self.myMapView.showsPointsOfInterest    = NO;   //shows/hides points of interest on the map
    self.myMapView.showsCompass             = NO;   //shows/hides compass on map
    
    //ask user for permission
    locationManager             = [[CLLocationManager alloc]init];
    locationManager.delegate    = self;
    [locationManager requestWhenInUseAuthorization];
    [locationManager requestAlwaysAuthorization];
    
    [self updateTheUsersCurrentLocation];
//    [self UpdateMapRegion:userCurrentLocation];
//    [self addAnnotationInMap:userCurrentLocation];
    

}//eom

/* */
- (IBAction)goToListMode:(UIBarButtonItem *)sender
{
    //moving to the previous controller
    [self performSegueWithIdentifier:@"goToStaffSearchList" sender:self];    
}//eo-action

/* */
- (IBAction)changeMapStyle:(id)sender
{
    if( self.segmentedControl.selectedSegmentIndex == 0)
    {
        self.myMapView.mapType = MKMapTypeStandard;
    }
    else if( self.segmentedControl.selectedSegmentIndex == 1)
    {
        self.myMapView.mapType = MKMapTypeHybrid;
    }
}//eo-action

/* */
- (IBAction)locateMe:(id)sender
{
//    [self updateTheUsersCurrentLocation];
//    [self UpdateMapRegion:userCurrentLocation];
//    [self addAnnotationInMap:userCurrentLocation];
//    
}//eo-action

//MARK:
/* */
-(void)updateTheUsersCurrentLocation
{
    //starts updating the user current location
    [locationManager startUpdatingLocation];
    
    //getting coordinates of the current location
    userCurrentLocation = locationManager.location.coordinate;
    
    //stop updating the user current location
    [locationManager stopUpdatingLocation];
}//eom


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.identifier isEqualToString:@"goToStaffSearchList"])
    {
        StaffSearchResultTableViewController *controller = (StaffSearchResultTableViewController *)segue.destinationViewController;
        
        controller.listOptions = staffDetail;
    }
    
}






@end
