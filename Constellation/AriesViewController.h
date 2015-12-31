//
//  AriesViewController.h
//  Constellation
//
//  Created by 孙晓林 on 13-9-10.
//  Copyright (c) 2013年 孙晓林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AriesViewController : UIViewController<NSXMLParserDelegate>
{
    NSMutableArray *parserObjects;//存放每一个dictionary
    NSMutableString *tempString;//临时字符串
}
@property (nonatomic,retain) NSString *URL;//存放地址
@property (nonatomic,retain) NSXMLParser *xmlParser;//xml解析
@property (nonatomic,retain) NSMutableString *tempString;//临时字符串
@property (nonatomic,retain) NSMutableDictionary *dataDic;//存放item
@property (nonatomic,retain) NSString *currentElement;//当前结点
@property (strong, nonatomic) IBOutlet UILabel *Date;//显示日期
@property (strong, nonatomic) IBOutlet UILabel *label1;//综合运势
@property (strong, nonatomic) IBOutlet UILabel *label2;//爱情运势
@property (strong, nonatomic) IBOutlet UILabel *label3;//理财投资
@property (strong, nonatomic) IBOutlet UILabel *label4;//工作状况
@property (strong, nonatomic) IBOutlet UILabel *label5;//健康指数
@property (strong, nonatomic) IBOutlet UILabel *label6;//商谈指数
@property (strong, nonatomic) IBOutlet UILabel *label7;//幸运颜色
@property (strong, nonatomic) IBOutlet UILabel *label8;//幸运数字
@property (strong, nonatomic) IBOutlet UILabel *label9;//速配星座
@property (strong, nonatomic) IBOutlet UILabel *label10;//综合概述
@property (strong, nonatomic) IBOutlet UILabel *word5;
@property (strong, nonatomic) IBOutlet UILabel *word6;
@property (strong, nonatomic) IBOutlet UILabel *word7;
@property (strong, nonatomic) IBOutlet UILabel *word8;
@property (strong, nonatomic) IBOutlet UILabel *word9;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UIScrollView *rool;//滚动视图
@property (strong, nonatomic) IBOutlet UIImageView *s1;
@property (strong, nonatomic) IBOutlet UIImageView *s2;
@property (strong, nonatomic) IBOutlet UIImageView *s3;
@property (strong, nonatomic) IBOutlet UILabel *s4;
@property (strong,nonatomic)  UIActivityIndicatorView *activity;
@end
