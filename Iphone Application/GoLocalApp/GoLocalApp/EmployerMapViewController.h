//
//  MapModeViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 11/12/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MapKit.h>

@interface EmployerMapViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocationCoordinate2D userCurrentLocation;
}

@property (strong, nonatomic) NSMutableArray *staffDetail;

@property (weak, nonatomic) IBOutlet MKMapView *myMapView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)changeMapStyle:(id)sender;

- (IBAction)locateMe:(id)sender;


- (IBAction)goToListMode:(UIBarButtonItem *)sender;
























@end
