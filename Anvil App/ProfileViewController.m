//
//  ProfileViewController.m
//  Anvil App
//
//  Created by Mihir Tiwari on 10/7/17.
//  Copyright © 2017 Mihir Tiwari. All rights reserved.
//

#import "ProfileViewController.h"

@implementation ProfileViewController

@synthesize phoneNumber, name, gradYear, paid, user, email, studentStatus, profilePic;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    user = [NSKeyedUnarchiver unarchiveObjectWithData:[defaults objectForKey:@"user"]];
    
    // Do any additional setup after loading the view, typically from a nib.
    [name setText:[NSString stringWithFormat:@"%s %s", [user.firstName UTF8String], [user.lastName UTF8String]]];
    [email setText:[NSString stringWithFormat:@"%s", [user.email UTF8String]]];
    [gradYear setText:[NSString stringWithFormat:@"%d", user.gradYear]];
    [studentStatus setText:[NSString stringWithFormat:@"%s", user.student ? "Student" : "Not Student"]];
    [phoneNumber setText:[NSString stringWithFormat:@"%s", [user.phoneNumber UTF8String]]];
    [paid setText:[NSString stringWithFormat:@"%s", user.paid ? "Paid" : "Not Paid"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) logOut {
    [self performSegueWithIdentifier:@"logout" sender:self];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"user"];
}

@end
