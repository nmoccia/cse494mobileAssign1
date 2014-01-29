//
//  MobileAppAssignmentOneViewController.m
//  MobileAppAssignmentOne
//
//  Created by nmoccia on 1/28/14.
//  Copyright (c) 2014 nmoccia. All rights reserved.
//

#import "MobileAppAssignmentOneViewController.h"
#import "TransactionViewController.h"

@interface MobileAppAssignmentOneViewController ()

@end

@implementation MobileAppAssignmentOneViewController

- (BankAccount*)account
{
    if(_account == Nil)
    {
        _account = [[BankAccount alloc] init];
    }
    return _account;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// deposit button is hit
- (IBAction)depositButton:(id)sender {
    
    // these lines gather the text in the string field, and, if possible, parses it into a double
    double transferDouble;
    NSString *transferString = self.textField.text;
    NSScanner *scanner = [NSScanner scannerWithString:transferString];
    BOOL isDoubleSuccess = [scanner scanDouble:&transferDouble];
    
    // if the text in the text field was successfully parsed into a double then the deposit code is called
    if (isDoubleSuccess)
    {
        // if the double is positive then the deposit goes through, else an error is put to NSLog
        if (transferDouble >= 0)
        {
            // amount is deposited
            [self.account deposit:transferDouble];
        
            // strings are concatanated for the purpose of putting into the transactionList
            NSString *depo = @"Deposited $";
            NSString *concatString = [NSString stringWithFormat:@"%@%.02f", depo, transferDouble];
            [self.account addTransaction:(concatString)];
        }
        else
        {
            NSLog(@"Error: double entered was not a positive value");
        }
    }
    else
    {
        NSLog(@"Error: text in field could not be resolved to a double");
    }
}

// withdraw button is hit
- (IBAction)withdrawButton:(id)sender {
    
    // these lines gather the text in the string field, and, if possible, parses it into a double
    double transferDouble;
    NSString *transferString = self.textField.text;
    NSScanner *scanner = [NSScanner scannerWithString:transferString];
    BOOL isDoubleSuccess = [scanner scanDouble:&transferDouble];
    
    // if the text in the text field was successfully parsed into a double then the withdraw code is called
    if (isDoubleSuccess)
    {
        // if the double is positive then the withdraw continues, else an error is put to NSLog
        if (transferDouble >= 0)
        {
            // if the withdraw amount is less than the current balance in the account then the withdraw is successful
            // and is allowed to proceed
            BOOL withdrawSuccess = [self.account withdraw:transferDouble];
            if (withdrawSuccess)
            {
                // strings are concatanated for the purpose of putting into the transactionList
                NSString *depo = @"Withdrew $";
                NSString *concatString = [NSString stringWithFormat:@"%@%.02f", depo, transferDouble];
                [self.account addTransaction:(concatString)];
            }
        }
        else
        {
            NSLog(@"Error: double entered was not a positive value");
        }
    }
    else
    {
        NSLog(@"Error: text in field could not be resolved to a double");
    }
}

// Send the bank account to the next class
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    TransactionViewController *nextView = [segue destinationViewController];
    nextView.account = self.account;
}

# pragma mark - UITextFieldDelegate

// Make the text field go away when return is pressed
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


@end
