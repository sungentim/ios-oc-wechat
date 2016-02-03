//
//  SWCrashReport.m
//  iOS-oc-wechat
//
//  Created by winter on 16/2/3.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import "SWCrashReport.h"

@implementation SWCrashReport

kSWStrictSingletonForClass(SWCrashReport)

+ (void) registerCrashReport {
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
}

void UncaughtExceptionHandler(NSException *exception) {
    NSArray *arr = [exception callStackSymbols];//得到当前调用栈信息
    NSString *reason = [exception reason];//非常重要，就是崩溃的原因
    NSString *name = [exception name];//异常类型
    NSLog(@"程序崩溃信息 \n 异常类型 : %@ \n 崩溃原因 : %@ \n 调用栈信息 : %@", name, reason, arr);
}
@end
