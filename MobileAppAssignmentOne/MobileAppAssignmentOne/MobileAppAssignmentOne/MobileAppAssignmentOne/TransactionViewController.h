//
//  TransactionViewController.h
//  MobileAppAssignmentOne
//
//  Created by nmoccia on 1/28/14.
//  Copyright (c) 2014 nmoccia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BankAccount.h"

@interface TransactionViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *transactionTextView;

@property (strong, nonatomic) BankAccount *account;
@property (strong, nonatomic) IBOutlet UILabel *balanceLabel;

@end
