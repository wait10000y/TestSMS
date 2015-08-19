//
//  ViewController.m
//  TestSMS
//
//  Created by wsliang on 15/5/14.
//  Copyright (c) 2015年 wsliang. All rights reserved.
//

#import "ViewController.h"

#import <SMS_SDK/SMS_SDK.h>

@interface ViewController ()

@end

@implementation ViewController

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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  [super touchesBegan:touches withEvent:event];
  [[UIApplication sharedApplication].keyWindow endEditing:YES];
}


- (IBAction)actionOperations:(UIButton *)sender {
    
    NSString *zoneText = self.textZone.text;
    NSString *phoneText = self.textPhone.text;
    NSString *codeText = self.textCode.text;
    
    switch (sender.tag) {
        case 100: // 发送短信验证码
        {
            
            self.textResult.text = @"正在发送 短信验证码...";
            [SMS_SDK getVerificationCodeBySMSWithPhone:phoneText
                                                  zone:zoneText
                                                result:^(SMS_SDKError *error)
             {
                 if (error){
                     self.textResult.text = [NSString stringWithFormat:@"发送失败 状态码：%zi ,错误描述：%@",error.errorCode,error.errorDescription];
                 }else{
                     self.textResult.text = @"发送成功.";
                 }
             }];
            
        } break;
        case 101:// 发送语音验证码
        {
            
            self.textResult.text = @"正在发送 语音验证码...";
            [SMS_SDK getVerificationCodeByVoiceCallWithPhone:phoneText
                                                        zone:zoneText
                                                      result:^(SMS_SDKError *error)
             {
                 
                 if (error){
                  self.textResult.text = [NSString stringWithFormat:@"发送失败 状态码：%zi ,错误描述：%@",error.errorCode,error.errorDescription];
                 }else{
                     self.textResult.text = @"发送成功.";
                 }
                     
             }];
            
        } break;
        case 102:// 验证 验证码
        {
            self.textResult.text = @"正在验证 code码...";
            [SMS_SDK commitVerifyCode:codeText result:^(enum SMS_ResponseState state){
                switch (state) {
                    case SMS_ResponseStateGetVerifyCodeFail:
                    {
                        self.textResult.text = @"验证失败";
                    } break;
                    case SMS_ResponseStateGetVerifyCodeSuccess:
                    {
                        self.textResult.text = @"验证成功";
                    } break;
                        
                    default:
                        self.textResult.text = @"未知状态";
                        break;
                }
            }];
            
        } break;
            
        case 1000:// 发送短信
        {
            NSString *msgStr = @"测试消息内容... O(∩_∩)O哈哈哈~";
            self.textResult.text = [NSString stringWithFormat:@"发送短信:%@",msgStr];
            [SMS_SDK sendSMS:phoneText AndMessage:msgStr];
            
        } break;
            
            
        default:
        {
            
            
        } break;
    }
    
}
@end
