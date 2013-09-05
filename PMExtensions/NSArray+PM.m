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

@end
