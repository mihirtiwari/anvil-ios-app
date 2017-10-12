//
//  UserProfile.h
//  Anvil App
//
//  Created by Mihir Tiwari on 8/12/17.
//  Copyright © 2017 Mihir Tiwari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserProfile : NSObject <NSCoding>

@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic) BOOL paid;
@property (nonatomic) int gradYear;
@property (nonatomic) BOOL student;
@property (nonatomic, strong) NSMutableArray *skills;
@property (nonatomic, copy) NSString *phoneNumber;

-(instancetype) initWithDetails: (NSString *) firstname
                lastName: (NSString *) lastName
                email: (NSString *) email
                gradYear: (int) gradYear
                studentOrNot: (BOOL) student
                phoneNumber: (NSString *) phoneNumber;

-(void) addSkill: (NSString *) skill;
-(BOOL) checkIfPaid;

@end
