//
//  ColorWheel.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 10/18/15.
//  Copyright © 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ColorWheel.h"

@implementation ColorWheel
{
    int colorIterator;
    NSArray * colorsList;

}

    -(id) init
    {
        self = [super init];
        if (self)
        {
            colorIterator = 0;
            colorsList = [NSArray arrayWithObjects:
                          
                           //teal color
                           [UIColor colorWithRed:90/255.0 green:187/255.0 blue:181/255.0 alpha:1.0],
                           
                           //yellow color
                           [UIColor colorWithRed:222/255.0 green:171/255.0 blue:66/255.0 alpha:1.0],
                           
                           //red color
                           [UIColor colorWithRed:223/255.0 green:86/255.0 blue:94/255.0 alpha:1.0],
                           
                           //orange color
                           [UIColor colorWithRed:239/255.0 green:130/255.0 blue:100/255.0 alpha:1.0],
                           
                        //   //dark color
                        //   [UIColor colorWithRed:77/255.0 green:75/255.0 blue:82/255.0 alpha:1.0],
                          
                           //purple color
                           [UIColor colorWithRed:105/255.0 green:94/255.0 blue:133/255.0 alpha:1.0],
                           
                           //green color
                           [UIColor colorWithRed:85/255.0 green:176/255.0 blue:112/255.0 alpha:1.0],
                          
                          nil];
            
        }
        return self;
    }

    /* picks/returns a random color from list */
    -(UIColor *)randomColor
    {
        //create random number
        int totalElements = (int)[colorsList count];
        int unsignedRandomNumber = arc4random_uniform(totalElements);
        
        return [colorsList objectAtIndex:unsignedRandomNumber];
    }//eom
    
    /* gets the current color (iterating thru colors)*/
    -(UIColor *)currentColor
    {
        //current color
        UIColor * currColor = [colorsList objectAtIndex:colorIterator];
        
        //updating iterator
        colorIterator++;
        if(colorIterator+1 == [colorsList count])
        {
            colorIterator = 0;
        }
        
        return currColor;
    }//eom

@end

