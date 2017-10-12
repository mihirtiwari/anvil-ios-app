//
//  ProfileViewController.h
//  Anvil App
//
//  Created by Mihir Tiwari on 10/7/17.
//  Copyright © 2017 Mihir Tiwari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserProfile.h"

@interface ProfileViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImage *profilePic;
@property (nonatomic, weak) IBOutlet UILabel *name;
@property (nonatomic, weak) IBOutlet UILabel *email;
@property (nonatomic, weak) IBOutlet UILabel *phoneNumber;
@property (nonatomic, weak) IBOutlet UILabel *paid;
@property (nonatomic, weak) IBOutlet UILabel *gradYear;
@property (nonatomic, weak) IBOutlet UILabel *studentStatus;
@property (nonatomic) UserProfile *user;

-(IBAction) logOut;

@end
