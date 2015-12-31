//
//  YueViewController.h
//  Constellation
//
//  Created by 孙晓林 on 13-9-18.
//  Copyright (c) 2013年 孙晓林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YueViewController : UITableViewController
{
     NSMutableArray *jsonObjects;//存放每一个dictionary
}
@property (nonatomic,retain) NSString *URL;//地址
@property (nonatomic,strong)  UIActivityIndicatorView *activity;//加载画面
@end
