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
 * @return First object in the array
 */
@property (nonatomic, readonly) id firstObject;


/**
 * Returns the last object in an array or nil if array is empty.
 *
 * @return Last object in the array
 */
@property (nonatomic, readonly) id lastObject;

@end
