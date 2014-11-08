//
//  TMMatrix.m
//  MatricesVectors
//
//  Created by Admin on 08.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "TMMatrix.h"

@implementation TMMatrix
-(BOOL)validateArray:(NSArray*)array{
    //[array allItemsKindOfClass:[NSArray class]]||[array allItemsCountIsEqual]
    for (UInt row=0; row<array.count; row++) {
        if ( !([[array objectAtIndex:row ] isKindOfClass:[NSArray class]]) || [[array objectAtIndex:row ] count]!=[[array objectAtIndex:0 ] count]) {
            NSLog(@"Array is nod valid");
            return NO;
        }
        //[[array objectAtIndex:row ] allItemsKindOfClass:[NSNumber class]]
        for (UInt col=0; col<[[array objectAtIndex:0 ] count]; col++) {
            if (![[[array objectAtIndex:row ] objectAtIndex:col ] isKindOfClass:[NSNumber class]]) {
                NSLog(@"Array is nod valid");
                return NO;
            }
        }
    }
    return YES;
}
@end
