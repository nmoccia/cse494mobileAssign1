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
    BOOL success = [scanner scanDouble:&transferDouble];
    
    // if the text in the text field was successfully parsed into a double then the deposit code is called
    if (success)
    {
        // amount is deposited
        [self.account deposit:transferDouble];
        
        // strings are concatanated for the purpose of putting into the transactionList
        NSString *depo = @"Deposited $";
        NSString *concatString = [NSString stringWithFormat:@"%@%@", depo, transferString];
        [self.account addTransaction:(concatString)];
        
    }
    else
    {
        NSLog(@"Error: text in field could not be resolved to a double");
    }
    
    
}


// withdraw button is hit
- (IBAction)withdrawButton:(id)sender {
    double transferDouble;
    NSString *transferString = self.textField.text;
    
    NSScanner *scanner = [NSScanner scannerWithString:transferString];
    BOOL success = [scanner scanDouble:&transferDouble];
    
    if (success)
    {
        [self.account withdraw:transferDouble];
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
