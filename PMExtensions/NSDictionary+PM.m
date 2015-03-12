//
//  NSDictionary+PM.m
//  PMExtensions
//
//  Created by Pedro Mancheno on 12/03/15.
//  Copyright (c) 2015 Pedro Mancheno. All rights reserved.
//

#import "NSDictionary+PM.h"

#import "NSArray+PM.h"
#import "NSSet+PM.h"

@implementation NSDictionary (PM)

- (NSDictionary*)dictionaryByRemovingNulls
{
    return [self map:^id(id key, id obj) {
        if (key == [NSNull null] || obj == [NSNull null])
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

- (void)each:(void (^)(id key, id obj))block
{
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(key, obj);
    }];
}

- (NSDictionary *)map:(id (^)(id key, id obj))block
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:[self count]];
    
    [self each:^(id key, id obj) {
        id newobj = block(key, obj);
        if (newobj)
            dict[key] = newobj;
    }];
    
    return dict;
}

- (NSDictionary *)select:(BOOL (^)(id key, id obj))block
{
    return [self map:^id(id key, id obj) {
        return block(key, obj)? obj : nil;
    }];
}

- (NSDictionary *)mapKeys:(id<NSCopying>(^)(id key, id obj))block
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:[self count]];
    
    [self each:^(id key, id obj) {
        id newkey = block(key, obj);
        if (newkey)
            dict[newkey] = obj;
    }];
    
    return dict;
}

@end
