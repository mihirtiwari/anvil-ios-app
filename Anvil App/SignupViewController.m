//
//  SignupViewController.m
//  Anvil App
//
//  Created by Mihir Tiwari on 8/12/17.
//  Copyright © 2017 Mihir Tiwari. All rights reserved.
//

#import "SignupViewController.h"
#import "NSString+EmailValidation.h"
#import "UserProfile.h"

@implementation SignupViewController
{
    UIAlertController *alert;
}

@synthesize fName, lName, email, password, repeatPassword, gradYear, phone;

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
        
//        fName.text = @"";
//        lName.text = @"";
//        email.text = @"";
//        password.text = @"";
//        repeatPassword.text = @"";
//        gradYear.text = @"";
    }
    else if (![email.text emailValid]){
        alert = [UIAlertController alertControllerWithTitle:@"Error!" message: @"Invalid email given." preferredStyle: UIAlertControllerStyleAlert];
        
        [alert addAction:defaultAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
        
//        fName.text = @"";
//        lName.text = @"";
//        email.text = @"";
//        password.text = @"";
//        repeatPassword.text = @"";
//        gradYear.text = @"";
    }
    else if (![password.text isEqualToString:repeatPassword.text]){
        alert = [UIAlertController alertControllerWithTitle:@"Error!" message: @"Passwords do not match." preferredStyle: UIAlertControllerStyleAlert];
        
        [alert addAction:defaultAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
        
//        fName.text = @"";
//        lName.text = @"";
//        email.text = @"";
//        password.text = @"";
//        repeatPassword.text = @"";
//        gradYear.text = @"";
    }
    else{
        fName.text = [fName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        fName.text = [fName.text capitalizedString];
        
        lName.text =[lName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        lName.text = [lName.text capitalizedString];
        
        NSDate *currentDate = [NSDate date];
        NSCalendar *currentCal = [NSCalendar currentCalendar];
        NSDateComponents *components = [currentCal components:NSCalendarUnitYear fromDate:currentDate];
        
        int currentYear = (int) [components year];
        
        BOOL isStudent = false;
        
        if (currentYear <= [gradYear.text intValue] && [gradYear.text intValue] <= currentYear + 4)
            isStudent = true;
        
        NSLog(@"Name: %@ %@\nEmail: %@\nPassword: %@\nGrad Year: %@", fName.text, lName.text, email.text, password.text, gradYear.text);
    
        UserProfile *user = [[UserProfile alloc] initWithDetails:fName.text lastName:lName.text email:email.text gradYear:[gradYear.text intValue] studentOrNot:isStudent phoneNumber:phone.text];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSData *userDate = [NSKeyedArchiver archivedDataWithRootObject:user];
        [defaults setObject:userDate forKey:@"user"];
        [defaults synchronize];
        
        [self performSegueWithIdentifier:@"signuptomain" sender:self];
    }
}

@end
