//
//  NSArray+PM.m
//  PMExtensions
//
//  Created by Pedro Mancheno on 9/5/13.
//  Copyright (c) 2013 Pedro Mancheno. All rights reserved.
//

#import "NSArray+PM.h"

@implementation NSArray (PM)

- (id)firstObject
{
    return self.count > 0 ? self[0] : nil;
}

- (id)lastObject
{
    return self.count > 0 ? self[self.count - 1] : nil;
}

- (void)each:(void (^)(id object, NSUInteger index))block
{
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj, idx);
    }];
}

- (NSArray *)map:(id (^)(id object))block
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    [self each:^(id object, NSUInteger index) {
        id newObject = block ? block(object) : object;
        if (newObject)
            [array addObject:newObject];
    }];
    return array;
}

- (NSArray *)select:(BOOL (^)(id object))block
{
    return [self map:^id(id object) {
        return block(object) ? object : nil;
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

- (id)reduce:(id)initial block:(id (^)(id accumulator, id obj))block
{
    id accumulator = initial;
    for (id obj in self) {
        accumulator = block(accumulator, obj);
    }
    return accumulator;
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

- (NSDictionary*)mapToDictionaryWithIndexes:(id<NSCopying> (^)(id obj, NSUInteger index))block
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:[self count]];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        id<NSCopying> key = block(obj, idx);
        if (key)
            dict[key] = obj;
    }];
    
    return dict;
}

#pragma mark -

- (NSArray*)arrayByRemovingNulls
{
    return [self select:^BOOL(id obj) {
        return obj != [NSNull null];
    }];
}

- (NSArray*)arrayByRemovingObject:(id)object
{
    NSMutableArray *copy = [self mutableCopy];
    [copy removeObject:object];
    return [NSArray arrayWithArray:copy];
}

- (NSArray*)arrayByRemovingObjectsInArray:(NSArray*)otherArray
{
    NSMutableArray *copy = [self mutableCopy];
    [copy removeObjectsInArray:otherArray];
    return [NSArray arrayWithArray:copy];
}

- (NSArray*)arrayByInsertingObject:(id)object atIndex:(NSUInteger)index
{
    NSMutableArray *copy = [self mutableCopy];
    [copy insertObject:object atIndex:index];
    return [NSArray arrayWithArray:copy];
}

- (NSArray*)subarrayWithCount:(NSUInteger)count
{
    return [self subarrayWithRange:(NSRange){
        0, MIN(count, self.count)
    }];
}

- (NSArray*)subarrayToIndex:(NSUInteger)idx
{
    return [self subarrayWithCount:idx+1];
}

- (NSArray*)subarrayFromIndex:(NSInteger)idx
{
    if (idx == NSNotFound || idx > ((NSInteger)self.count)-1)
        return @[];
    
    return [self subarrayWithRange:(NSRange){
        idx, self.count-idx
    }];
}

- (NSArray *)sortedArrayUsingKey:(NSString*)key ascending:(BOOL)ascending
{
    return [self sortedArrayUsingDescriptors:@[
                                               [NSSortDescriptor sortDescriptorWithKey:key ascending:ascending]
                                               ]];
}

@end
