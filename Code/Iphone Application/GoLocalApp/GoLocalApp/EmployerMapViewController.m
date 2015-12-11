//
//  MapModeViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 11/12/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import "EmployerMapViewController.h"
#import "StaffSearchResultProfileViewController.h"

#import "ServerAPI.h"
#import "StaffMapPIN.h"

@interface EmployerMapViewController ()
{
    ServerAPI * api;
}
@end

@implementation EmployerMapViewController

@synthesize staffDetail;


//MARK: View Loading

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpMap];
    
}//eo-view

-(void)viewWillAppear:(BOOL)animated
{
    api = [[ServerAPI alloc]init];
    [self getAllUserData];
    
    //hidinh navigation controller
    [self.navigationController setNavigationBarHidden:YES];
    
}//oew


-(void)viewDidAppear:(BOOL)animated
{
    
}//eo-view


-(void)viewWillDisappear:(BOOL)animated
{
    //showing navigation controller
    [self.navigationController setNavigationBarHidden:NO];
}

//MARK: Memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//MARK: User Location

/* */
-(void)updateTheUsersCurrentLocation
{
    //starts updating the user current location
    [locationManager startUpdatingLocation];
    
    //getting coordinates of the current location
    userCurrentLocation = locationManager.location.coordinate;
    
    //stop updating the user current location
    [locationManager stopUpdatingLocation];
    
    [self UpdateMapRegion:userCurrentLocation];
}//eom




//MARK: Map Setup

/* setups the initial map */
-(void)setUpMap
{
    //ask user for permission
    locationManager             = [[CLLocationManager alloc]init];
    locationManager.delegate    = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager requestWhenInUseAuthorization];
    [locationManager requestAlwaysAuthorization];
    
    //map starting region
    [self setMapStartRegion];
    
    //check user location authorization
    [self checkLocationAuthorization];
    
    //updating mapview settings
    self.myMapView.autoresizingMask         = UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleHeight;
    self.myMapView.showsUserLocation        = YES;  //shows/hides the user the current location
    self.myMapView.showsTraffic             = NO;  //shows/hides traffic on map
    self.myMapView.showsPointsOfInterest    = NO;   //shows/hides points of interest on the map
    self.myMapView.showsCompass             = NO;   //shows/hides compass on map
    
    if( locationAuthorizationAlways || locationAuthorizationWhenInUse)
    {
        [self updateTheUsersCurrentLocation];
        //    [self addAnnotationInMap:userCurrentLocation];
    }
    
}//eom


/* */
-(void)setMapStartRegion
{
    CLLocationDegrees startLatitude     = 25.758721;
    CLLocationDegrees startLongitude    = -80.373522;
    
    //creating the region based on the current location
    MKCoordinateRegion region   = {{0.0, 0.0}, {0.0, 0.0}};
    region.center.latitude      = startLatitude;
    region.center.longitude     = startLongitude;
    region.span.latitudeDelta   = 0.09f;
    region.span.longitudeDelta  = 0.09f;
    
    //updating map region based on the users location provided
    [self.myMapView setRegion:region animated:YES];
    
}//eom

/* */
-(void)UpdateMapRegion:(CLLocationCoordinate2D)userLocation
{
    //NSLog( @"location latitude: %f",userLocation.latitude);
    //NSLog( @"location longitude: %f",userLocation.longitude);
    
    //creating the region based on the current location
    MKCoordinateRegion region   = {{0.0, 0.0}, {0.0, 0.0}};
    region.center.latitude      = userLocation.latitude;
    region.center.longitude     = userLocation.longitude;
    region.span.latitudeDelta   = 0.09f;
    region.span.longitudeDelta  = 0.09f;
    
    //updating map region based on the users location provided
    [self.myMapView setRegion:region animated:YES];
    
}//eom

/* */
-(void)updateMapZoomAccordingToLocation:(CLLocationCoordinate2D)locationProvided
{
    [self.myMapView setCenterCoordinate:locationProvided animated:YES];
}//eom


//MARK: Map Style
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



//MARK: Map Annotations
-(void)addUserAnnotionInMap:(NSString*) userAddress
                   withUser:(NSString *)userNameProvided
                withStaffID:(NSString *)staffIDProvided

{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:userAddress
                 completionHandler:^(NSArray* placemarks, NSError* error)
    {
         if (placemarks && placemarks.count > 0)
         {
             CLPlacemark *topResult = [placemarks objectAtIndex:0];
             MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:topResult];
             CLLocationCoordinate2D userLocation = placemark.location.coordinate;
             
             //NSLog(@"topResult %@", topResult);
             
             //distance away
             CLLocation *startLocation = [[CLLocation alloc] initWithLatitude:userCurrentLocation.latitude longitude:userCurrentLocation.longitude];
             CLLocation *endLocation = [[CLLocation alloc] initWithLatitude:userLocation.latitude longitude:userLocation.longitude];
             CLLocationDistance distance = [startLocation distanceFromLocation:endLocation];
             
             double distanceAway = distance/1609.344 ;
             
             NSString * distanceAwayMessage = [NSString stringWithFormat:@"%.2f mi away", distanceAway];
             
             //creating Map pin
              StaffMapPIN * staffAnnotation  = [[StaffMapPIN alloc] init];
              staffAnnotation.title         = userNameProvided;
              staffAnnotation.subtitle      = distanceAwayMessage;
              staffAnnotation.coordinate    = userLocation;
              staffAnnotation.staffID       = staffIDProvided;
             
             [self.myMapView addAnnotation:staffAnnotation];
             
        }//eo-valid placemark
    }];
}//eom


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

