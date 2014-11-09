//
//  main.m
//  MatricesVectors
//
//  Created by Admin on 08.11.14.
//  Copyright (c) 2014 tsipfvadim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMVector.h"
#import "TMMatrix.h"
#import "MatrixDelegate.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        MatrixDelegate*delegate=[[MatrixDelegate alloc]init];
        TMMatrix* matrix1=[[TMMatrix alloc]initWithArray:@[
                                                           @[@3,@1],
                                                           @[@2,@1],
                                                           @[@1,@0]
                                                           ]];
        matrix1.delegate=delegate;
        TMMatrix* matrix2=[[TMMatrix alloc] initWithArray:@[
                                                            @[@1,@0,@2],
                                                            @[@(-1),@3,@1],
                                                            ]];
        matrix2.delegate=delegate;
        TMVector* vector=[[TMVector alloc] initWithArray:@[@4,@2,@0]];
        vector.delegate=delegate;
        
        NSLog(@"%lu",vector.columns);
        
        NSLog(@"%@", matrix1);
        NSLog(@"%@", matrix2);
        NSLog(@"%@", vector);

        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            TMMatrix* result=[matrix1 transposition];
            NSLog(@"(matrix1)T = %@", result);
        });
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            TMMatrix* result1=[matrix2 multiplyByMatrix:vector];
            NSLog(@"matrix2 * vector = %@", result1);
        });
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            TMMatrix* result2=[matrix1 multiplyByScalar:@5];
            NSLog(@"matrix1 * 5 = %@", result2);
        });
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            TMMatrix* result3=[matrix1 multiplyByMatrix:matrix2];
            NSLog(@"matrix1 * matrix2 = %@", result3);
        });
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            TMVector* result4=[vector transposition];
            NSLog(@"(vector)T = %@", result4);
        });
        sleep(5);
        
    }
    return 0;
}

