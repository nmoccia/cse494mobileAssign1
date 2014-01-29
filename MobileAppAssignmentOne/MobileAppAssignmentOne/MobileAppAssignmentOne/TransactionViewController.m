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
    
    // Nick: It turns out that the insance of "account" is nil.
    // This makes sense because it is not set before this line in any method
    // To fix this, we had to add a way to get the bank account.
    // Check the method 'prepareForSegue' in 'MobileAppAssignmentOneViewController.m'
    
    self.transactionTextView.text = @"";
    for (NSString *transaction in self.account.transactionList) {
        self.transactionTextView.text = [NSString stringWithFormat:@"%@%@\n",self.transactionTextView.text , transaction.description ];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