/* */
- (IBAction)goToListMode:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:TRUE];
}//eo-action


//MARK: Location Authorization

-(void)checkLocationAuthorization
{
    //location always
    if( [ CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways )
    {
        locationAuthorizationAlways = true;
    }
    else
    {
        locationAuthorizationAlways = false;
    }
    
    //location when in use
    if( [ CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse )
    {
        locationAuthorizationWhenInUse = true;
    }
    else
    {
        locationAuthorizationWhenInUse = false;
    }
}//eom


//MARK: - Request All User Data From Server
-(void)getAllUserData
{
    //NSLog(@" staffDetail: %@", staffDetail);
    
    int totalStaff = (int)staffDetail.count;
    
    for(int iter = 0; iter < totalStaff; iter++)
    {
        NSDictionary * currStaff = staffDetail[iter];
        NSString * currStaffID = [currStaff objectForKey:@"staffID"];
        [self sendSearchDataToServer:currStaffID];
    }//eofl
    
}//eom


-(void)sendSearchDataToServer:(NSString *) staffIDProvided
{
    NSString *serverAddress = api.searchStaffDetail;
    
    // preparing data to be sent
    NSMutableDictionary * searchData = [[NSMutableDictionary alloc] init];
    searchData[@"staffID"]   = staffIDProvided;
    
    //adding data to request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
                                    initWithURL:[NSURL URLWithString:  serverAddress ]];
    
    [request setHTTPMethod:@"POST"]; //request type
    
    //sending data
    NSError *error;
    NSData *postdata = [NSJSONSerialization dataWithJSONObject:searchData options:0 error:&error];
    
    [request setHTTPBody:postdata];
    
    NSURLSession * session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask * task = [session dataTaskWithRequest:request
                                             completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
   {
       //NSLog(@"response: %@", response);
       //NSLog(@"error: %@", error);
       
       if (error == nil)
       {
           NSDictionary * rawExhibits = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
           
           NSDictionary * userResults  = [rawExhibits objectForKey:@"results"];
           int responceType            = [[userResults objectForKey:@"responseType"] intValue];
           
           //NSLog(@"results is %@", userResults);
           //NSLog(@"responceType is %d", responceType);
           if(responceType > 0) //responce was good
           {
               //data
               NSDictionary * responceData  = [userResults objectForKey:@"data"];
               
               //NSString * staffID = [responceData objectForKey:@"staffID"];
               NSString * userAddress = [responceData objectForKey:@"address"];
               
               NSString * Fname = [responceData objectForKey:@"firstName"];
               NSString * Mname = [responceData objectForKey:@"middleInitial"];
               NSString * Lname = [responceData objectForKey:@"lastName"];
               
               NSString * fullname = @"";
               if( Mname.length > 0)
               {
                   fullname = [NSString stringWithFormat:@"%@ %@ %@",Fname, Mname, Lname ];
               }
               else
               {
                   fullname = [NSString stringWithFormat:@"%@ %@",Fname, Lname ];
               }
               
               //NSLog(@"staffID: %@ (%@) with address %@ ", staffID, fullname, userAddress);
               
               [self addUserAnnotionInMap:userAddress withUser:fullname withStaffID:staffIDProvided];
               
           }//eo-responce
       }//eo-data
   }];
    [task resume];
    
}//eo-action


//MARK: Location Delegates

    -(void) locationManager:(CLLocationManager *)manager
                                            didChangeAuthorizationStatus:(CLAuthorizationStatus)status
    {
        //location always
        if( [ CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways )
        {
            locationAuthorizationAlways = true;
        }
        else
        {
            locationAuthorizationAlways = false;
        }
        
        //location when in use
        if( [ CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse )
        {
            locationAuthorizationWhenInUse = true;
        }
        else
        {
            locationAuthorizationWhenInUse = false;
        }
    }//eom

//MARK:

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *identifier = @"MyLocation";
    if ([annotation isKindOfClass:[StaffMapPIN class]])
    {
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil)
        {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            annotationView.enabled = YES;
            annotationView.canShowCallout = YES;
            annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        } else
        {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    }
    
    return nil;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    if (![view.annotation isKindOfClass:[StaffMapPIN class]])
        return;
    
    StaffMapPIN * staffMap = view.annotation;
    NSString* staffID = staffMap.staffID;
    
    // use the annotation view as the sender
    StaffSearchResultProfileViewController * staffSearchDetailProfileController =
    [self.storyboard instantiateViewControllerWithIdentifier:@"staffSearchResultProfile"];
    
    NSDictionary * staffInfo = [[NSDictionary alloc]initWithObjectsAndKeys:staffID, @"staffID",nil];
    
    staffSearchDetailProfileController.staffDetail = staffInfo;
    
    [self.navigationController pushViewController:staffSearchDetailProfileController animated:true];
    
}//eom

@end
