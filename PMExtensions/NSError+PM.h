//
//  NSError+PM.h
//  PMExtensions
//
//  Created by Pedro Mancheno on 9/5/13.
//  Copyright (c) 2013 Pedro Mancheno. All rights reserved.
//

@interface NSError (PM)

/**
 * Convenient method for quickly creating an error with a domain, code and localized description.
 * 
 * @param domain                    A string indicating the error's domain name
 * @param code                      An integer representing the error code
 * @param localizedDescription      The localized description of the error
 *
 * @return                          NSError object
 */
+ (NSError *)errorWithDomain:(NSString *)domain
                        code:(NSInteger)code
        localizedDescription:(NSString *)localizedDescription;

@end
