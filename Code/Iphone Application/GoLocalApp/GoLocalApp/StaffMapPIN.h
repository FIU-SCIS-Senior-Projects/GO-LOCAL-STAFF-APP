//
//  StaffMapPIN.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 11/12/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface StaffMapPIN : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
    NSString *staffID;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *staffID;



@end
