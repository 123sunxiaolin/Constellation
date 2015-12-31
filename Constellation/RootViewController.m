//
//  RootViewController.m
//  Constellation
//
//  Created by 孙晓林 on 13-9-10.
//  Copyright (c) 2013年 孙晓林. All rights reserved.
//

#import "RootViewController.h"
#import "EveryDayViewController.h"
#import "TomorrowViewController.h"
#import "WeekViewController.h"
#import "MonthViewController.h"
#import "YearViewController.h"
#import "LOVEViewController.h"
#import "InquiryViewController.h"
#import <ShareSDK/ShareSDK.h>

@interface RootViewController ()

@end

@implementation RootViewController
@synthesize pageControl,scrollView,helpimage;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    NSLog(@"%f",[UIScreen mainScreen].bounds.size.height);
    //设置分享按钮
    NSLog(@"%f",[UIScreen mainScreen].bounds.size.width);
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithTitle:@"分享" style:UIBarButtonItemStyleBordered target:self action:@selector(sendButtonClickHandler:)];
    self.navigationItem.rightBarButtonItem=right;

    self.navigationController.navigationBar.hidden = NO;
    //设置主页面背景
    UIImage *background=[UIImage imageNamed:@"mainmenuview.png"];
    UIImageView *backgroundView=[[UIImageView alloc]initWithImage:background];
    [backgroundView setFrame:CGRectMake(0, -20, 320, 480)];
    [self.view addSubview:backgroundView];
    
    
    //今日运势
    QuadCurveMenuItem *starMenuItem1 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"today.png"]
                                                               highlightedImage:
                                    [UIImage imageNamed:@"hui1.png"]
                                                                ContentImage:[UIImage imageNamed:@"today1.png"]
                                                        highlightedContentImage:nil];
    //明日运势
    QuadCurveMenuItem *starMenuItem2 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"tomorrow.png"]
                                                               highlightedImage:
                                                 [UIImage imageNamed:@"yellow.png"]
                                                                   ContentImage:
                                                [UIImage imageNamed:@"tomorrow1.png"]
                                                        highlightedContentImage:nil];
    //每周运势
    QuadCurveMenuItem *starMenuItem3 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"zise.png"]
                                                               highlightedImage:
                                                 [UIImage imageNamed:@"green.png"]
                                                                   ContentImage:[UIImage imageNamed:@"weekview.png"]
                                                        highlightedContentImage:nil];
    //每月运势
    QuadCurveMenuItem *starMenuItem4 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"today.png"]
                                                               highlightedImage:[UIImage imageNamed:@"blackmonth.png"]
                                                                   ContentImage:[UIImage imageNamed:@"monthview.png"]
                                                        highlightedContentImage:nil];
    //帮助界面
    QuadCurveMenuItem *starMenuItem5 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"zise.png"]
                                                               highlightedImage:[UIImage imageNamed:@"redview.png"]
                                                                   ContentImage:[UIImage imageNamed:@"i.png"]
                                                        highlightedContentImage:nil];
    //查询页面
    QuadCurveMenuItem *starMenuItem6 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"zonghe.png"]
                                                               highlightedImage:[UIImage imageNamed:@"lovered.png"]
                                                                   ContentImage:[UIImage imageNamed:@"check.png"]
                                                        highlightedContentImage:nil];
    //年度爱情运势
    QuadCurveMenuItem *starMenuItem7 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"loveview.png"]
                                                               highlightedImage:[UIImage imageNamed:@"orange.png"]
                                                                   ContentImage:[UIImage imageNamed:@"loveview1.png"]
                                                        highlightedContentImage:nil];
    //年度总运势
    QuadCurveMenuItem *starMenuItem8 = [[QuadCurveMenuItem alloc] initWithImage:[UIImage imageNamed:@"zonghe.png"]
                                                               highlightedImage:[UIImage imageNamed:@"blue.png"]
                                                                   ContentImage:[UIImage imageNamed:@"year.png"]
                                                        highlightedContentImage:nil];
    
    
    NSArray *menus = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, starMenuItem4, starMenuItem5, starMenuItem6, starMenuItem7,starMenuItem8, nil];
    
    QuadCurveMenu *menu = [[QuadCurveMenu alloc] initWithFrame:self.view.bounds menus:menus];
	
	
    menu.delegate = self;//重要
    
    [self.view addSubview:menu];
  //——————————————————————————————————————————————————————————》
    self.navigationController.navigationBarHidden=YES;//隐藏导航栏
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    //隐藏状态栏
    
    //初始化scrollView
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    scrollView.pagingEnabled = YES;     //每次移动一页
    scrollView.showsVerticalScrollIndicator = NO;   //不显示垂直滚动条
    scrollView.showsHorizontalScrollIndicator = NO; //不显示水平滚动条
    scrollView.delegate =self; //设置委托方法
    scrollView.contentSize = CGSizeMake(320 * 3, 0);    //设置ScrollView内容长度
    [self.view addSubview:scrollView];
    [super viewDidLoad];
    
    //添加view
    for (int i=0; i<=2; i++) {
        helpimage=[[UIImageView alloc]initWithFrame:CGRectMake(320*i, 0, 320, 480)];
        if (i==0) {
            
            helpimage.image=[UIImage imageNamed:@"page1.png"];
        }
        else if (i==1)
        {
           
            helpimage.image=[UIImage imageNamed:@"page2.png"];
        }
        else
        {
            helpimage.frame=CGRectMake(320*2, -20, 320, 480);
            helpimage.image=[UIImage imageNamed:@"page3.png"];
            
        }
        
        [scrollView addSubview:helpimage];
           
    }
    
    
    //添加跳转按钮
    UIButton *start=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    start.frame=CGRectMake(830, 410, 120, 40);
    start.titleLabel.textColor=[UIColor redColor];
    [start setTitle:@"开始体验吧!" forState:UIControlStateNormal];
    start.titleLabel.font=[UIFont systemFontOfSize:18];
    [start addTarget:self action:@selector(mainchange:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:start];
    
    
    //初始化pagecontrol
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 390, 320, 80)];
    pageControl.hidesForSinglePage = YES;
    pageControl.userInteractionEnabled = NO;
    pageControl.backgroundColor=[UIColor clearColor];
    pageControl.numberOfPages = 3; //总页码
    pageControl.currentPage = 0;    //当前页码
    [self.view addSubview:pageControl];
