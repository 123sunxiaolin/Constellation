//
//  RootViewController.h
//  Constellation
//
//  Created by 孙晓林 on 13-9-10.
//  Copyright (c) 2013年 孙晓林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuadCurveMenu.h"

@interface RootViewController : UIViewController<UIApplicationDelegate,QuadCurveMenuDelegate,UIScrollViewDelegate>
@property (retain,nonatomic) UIPageControl *pageControl;
@property (retain,nonatomic) UIScrollView *scrollView;
@property (strong,nonatomic) UIImageView *helpimage;
-(void)mainchange:(id)sender;//页面跳转
-(void)sendButtonClickHandler:(id)sender;//分享中的方法
@end
