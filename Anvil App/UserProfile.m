//
//  UserProfile.m
//  Anvil App
//
//  Created by Mihir Tiwari on 8/12/17.
//  Copyright © 2017 Mihir Tiwari. All rights reserved.
//

#import "UserProfile.h"

@implementation UserProfile

@synthesize firstName, lastName, email, uid, skills, paid, gradYear, student;

-(void) addSkill: (NSString *) skill
{
    if (!skills)
        skills = [[NSMutableArray alloc] init];
    
    [skills addObject: skill];
}

@end