//————————————————————————————————————————————————————————》
    //判断是否显示引导页
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        self.navigationController.navigationBarHidden=YES;//导航栏隐藏
        scrollView.hidden = NO;
        pageControl.hidden=NO;
    }
    else
    {
        scrollView.hidden = YES;
        pageControl.hidden=YES;
        self.navigationController.navigationBarHidden=NO;
     }

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //获取当前页码
    int index = fabs(scrollView.contentOffset.x) /scrollView.frame.size.width;
    //设置当前页码
     pageControl.currentPage = index;
}
 -(void)mainchange:(id)sender
{
    scrollView.hidden=YES;//滚动视图的隐藏
    pageControl.hidden=YES;//pagecontrol的隐藏
    self.navigationController.navigationBarHidden=NO;
    //标记不是第一次使用引导页
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}


-(void)sendButtonClickHandler:(id)sender
{
    //在显示等待分享的时间中显示的画面
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"Mylaunchimage"ofType:@"png"];
    
    //构造分享内容
    id<ISSContent>publishContent= [ShareSDK content:@"哇伊!我和我的小伙伴都惊呆啦！《星缘座语》 可以测运势啦，一到三颗星为运气差，三颗星以上为运气好，只要知道星座就知道运势啦，还等什么啊！"
                                     defaultContent:nil
                                              image:[ShareSDK imageWithPath:imagePath]
                                              title:@"星缘座语"
                                                url:nil
                                        description:nil mediaType:SSPublishContentMediaTypeText];
    //手动授权
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:YES
                                                         authViewStyle: SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:nil];
    //设置一键分享表
    NSArray *oneKeyShareList = [ShareSDK getShareListWithType:
                                ShareTypeSinaWeibo,
                                ShareTypeTencentWeibo,
                                nil];
    
    //一个ShareOptions对象，用来定义分享行为
    id<ISSShareOptions> shareOptions = [ShareSDK defaultShareOptionsWithTitle:@"星缘座语"   //分享视图标题
                                                              oneKeyShareList:oneKeyShareList          //一键分享菜单
                                                               qqButtonHidden:YES                        //QQ分享按钮是否隐藏
                                                        wxSessionButtonHidden:YES                //微信好友分享按钮是否隐藏
                                                       wxTimelineButtonHidden:YES             //微信朋友圈分享按钮是否隐藏
                                                         showKeyboardOnAppear:NO                  //是否显示键盘
                                                            shareViewDelegate:nil                            //分享视图委托
                                                          friendsViewDelegate:nil                          //好友视图委托
                                                        picViewerViewDelegate:nil];                    //图片浏览视图委托
    
    
    //菜单方式分享包括：新浪微博 腾讯微博
    [ShareSDK showShareActionSheet:nil
                         shareList:oneKeyShareList                           content:publishContent
                     statusBarTips:YES
                      authOptions :authOptions//是否手动授权
                      shareOptions:shareOptions
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo,id<ICMErrorInfo>error,BOOL end){
                                if (state == SSPublishContentStateSuccess) {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error
                                                                   errorCode],[error errorDescription]); }
                            }];
}

