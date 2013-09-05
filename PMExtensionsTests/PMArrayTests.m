//
//  PMArrayTests.m
//  PMExtensions
//
//  Created by Pedro Mancheno on 9/5/13.
//  Copyright (c) 2013 Pedro Mancheno. All rights reserved.
//

#import "PMArrayTests.h"

#import "NSArray+PM.h"

@implementation PMArrayTests

- (void)testFirstObject
{
    NSArray *array = nil;
    
    array = @[@0, @1, @2, @3];
    STAssertEquals(@0, array.firstObject, @"Element returned by 'firstObject' method is not the first.");
    
    array = @[@0];
    STAssertEquals(@0, array.firstObject, @"Element returned by 'firstObject' method is not the only one.");
    
    array = nil;
    STAssertNil(array.firstObject, @"Element returned by 'firstObject' method is not nil.");
}

- (void)testLastObject
{
    NSArray *array = nil;
    
    array = @[@0, @1, @2, @3];
    STAssertEquals(@3, array.lastObject, @"Element returned by 'lastObject' method is not the last.");
    
    array = @[@0];
    STAssertEquals(@0, array.lastObject, @"Element returned by 'lastObject' method is not the only one.");
    
    array = nil;
    STAssertNil(array.lastObject, @"Element returned by 'lastObject' method is not nil.");
}

@end
