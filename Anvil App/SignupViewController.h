//
//  SignupViewController.h
//  Anvil App
//
//  Created by Mihir Tiwari on 8/12/17.
//  Copyright © 2017 Mihir Tiwari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *fName;
@property (nonatomic, weak) IBOutlet UITextField *lName;
@property (nonatomic, weak) IBOutlet UITextField *email;
@property (nonatomic, weak) IBOutlet UITextField *password;
@property (nonatomic, weak) IBOutlet UITextField *repeatPassword;
@property (nonatomic, weak) IBOutlet UITextField *phone;
@property (nonatomic, weak) IBOutlet UITextField *gradYear;

-(IBAction) submit;

@end
