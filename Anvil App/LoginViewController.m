//
//  LoginViewController.m
//  Anvil App
//
//  Created by Mihir Tiwari on 8/12/17.
//  Copyright © 2017 Mihir Tiwari. All rights reserved.
//

#import "LoginViewController.h"
#import "NSString+EmailValidation.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
{
    UIAlertController *alert;
}

@synthesize emailField, passwordField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) login
{
    UIAlertAction *defaultAlert = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
    
    if (emailField.text.length == 0 || passwordField.text.length == 0){
        alert = [UIAlertController alertControllerWithTitle:@"Error!" message: @"All fields must be filled in to proceed." preferredStyle: UIAlertControllerStyleAlert];

        [alert addAction:defaultAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        emailField.text = @"";
        passwordField.text = @"";
    }
    else if (![emailField.text emailValid]){
        alert = [UIAlertController alertControllerWithTitle:@"Error!" message: @"Invalid email given." preferredStyle: UIAlertControllerStyleAlert];
        
        [alert addAction:defaultAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        emailField.text = @"";
        passwordField.text = @"";
    }
    else{
        NSLog(@"Email is: %@ and password is: %@", emailField.text, passwordField.text);
        [self performSegueWithIdentifier:@"logintomain" sender:self];
    }
}

- (IBAction) signup
{
    [self performSegueWithIdentifier:@"logintosignup" sender:self];
}

@end
