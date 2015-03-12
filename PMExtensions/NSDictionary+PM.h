//
//  NSDictionary+PM.h
//  PMExtensions
//
//  Created by Pedro Mancheno on 12/03/15.
//  Copyright (c) 2015 Pedro Mancheno. All rights reserved.
//

@interface NSDictionary (PM)

/*!
 Returns a copy of the dictionary with all keys and values that are NSNull instances recursively removed.
 */
- (NSDictionary *)dictionaryByRemovingNulls;

/*!
 Calls block once for each key/value pair in self, passing these as a parameters.
 */
- (void)each:(void (^)(id key, id obj))block;

/*!
 Invokes block once for each key/value pair in self, returning a new dictionary
 where the value for each key is replaced by the result of the block invocation.
 */
- (NSDictionary *)map:(id (^)(id key, id obj))block;

/*!
 Invokes block once for each key/value pair in self, returning a new dictionary
 where the key for each value is replaced by the result of the block invocation.
 */
- (NSDictionary *)mapKeys:(id<NSCopying>(^)(id key, id obj))block;

/*!
 Invokes block once for each key/object pair in self, returning a dictionary containing those
 elements for which the block returns a true value.
 */
- (NSDictionary *)select:(BOOL (^)(id key, id obj))block;

@end

@interface NSMutableDictionary (Functional)

/*!
 Invokes block once for each key/value pair in self, returning a new dictionary
 where the value for each key is replaced by the result of the block invocation.
 */
- (NSMutableDictionary *)map:(id (^)(id key, id obj))block;

/*!
 Invokes block once for each key/value pair in self, returning a new dictionary
 where the key for each value is replaced by the result of the block invocation.
 */
- (NSMutableDictionary *)mapKeys:(id<NSCopying>(^)(id key, id obj))block;

/*!
 Invokes block once for each key/object pair in self, returning a dictionary containing those
 elements for which the block returns a true value.
 */
- (NSMutableDictionary *)select:(BOOL (^)(id key, id obj))block;

@end
