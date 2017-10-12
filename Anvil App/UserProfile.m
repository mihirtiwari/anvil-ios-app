//
//  UserProfile.m
//  Anvil App
//
//  Created by Mihir Tiwari on 8/12/17.
//  Copyright © 2017 Mihir Tiwari. All rights reserved.
//

#import "UserProfile.h"

@implementation UserProfile

@synthesize firstName, lastName, email, uid, skills, paid, gradYear, student, phoneNumber;

-(instancetype) init {
    return [self initWithDetails:@"None" lastName:@"None" email:@"none@none.com" gradYear:0000 studentOrNot:false phoneNumber:@"(000) 000-0000"];
}

-(instancetype) initWithDetails:(NSString *)firstname lastName:(NSString *)lastName email:(NSString *)email gradYear:(int)gradYear studentOrNot:(BOOL)student phoneNumber:(NSString *)phoneNumber {
    self = [super init];
    if (self != nil){
        self.firstName = firstname;
        self.lastName = lastName;
        self.email = email;
        self.gradYear = gradYear;
        self.student = student;
        self.phoneNumber = phoneNumber;
    }
    
    return self;
}

-(void) addSkill: (NSString *) skill
{
    if (!skills)
        skills = [[NSMutableArray alloc] init];
    
    [skills addObject: skill];
}

-(BOOL) checkIfPaid {
    //make call to api and if paid status then set that in the object
    return false;
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self != nil){
        self.firstName = [aDecoder decodeObjectForKey:@"firstName"];
        self.lastName = [aDecoder decodeObjectForKey:@"lastName"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.phoneNumber = [aDecoder decodeObjectForKey:@"phoneNumber"];
        self.student = [aDecoder decodeBoolForKey:@"student"];
        self.gradYear = [aDecoder decodeIntForKey:@"gradYear"];
        self.paid = [aDecoder decodeBoolForKey:@"paid"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.skills = [aDecoder decodeObjectForKey:@"skills"];
    }
    
    return self;
}

-(void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:firstName forKey:@"firstName"];
    [aCoder encodeObject:lastName forKey:@"lastName"];
    [aCoder encodeObject:email forKey:@"email"];
    [aCoder encodeObject:phoneNumber forKey:@"phoneNumber"];
    [aCoder encodeBool:student forKey:@"student"];
    [aCoder encodeInteger:gradYear forKey:@"gradYear"];
    [aCoder encodeBool:paid forKey:@"paid"];
    [aCoder encodeObject:uid forKey:@"uid"];
    [aCoder encodeObject:skills forKey:@"skills"];
}

@end
