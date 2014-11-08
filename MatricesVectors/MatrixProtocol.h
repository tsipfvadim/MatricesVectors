//
//  MatrixProtocol.h
//  MatricesVectors
//
//  Created by Admin on 08.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Matrices;

@protocol MatrixProtocol <NSObject>
-(Matrices*)sumOfMatrix:(Matrices*)matrix1 andMatrix:(Matrices*)matrix2;
-(Matrices*)multiplicateMatrix:(Matrices*)matrix1 byMatrix:(Matrices*)matrix2;
-(Matrices*)multiplicateMatrix:(Matrices*)matrix1 byScalar:(NSNumber*)number;
-(Matrices*)transposeMatrix:(Matrices*)matrix;
@end
