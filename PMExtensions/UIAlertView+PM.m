//
//  UIAlertView+PM.m
//  PMExtensions
//
//  Created by Pedro Mancheno on 02/03/15.
//  Copyright (c) 2015 Pedro Mancheno. All rights reserved.
//

#import "UIAlertView+PM.h"

static UIAlertViewDismissBlock _dismissBlock;
static UIAlertViewCancelBlock _cancelBlock;

@implementation UIAlertView (PM)

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle
                  otherButtonTitles:(NSArray *)otherButtons
                          onDismiss:(UIAlertViewDismissBlock)dismissed
                           onCancel:(UIAlertViewCancelBlock)cancelled
{
	_cancelBlock  = [cancelled copy];
	_dismissBlock  = [dismissed copy];

	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
	                                                message:message
	                                               delegate:[self class]
	                                      cancelButtonTitle:cancelButtonTitle
	                                      otherButtonTitles:nil];

	for (NSString *buttonTitle in otherButtons)
		[alert addButtonWithTitle:buttonTitle];

	[alert show];
	return alert;
}

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
{
	return [UIAlertView alertViewWithTitle:title
	                               message:message
	                     cancelButtonTitle:NSLocalizedString(@"Dismiss", @"")];
}

+ (UIAlertView *)alertViewWithTitle:(NSString *)title
                            message:(NSString *)message
                  cancelButtonTitle:(NSString *)cancelButtonTitle
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
	                                                message:message
	                                               delegate:nil
	                                      cancelButtonTitle:cancelButtonTitle
	                                      otherButtonTitles:nil];
	[alert show];
	return alert;
}

+ (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSUInteger)buttonIndex
{
	if (buttonIndex == [alertView cancelButtonIndex]) {
		if (_cancelBlock) {
			_cancelBlock();
		}
	}

	else {
		if (_dismissBlock) {
			_dismissBlock(buttonIndex - 1); // cancel button is button 0
		}
	}
}

+ (UIAlertView *)alertViewWithError:(NSError *)error
{
	return [self alertViewWithTitle:@"Error" message:error.localizedDescription];
}

@end
