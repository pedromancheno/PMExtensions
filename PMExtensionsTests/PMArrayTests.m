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
    STAssertEqualObjects(@0, array.firstObject, @"Element returned by 'firstObject' method is not the first.");
    
    array = @[@0];
    STAssertEqualObjects(@0, array.firstObject, @"Element returned by 'firstObject' method is not the only one.");
    
    array = nil;
    STAssertNil(array.firstObject, @"Element returned by 'firstObject' method is not nil.");
}

- (void)testLastObject
{
    NSArray *array = nil;
    
    array = @[@0, @1, @2, @3];
    STAssertEqualObjects(@3, array.lastObject, @"Element returned by 'lastObject' method is not the last.");
    
    array = @[@0];
    STAssertEqualObjects(@0, array.lastObject, @"Element returned by 'lastObject' method is not the only one.");
    
    array = nil;
    STAssertNil(array.lastObject, @"Element returned by 'lastObject' method is not nil.");
}

- (void)testMap
{
    NSArray *array = @[@"a", @"b", @"c", @"d"];
    NSString *expectedString =@"A,B,C,D";
    
    NSArray *newArray = [array map:^id(id object) {
        return [object uppercaseString];
    }];
    
    NSString *newString = [newArray componentsJoinedByString:@","];
    STAssertEqualObjects(newString, expectedString, @"Array was not mapped correctly");
}

- (void)testSelect
{
    NSArray *array = @[@"apple", @"orange", @"apple", @"orange"];
    NSString *expectedString = @"apple,apple";
    
    NSArray *appleArray = [array select:^BOOL(id object) {
        return [object isEqual:@"apple"];
    }];
    
    NSString *newString = [appleArray componentsJoinedByString:@","];
    STAssertEqualObjects(newString, expectedString, @"Array was not selected correctly");
}

@end
