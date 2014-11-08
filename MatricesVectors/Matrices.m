//
//  Matrices.m
//  MatricesVectors
//
//  Created by Admin on 08.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "Matrices.h"

@implementation Matrices
-(BOOL)validateArray:(NSArray *)array{
    return YES;
}
//**************************************************************************
-(instancetype)initWithArray:(NSArray *)array{
    //перевірка
    if ([self validateArray:array]) {
        self=[super init];
        self.arrayOfMatrix=array;
        return self;
    }
    return nil;
}
//**************************************************************************
-(NSUInteger)rows{
    return self.arrayOfMatrix.count;
}
//**************************************************************************
-(NSUInteger)columns{
    if ([[self.arrayOfMatrix objectAtIndex:0] isKindOfClass:[NSArray class]]) {
        return [[self.arrayOfMatrix objectAtIndex:0] count];
    }
    return 1;
}
//**************************************************************************
-(NSNumber*)itemAtRow:(NSUInteger)rowIndex column:(NSUInteger)colIndex{
    if ([[self.arrayOfMatrix objectAtIndex:rowIndex] isKindOfClass:[NSArray class]]) {
        return [[self.arrayOfMatrix objectAtIndex:rowIndex] objectAtIndex:colIndex];
    }
    return [self.arrayOfMatrix objectAtIndex:rowIndex];
}
//**************************************************************************
-(instancetype)multiplyByScalar:(NSNumber*)number{
    if (_delegate && [_delegate respondsToSelector:@selector(multiplicateMatrix: byScalar:)]) {
        return [_delegate performSelector:@selector(multiplicateMatrix: byScalar:) withObject:self withObject:number];
    }else{
        NSLog(@"Delegate don't implement 'multiplicateMatrix: byScalar:'.");
        return nil;
    }
}
//**************************************************************************
-(instancetype)multiplyByMatrix:(Matrices *)matrix{
    if (_delegate && [_delegate respondsToSelector:@selector(multiplicateMatrix: byMatrix:)]) {
        return [_delegate performSelector:@selector(multiplicateMatrix: byMatrix:) withObject:self withObject:matrix];
    }else{
        NSLog(@"Delegate don't implement 'multiplicateMatrix: byMatrix:'.");
        return nil;
    }
}
//**************************************************************************
-(instancetype)plasMatrix:(Matrices *)matrix{
    if (_delegate && [_delegate respondsToSelector:@selector(sumOfMatrix: andMatrix:)]) {
        return [_delegate performSelector:@selector(sumOfMatrix: andMatrix:) withObject:self withObject:matrix];
    }else{
        NSLog(@"Delegate don't implement 'sumOfMatrix: andMatrix:'.");
        return nil;
    }
}
//**************************************************************************
-(instancetype)transposition{
    if (_delegate && [_delegate respondsToSelector:@selector(transposeMatrix:)]) {
        return [_delegate performSelector:@selector(transposeMatrix:) withObject:self];
    }else{
        NSLog(@"Delegate don't implement 'transposeMatrix:'.");
        return nil;
    }
}
//**************************************************************************
-(NSString*)description{
    NSMutableString*result=[[NSMutableString alloc] initWithFormat:@"%@\n",[self class]];
    for (UInt row=0; row < self.rows; row++) {
        for (UInt col=0; col<self.columns; col++) {
            [result appendFormat:@"%@\t",[self itemAtRow:row column:col]];
        }
        [result appendString:@"\n"];
    }
    return result;
}
//**************************************************************************
@end
