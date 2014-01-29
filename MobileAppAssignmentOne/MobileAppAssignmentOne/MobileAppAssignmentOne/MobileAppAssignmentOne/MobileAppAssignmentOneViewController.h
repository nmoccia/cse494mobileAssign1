//
//  MobileAppAssignmentOneViewController.h
//  MobileAppAssignmentOne
//
//  Created by nmoccia on 1/28/14.
//  Copyright (c) 2014 nmoccia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BankAccount.h"

@interface MobileAppAssignmentOneViewController : UIViewController <UITextFieldDelegate>{
    BOOL keyboardIsShown;
}


@property (strong, nonatomic) BankAccount *account;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)depositButton:(id)sender;
- (IBAction)withdrawButton:(id)sender;


@end
