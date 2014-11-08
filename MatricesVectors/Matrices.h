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

-(BOOL)validateArray:(NSArray*)array;//Валідація масиву
-(instancetype)initWithArray:(NSArray*)array;//ініціалізація
-(NSNumber*)itemAtRow:(NSUInteger)rowIndex column:(NSUInteger)colIndex;//доступ до конкретного елементу
-(instancetype)plasMatrix:(Matrices*)matrix;//додавання матриць
-(instancetype)multiplyByScalar:(NSNumber*)number;//множення матриць на скаляр
-(instancetype)multiplyByMatrix:(Matrices*)matrix;//множення матриць
-(instancetype)transposition;//обернена матриця
@end
