//
//  TransactionViewController.m
//  MobileAppAssignmentOne
//
//  Created by nmoccia on 1/28/14.
//  Copyright (c) 2014 nmoccia. All rights reserved.
//

#import "TransactionViewController.h"

@interface TransactionViewController ()

@end

@implementation TransactionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Initialize the transactionTextView to an empty string, and then loop through the transactionList
    // and fill it with all the elements therein
    self.transactionTextView.text = @"";
    for (NSString *transaction in self.account.transactionList) {
        self.transactionTextView.text = [NSString stringWithFormat:@"%@%@\n",self.transactionTextView.text , transaction.description ];
    }
    
    NSString* balanceString = [NSString stringWithFormat:@"$%.02f", self.account.ballance];
    self.balanceLabel.text = balanceString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
