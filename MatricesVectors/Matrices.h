//
//  Matrices.h
//  MatricesVectors
//
//  Created by Admin on 08.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MatrixProtocol.h"

@interface Matrices : NSObject

@property (nonatomic, assign) id <MatrixProtocol> delegate;
@property (nonatomic, copy) NSArray* arrayOfMatrix;
@property (nonatomic, readonly) NSUInteger rows, columns;

-(instancetype)initWithArray:(NSArray*)array;

-(BOOL)validateArray:(NSArray*)array;

-(NSNumber*)itemAtRow:(NSUInteger)rowIndex column:(NSUInteger)colIndex;

-(instancetype)plasMatrix:(Matrices*)matrix;

-(instancetype)multiplyByScalar:(NSNumber*)number;

-(instancetype)multiplyByMatrix:(Matrices*)matrix;

-(instancetype)transposition;

@end
