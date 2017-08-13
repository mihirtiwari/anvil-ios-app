//
//  SignupViewController.m
//  Anvil App
//
//  Created by Mihir Tiwari on 8/12/17.
//  Copyright © 2017 Mihir Tiwari. All rights reserved.
//

#import "SignupViewController.h"
#import "NSString+EmailValidation.h"

@implementation SignupViewController
{
    UIAlertController *alert;
}

@synthesize fName, lName, email, password, repeatPassword, gradYear;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) submit
{
    UIAlertAction *defaultAlert = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
    
    if (fName.text.length == 0 || lName.text.length == 0 || email.text.length == 0 || password.text.length == 0 || repeatPassword.text.length == 0 || gradYear.text.length == 0){
        alert = [UIAlertController alertControllerWithTitle:@"Error!" message: @"All fields must be filled in to proceed." preferredStyle: UIAlertControllerStyleAlert];
        
        [alert addAction:defaultAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        fName.text = @"";
        lName.text = @"";
        email.text = @"";
        password.text = @"";
        repeatPassword.text = @"";
        gradYear.text = @"";
    }
    else if (![email.text emailValid]){
        alert = [UIAlertController alertControllerWithTitle:@"Error!" message: @"Invalid email given." preferredStyle: UIAlertControllerStyleAlert];
        
        [alert addAction:defaultAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        fName.text = @"";
        lName.text = @"";
        email.text = @"";
        password.text = @"";
        repeatPassword.text = @"";
        gradYear.text = @"";
    }
    else if (![password.text isEqualToString:repeatPassword.text]){
        alert = [UIAlertController alertControllerWithTitle:@"Error!" message: @"Passwords do not match." preferredStyle: UIAlertControllerStyleAlert];
        
        [alert addAction:defaultAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        fName.text = @"";
        lName.text = @"";
        email.text = @"";
        password.text = @"";
        repeatPassword.text = @"";
        gradYear.text = @"";
    }
    else{
        NSLog(@"Name: %@ %@\nEmail: %@\nPassword: %@\nGrad Year: %@", fName.text, lName.text, email.text, password.text, gradYear.text);
    
        [self performSegueWithIdentifier:@"signuptomain" sender:self];
    }
}

@end
