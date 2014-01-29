//
//  BankAccount.m
//  MobileAppAssignmentOne
//
//  Created by nmoccia on 1/28/14.
//  Copyright (c) 2014 nmoccia. All rights reserved.
//

#import "BankAccount.h"

@interface BankAccount()

@property (nonatomic,strong) NSArray *transactionList;

@end

@implementation BankAccount

@synthesize transactionList = _transactionList;

-(id) init
{
    self = [super init];
    self.transactionList = [[NSMutableArray alloc] init];
    return self;
}

-(void) addTransaction:(NSString *)name
{
    // we declare as an NSArray publicly so that others don't modify our array
    // however we know that we actually have an NSMutableArray behind the scenes
    [(NSMutableArray *)self.transactionList addObject:name];
}

- (Boolean) withdraw:(double )amount
{
    if (self.ballance < amount)
    {
        // if the user attempts to withdraw more than they have in their ballance
        NSLog(@"Error: Attempted to withdraw more than is in the ballance");
        return false;
    }
    else
    {
        self.ballance -= amount;
        NSLog(@"Withdrew %f from ballance",amount);
        return true;
    }
}

- (void) deposit:(double )amount
{
    self.ballance += amount;
    NSLog(@"Deposited %f to ballance", amount);
}

@end
