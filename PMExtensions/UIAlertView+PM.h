//
//  UIAlertView+PM.h
//  PMExtensions
//
//  Created by Pedro Mancheno on 02/03/15.
//  Copyright (c) 2015 Pedro Mancheno. All rights reserved.
//

typedef void (^UIAlertViewDismissBlock)(NSUInteger buttonIndex);
typedef void (^UIAlertViewCancelBlock)();

@interface UIAlertView (PM) <UIAlertViewDelegate>

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message;

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle;

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle
                  otherButtonTitles:(NSArray *)otherButtons
                          onDismiss:(UIAlertViewDismissBlock)dismissed
                           onCancel:(UIAlertViewCancelBlock)cancelled;

+ (UIAlertView *)alertViewWithError:(NSError *)error;

@end
