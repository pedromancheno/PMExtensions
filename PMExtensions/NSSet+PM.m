//
//  NSSet+PM.m
//  PMExtensions
//
//  Created by Pedro Mancheno on 12/03/15.
//  Copyright (c) 2015 Pedro Mancheno. All rights reserved.
//

#import "NSSet+PM.h"

#import "NSDictionary+PM.h"
#import "NSArray+PM.h"

@implementation NSSet (PM)

- (NSSet *)setByRemovingNulls
{
    return [self map:^id(id obj) {
        if (obj == [NSNull null])
            return nil;
        
        if ([obj respondsToSelector:@selector(dictionaryByRemovingNulls)])
            return [obj dictionaryByRemovingNulls];
        else if ([obj respondsToSelector:@selector(arrayByRemovingNulls)])
            return [obj arrayByRemovingNulls];
        else if ([obj respondsToSelector:@selector(setByRemovingNulls)])
            return [obj setByRemovingNulls];
        
        return obj;
    }];
}

- (void)each:(void (^)(id obj))block
{
    for (id obj in self) {
        block(obj);
    }
}

- (NSSet*)map:(id (^)(id obj))block
{
    NSMutableSet *set = [NSMutableSet setWithCapacity:[self count]];
    for (id obj in self) {
        id newobj = block(obj);
        if (newobj)
            [set addObject:newobj];
    }
    return set;
}

- (NSSet *)select:(BOOL (^)(id obj))block
{
    return [self map:^id(id obj) {
        return block(obj)? obj : nil;
    }];
}

- (id)match:(BOOL (^)(id obj))block
{
    for (id obj in self) {
        if (block(obj)) {
            return obj;
        }
    }
    return nil;
}

- (BOOL)all:(BOOL (^)(id obj))block
{
    BOOL (^negatedBlock)(id obj) = ^BOOL(id obj) {
        return !block(obj);
    };
    return [self match:negatedBlock] == nil;
}

- (BOOL)any:(BOOL (^)(id obj))block
{
    return [self match:block] != nil;
}

- (id)reduce:(id)initial block:(id (^)(id accumulator, id obj))block
{
    id accumulator = initial;
    for (id obj in self) {
        accumulator = block(accumulator, obj);
    }
    return accumulator;
}

@end
