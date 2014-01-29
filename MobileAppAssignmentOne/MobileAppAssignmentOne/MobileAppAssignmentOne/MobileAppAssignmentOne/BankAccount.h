//
//  BankAccount.h
//  MobileAppAssignmentOne
//
//  Created by nmoccia on 1/28/14.
//  Copyright (c) 2014 nmoccia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccount : NSObject

@property (nonatomic) double ballance;
@property (nonatomic,strong, readonly) NSArray *transactionList;

- (void) addTransaction:(NSString *)newTransaction;
- (Boolean) withdraw:(double )amount;
- (void) deposit:(double )amount;

@end
