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
    
    //hiding navigation controller
    [self.navigationController setNavigationBarHidden:YES];
    
    [self setUpMap];
    
}//eo-view


-(void)viewDidAppear:(BOOL)animated
{

}//eo-view


-(void)viewWillDisappear:(BOOL)animated
{
    //showing navigation controller
    [self.navigationController setNavigationBarHidden:NO];
}

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
    [self UpdateMapRegion:userCurrentLocation];
//    [self addAnnotationInMap:userCurrentLocation];
    

}//eom

/* */
- (IBAction)goToListMode:(UIBarButtonItem *)sender
{
    //moving to the previous controller
   // [self performSegueWithIdentifier:@"goToStaffSearchList" sender:self];
    
    [self.navigationController popViewControllerAnimated:TRUE];
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


/* */
-(void)UpdateMapRegion:(CLLocationCoordinate2D)userLocation
{
    //    NSLog( @"location latitude: %f",userLocation.latitude);
    //    NSLog( @"location longitude: %f",userLocation.longitude);
    
    //creating the region based on the current location
    MKCoordinateRegion region   = {{0.0, 0.0}, {0.0, 0.0}};
    region.center.latitude      = userLocation.latitude;
    region.center.longitude     = userLocation.longitude;
    region.span.latitudeDelta   = 0.02f;
    region.span.longitudeDelta  = 0.02f;
    
    //updating map region based on the users location provided
    [self.myMapView setRegion:region animated:YES];
    
}//eom

/* */
-(void)updateMapZoomAccordingToLocation:(CLLocationCoordinate2D)locationProvided
{
    [self.myMapView setCenterCoordinate:locationProvided animated:YES];
}//eom


/* */
-(void)addAnnotationInMap:(CLLocationCoordinate2D)locationProvided
{
    //    NSLog( @"location latitude: %f",locationProvided.latitude);
    //    NSLog( @"location longitude: %f",locationProvided.longitude);
    
    //latitude and longitude of the location provided
    CLLocationDegrees locationLatitude  = locationProvided.latitude;
    CLLocationDegrees locationLongitude = locationProvided.longitude;
    
    CLLocation * selectedLocation       =  [[CLLocation alloc]
                                            initWithLatitude:locationLatitude
                                            longitude:locationLongitude];
    
    //getting placemark of the location provided
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:selectedLocation
                   completionHandler:^(NSArray *placemarks,
                                       NSError *error)
     {
         if(placemarks.count)
         {
//             CLPlacemark *placemark = [placemarks objectAtIndex:0];
//             
//             //            NSLog(@"placemark: %@",placemark); //full placemark
//             
//             //address only from placemark
//             NSDictionary *Addressdictionary = [ placemark addressDictionary];
//             
//             NSLog(@"Addressdictionary: %@",Addressdictionary);//address info
//             
//             NSString *street        =  [Addressdictionary valueForKey:@"Street"];
//             NSString *city          = [Addressdictionary valueForKey:@"City"];
//             NSString *state         = [Addressdictionary valueForKey:@"State"];
//             NSString *zipcode       = [Addressdictionary valueForKey:@"ZIP"];
//             NSString *title         = [Addressdictionary valueForKey:@"SubLocality"];
//             NSString *fullAddress   = [NSString stringWithFormat:@"%@ %@ %@ %@",street,city,state,zipcode];
//             
//             //creating Map pin
//             MapPIN *myAnnotation    = [[MapPIN alloc] init];
//             myAnnotation.title      = title;
//             myAnnotation.subtitle   = fullAddress;
//             myAnnotation.coordinate = locationProvided;
//             
//             //adding annotation to map
//             [self.myMapView addAnnotation:myAnnotation];
         }
     }];
    
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
