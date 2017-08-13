//
//  LoginViewController.h
//  Anvil App
//
//  Created by Mihir Tiwari on 8/12/17.
//  Copyright © 2017 Mihir Tiwari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserProfile.h"

@interface LoginViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *emailField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;

// Actions
-(IBAction) login;
-(IBAction) signup;

@end
