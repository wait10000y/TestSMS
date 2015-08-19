//
//  ViewController.h
//  TestSMS
//
//  Created by wsliang on 15/5/14.
//  Copyright (c) 2015年 wsliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textZone;
@property (weak, nonatomic) IBOutlet UITextField *textPhone;
@property (weak, nonatomic) IBOutlet UITextField *textCode;

@property (weak, nonatomic) IBOutlet UITextView *textResult;

- (IBAction)actionOperations:(UIButton *)sender;



@end
