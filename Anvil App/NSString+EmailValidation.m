//
//  NSString+EmailValidation.m
//  Anvil App
//
//  Created by Mihir Tiwari on 8/12/17.
//  Copyright © 2017 Mihir Tiwari. All rights reserved.
//

#import "NSString+EmailValidation.h"

@implementation NSString (EmailValidation)

-(BOOL) emailValid
{
    BOOL strictFilter = NO;
    NSString *strictFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxFilterString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    
    NSString *filter = strictFilter ? strictFilterString : laxFilterString;
    
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", filter];
    
    return [test evaluateWithObject:self];
}

@end
