//
//  InquiryViewController.h
//  Constellation
//
//  Created by 孙晓林 on 13-9-19.
//  Copyright (c) 2013年 孙晓林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InquiryViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong,nonatomic) NSArray *monthArray;//月
@property (strong,nonatomic) NSArray *dayArray;//日
@property (strong, nonatomic) IBOutlet UIPickerView *datePick;//选择日期
@property (strong, nonatomic) IBOutlet UILabel *showLabel;//显示星座
- (void)Today:(id)sender;//切换到今日星座运势
- (void)Tomorrow:(id)sender;//切换到明日星座运势
@property (strong, nonatomic) IBOutlet UIImageView *Picture;//显示星座图标
@property (strong, nonatomic) IBOutlet UILabel *showMonth;//显示月份
@property (strong, nonatomic) IBOutlet UILabel *showDate;//显示日子
@property (strong, nonatomic) IBOutlet UIButton *today;//今天的按钮
@property (strong, nonatomic) IBOutlet UIButton *tomorrow;//明天的按钮
@end
