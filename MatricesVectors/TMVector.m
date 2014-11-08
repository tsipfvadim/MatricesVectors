//
//  TMVector.m
//  MatricesVectors
//
//  Created by Admin on 08.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "TMVector.h"

@implementation TMVector
-(BOOL)validateArray:(NSArray*)array{
    //[array allItemsKindOfClass:[NSNumber class]]
    for (UInt row=0; row<array.count; row++) {
        if (![[array objectAtIndex:row ] isKindOfClass:[NSNumber class]]) {
            NSLog(@"Array is nod valid");
            return NO;
        }
    }
    return YES;
}
-(NSUInteger)columns{
    return (NSUInteger)1;
}
-(NSNumber*)itemAtIndex:(NSUInteger)index{
    return [self.arrayOfMatrix objectAtIndex:index];
}

@end
