//
//  NSArray+PM.h
//  PMExtensions
//
//  Created by Pedro Mancheno on 9/5/13.
//  Copyright (c) 2013 Pedro Mancheno. All rights reserved.
//

@interface NSArray (PM)

/**
 * Returns the first object in an array or nil if array is empty.
 *
 * @return          First object in the array
 */
@property (nonatomic, readonly) id firstObject;


/**
 * Returns the last object in an array or nil if array is empty.
 *
 * @return          Last object in the array
 */
@property (nonatomic, readonly) id lastObject;


/**
 * Executes the block for each element in the array, passing the object and index as parameters.
 *
 * @param block     Block to be called for each element in the array
 */
- (void)each:(void (^)(id object, NSUInteger index))block;

/**
 * Executes the block for each element in the array, returning an array which contains the values
 * returned by the block.
 *
 * @param block     Block to be called for each element in the array
 *
 * @return          NSArray containing the values returned by the block
 */
- (NSArray *)map:(id (^)(id object))block;


/**
 * Executes the block for each element in the array, returning an array which contains the values
 * for which the block returns YES.
 *
 * @param block     Block to be called for each element in the array
 *
 * @return          NSArray containing the values for which the block returns YES
 */
- (NSArray *)select:(BOOL (^)(id object))block;

/**
 * Executes the block for each element in the array and returns the first object in self for which
 * the block is true. Return nil if no match is found.
 * 
 * @param block     Block to be called for each element in the array
 *
 * @return          First object contained in self for which the block returns YES.
 */
- (id)match:(BOOL (^)(id obj))block;

/*!
 Returns YES if the block is true for all objects in self.
 */
- (BOOL)all:(BOOL (^)(id obj))block;

/*!
 Returns YES if the block is true for any object in self.
 */
- (BOOL)any:(BOOL (^)(id obj))block;

/*!
 Invokes block once for each element of self, returning a dictionary with these elements
 as values and the results of the block invocations as keys.
 */
- (NSDictionary*)mapToDictionary:(id<NSCopying> (^)(id obj))block;

/*!
 Invokes block once for each element of self, passing an index and returning a dictionary with these elements
 as values and the results of the block invocations as keys.
 */
- (NSDictionary*)mapToDictionaryWithIndexes:(id<NSCopying> (^)(id obj, NSUInteger index))block;

/*!
 Returns a new array obtained by removing from the receiver all objects that are not in the given array.
 */
- (NSArray *)intersect:(NSArray*)array;

/*!
 Returns a new array with the receiver's elements in reverse order.
 */
- (NSArray *)reversed;

/*!
 Returns a copy of the array with all objects that are NSNull instances removed.
 */
- (NSArray*)arrayByRemovingNulls;

/*!
 Returns a new array that is a copy of the receiving array with the given object removed.
 */
- (NSArray*)arrayByRemovingObject:(id)object;

/*!
 Returns a new array that is a copy of the receiving array with the given object removed.
 */
- (NSArray*)arrayByRemovingObjectsInArray:(NSArray*)otherArray;

/*!
 Returns a new array that is a copy of the receiving array with the given object inserted.
 */
- (NSArray*)arrayByInsertingObject:(id)object atIndex:(NSUInteger)index;

/*!
 Returns a new array containing the receiving array’s elements up to a specified count.
 */
- (NSArray*)subarrayWithCount:(NSUInteger)count;

/*!
 Returns a new array containing the receiving array’s elements up to a specified index.
 */
- (NSArray*)subarrayToIndex:(NSUInteger)idx;

/*!
 Returns a new array containing the receiving array’s elements starting from a specified index.
 */
- (NSArray*)subarrayFromIndex:(NSInteger)idx;

/*!
 Returns a copy of the receiving array sorted by using a given key path for comparison.
 */
- (NSArray *)sortedArrayUsingKey:(NSString*)key ascending:(BOOL)ascending;

@end