//设置选择不同的按钮
- (void)quadCurveMenu:(QuadCurveMenu *)menu didSelectIndex:(NSInteger)idx
{
    NSLog(@"Select the index : %d",idx);
    
    if (idx==0) {
        EveryDayViewController *everyDay=[[EveryDayViewController alloc]init];
        everyDay.title=@"每日星座运势";
        [self.navigationController pushViewController:everyDay animated:YES];
    }
    else if (idx==1)
    {
        TomorrowViewController *tomorrow=[[TomorrowViewController alloc]init];
        tomorrow.title=@"明日星座运势";
        [self.navigationController pushViewController:tomorrow animated:YES];
    }
    else if (idx==2)
    {
        WeekViewController *week=[[WeekViewController alloc]init];
        week.title=@"每周星座运势";
      [self.navigationController pushViewController:week animated:YES];
    }
    else if (idx==3)
    {
        MonthViewController *month=[[MonthViewController alloc]init];
        month.title=@"每月星座运势";
    [self.navigationController pushViewController:month animated:YES];
    }
    else if (idx==7)
    {
        YearViewController *year=[[YearViewController alloc]init];
        year.title=@"星座年度运势";
    [self.navigationController pushViewController:year animated:YES];
    }
    else if (idx==6)
    {
        LOVEViewController *love=[[LOVEViewController alloc]init];
        love.title=@"星座年度爱情运势";
    [self.navigationController pushViewController:love animated:YES];
    }
    else if (idx==5)
    {
        InquiryViewController *inquiry=[[InquiryViewController alloc]init];
        inquiry.title=@"星座查询";
        [self.navigationController pushViewController:inquiry animated:YES];
    }
    else
    {//引导页
        self.navigationController.navigationBarHidden=YES;//隐藏导航栏
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        //隐藏状态栏
        //初始化scrollView
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
        scrollView.pagingEnabled = YES;     //每次移动一页
        scrollView.showsVerticalScrollIndicator = NO;   //不显示垂直滚动条
        scrollView.showsHorizontalScrollIndicator = NO; //不显示水平滚动条
        scrollView.delegate =self; //设置委托方法
        scrollView.contentSize = CGSizeMake(320 * 3, 0);    //设置ScrollView内容长度
        [self.view addSubview:scrollView];
        [super viewDidLoad];
        
        //添加view
        for (int i=0; i<=2; i++) {
            helpimage=[[UIImageView alloc]initWithFrame:CGRectMake(320*i, 0, 320, 480)];
            if (i==0) {
                
                helpimage.image=[UIImage imageNamed:@"page1.png"];
            }
            else if (i==1)
            {
                // helpimage.frame=CGRectMake(320, -20, 320, 480);
                helpimage.image=[UIImage imageNamed:@"page2.png"];
            }
            else
            {
                helpimage.frame=CGRectMake(320*2, -20, 320, 480);
                helpimage.image=[UIImage imageNamed:@"page3.png"];
                
            }
            [scrollView addSubview:helpimage];
         }
        
        
        //添加跳转按钮
        UIButton *start=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        start.frame=CGRectMake(830, 410, 120, 40);
        start.titleLabel.textColor=[UIColor redColor];
        [start setTitle:@"开始体验吧!" forState:UIControlStateNormal];
        start.titleLabel.font=[UIFont systemFontOfSize:18];
        [start addTarget:self action:@selector(mainchange:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:start];
        
        
        //初始化pagecontrol
        pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 390, 320, 80)];
        pageControl.hidesForSinglePage = YES;
        pageControl.userInteractionEnabled = NO;
        pageControl.backgroundColor=[UIColor clearColor];
        pageControl.numberOfPages = 3; //总页码
        pageControl.currentPage = 0;    //当前页码
        [self.view addSubview:pageControl];

    }
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
