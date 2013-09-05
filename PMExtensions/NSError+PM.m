//
//  NSError+PM.m
//  PMExtensions
//
//  Created by Pedro Mancheno on 9/5/13.
//  Copyright (c) 2013 Pedro Mancheno. All rights reserved.
//

#import "NSError+PM.h"

@implementation NSError (PM)

+ (NSError *)errorWithDomain:(NSString *)domain
                        code:(NSInteger)code
        localizedDescription:(NSString *)localizedDescription
{
    NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : localizedDescription };
    return [NSError errorWithDomain:domain
                               code:code
                           userInfo:userInfo];
}

@end
