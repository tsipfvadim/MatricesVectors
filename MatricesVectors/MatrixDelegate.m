//
//  MatrixDelegate.m
//  MatricesVectors
//
//  Created by Admin on 08.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import "MatrixDelegate.h"

@implementation MatrixDelegate
-(Matrices*)sumOfMatrix:(Matrices*)matrix1 andMatrix:(Matrices*)matrix2{
    
    NSLog(@"Addition matrices STARTED!");
    
    //Перевирка можливості додавання матриць
    //**************************************************************************
    if (matrix1.columns!=matrix2.columns) {
        NSLog(@"Impossible to adding matrices. Columns aren't equal (%lu!=%lu).",matrix1.columns, matrix2.columns);
        return nil;}
    if (matrix1.rows!=matrix2.rows) {
        NSLog(@"Impossible to adding matrices. Rows aren't equal (%lu!=%lu).",matrix1.rows, matrix2.rows);
        return nil;}
    //**************************************************************************
    
    //Додавання
    //**************************************************************************
    NSMutableArray*resultMatrix=[[NSMutableArray alloc] init];
    for (UInt row=0; row < matrix1.rows; row++) {
        NSMutableArray*rowArray=[[NSMutableArray alloc] init];
        for (UInt col=0; col<matrix1.columns; col++) {
            [rowArray addObject:[NSNumber numberWithDouble:
                                 [[matrix1 itemAtRow:row column:col] doubleValue]
                                 +
                                 [[matrix2 itemAtRow:row column:col] doubleValue]
                                 ]];
        }
        [resultMatrix addObject:rowArray];
    }
    //**************************************************************************
    
    NSLog(@"Addition matrices FINISHED!");
    
    return [[Matrices alloc]initWithArray:resultMatrix];
}
-(Matrices*)multiplicateMatrix:(Matrices*)matrix1 byMatrix:(Matrices*)matrix2{
    
    NSLog(@"Multiplication matrices STARTED!");
    
    //Перевирка можливості множення матриць
    //**************************************************************************
    if (matrix1.columns!=matrix2.rows) {
        NSLog(@"Impossible to multiply matrices. Matrix1.columns (%lu) != Matrix2.rows (%lu)",matrix1.columns, matrix2.rows);
        return nil;}
    //**************************************************************************
    
    //Обчислення множення матриць (кожен рядок в іншому потоці)
    NSMutableArray* resultMatrix=[[NSMutableArray alloc] initWithCapacity:matrix1.rows];    //dispatch_apply
    //занілення всіх елементів(в іншому випадку бувають збої)
    for (NSUInteger i = 0; i < matrix1.rows; i++) {
        [resultMatrix addObject:[NSNull null]];
    }
    
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply(matrix1.rows, concurrentQueue, ^(size_t row) {
        NSLog(@"Start thread %zu", row);
        
        //    NSMutableArray* resultMatrix=[[NSMutableArray alloc] initWithCapacity:matrix1.rows];  //без dispatch_apply
        //    for (uint row=0; row<matrix1.rows; row++) {                                           //без dispatch_apply
        
        NSMutableArray* rowArray=[[NSMutableArray alloc] init];
        for (uint col=0; col<matrix2.columns; col++) {
            double Item=0;
            for (UInt i=0; i<matrix1.columns; i++) {
                Item +=
                [[matrix1 itemAtRow:row column:i] doubleValue]
                *
                [[matrix2 itemAtRow:i column:col] doubleValue];
            }
            [rowArray addObject:[NSNumber numberWithDouble:Item]];
        }
        [resultMatrix replaceObjectAtIndex:row withObject:rowArray];
        
        //    }                                                                                     //без dispatch_apply
        
    });
    //**************************************************************************
    
    NSLog(@"Multiplication matrices FINISHED!");
    
    return [[Matrices alloc] initWithArray:resultMatrix];
}
-(Matrices*)multiplicateMatrix:(Matrices*)matrix1 byScalar:(NSNumber*)number{
    
    NSLog(@"Multiplication by scalar STARTED!");
    
    //Множення матриці на скаляр
    //**************************************************************************
    NSMutableArray*resultMatrix=[[NSMutableArray alloc] init];
    for (UInt row=0; row < matrix1.rows; row++) {
        NSMutableArray*rowArray=[[NSMutableArray alloc] init];
        for (UInt col=0; col<matrix1.columns; col++) {
            [rowArray addObject:[NSNumber numberWithDouble:[[matrix1 itemAtRow:row column:col] doubleValue]*[number doubleValue]]];
        }
        [resultMatrix addObject:rowArray];
    }
    //**************************************************************************
    
    NSLog(@"Multiplication by scalar FINISHED!");
    
    return [[Matrices alloc]initWithArray:resultMatrix];
}
-(Matrices*)transposeMatrix:(Matrices*)matrix{
    
    NSLog(@"Transposition of matrix STARTED!");
    
    //Множення матриці на скаляр
    //**************************************************************************
    NSMutableArray*resultMatrix=[[NSMutableArray alloc] init];
    for (UInt col=0; col < matrix.columns; col++) {
        NSMutableArray*rowArray=[[NSMutableArray alloc] init];
        
        for (UInt row=0; row<matrix.rows; row++) {
            [rowArray addObject:[matrix itemAtRow:row column:col]];
        }
        [resultMatrix addObject:rowArray];
    }
    //**************************************************************************
    
    NSLog(@"Transposition of matrix FINISHED!");
    
    return [[Matrices alloc]initWithArray:resultMatrix];
}
@end
