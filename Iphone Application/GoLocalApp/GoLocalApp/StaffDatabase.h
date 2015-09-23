//
//  StaffDatabase.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/23/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface StaffDatabase : NSObject
{
    NSString * entityName;

}


-(BOOL)saveSelfieImage:(UIImage *)imageProvided;
-(BOOL)saveBodyImage:(UIImage *)imageProvided;
-(UIImage *) getSelfiePhoto;
-(UIImage *) getBodyPhoto;

//NEED TO FIX
-(void)saveStaffUSerInfoToCoreData;
-(BOOL) deleteAPhoto:(NSString *) photoType fromTable:(NSString *) entityName;
-(UIImage *) retrievePhoto:(NSString *) photoType fromTable:(NSString *) entityName;
@end
