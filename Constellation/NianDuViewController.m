//
//  NianDuViewController.m
//  Constellation
//
//  Created by 孙晓林 on 13-9-18.
//  Copyright (c) 2013年 孙晓林. All rights reserved.
//

#import "NianDuViewController.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"


@interface NianDuViewController ()

@end

@implementation NianDuViewController
@synthesize URL,activity;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
//网络请求失败
- (void)ASIHttpRequestFailed:(ASIHTTPRequest *)request{
    
    //if (request)
    //{}
    NSError *error = [request error];
	NSLog(@"the error is %@",error);
}
//网络请求成功
- (void)ASIHttpRequestSuceed:(ASIHTTPRequest *)request{
    
    //成功
    
    NSData *responseData = [request responseData];
    jsonObjects=[responseData objectFromJSONDataWithParseOptions:JKParseOptionLooseUnicode];//得到解析的数据
    NSLog(@"json解析＝%@",jsonObjects);
    [self.tableView reloadData];//重新加载数据
    [activity stopAnimating];
    }


- (void)viewDidLoad
{
    //加载任务指示器
    activity=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activity.center=CGPointMake(150, 200);
    activity.color=[UIColor grayColor];
    [self.view addSubview:activity];
    [activity startAnimating];
    activity.hidesWhenStopped=YES;
    
    
    //数据加载。。。
    NSURL *url = [NSURL URLWithString:URL];
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setValidatesSecureCertificate:NO];
    [request setDelegate:self];
    [request setDidFailSelector:@selector(ASIHttpRequestFailed:)];
    [request setDidFinishSelector:@selector(ASIHttpRequestSuceed:)];
    [request startAsynchronous];
    [request setDefaultResponseEncoding:NSUTF8StringEncoding];
    [super viewDidLoad];

   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 3;
    }else if (section==1)
    {
        return 1;
    }else if (section==2)
    {
        return 4;
    }else
    {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
//——————————————————————————————————————————————————————————》
    //在单元格上实现标题的显示
    NSDictionary *titledic=[[NSDictionary alloc]init];
    titledic = [jsonObjects objectAtIndex:[jsonObjects count]-2];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell.textLabel.text=[titledic objectForKey:@"cn"];
            cell.imageView.image=[UIImage imageNamed:@"headTitle .png"];
            cell.textLabel.font=[UIFont systemFontOfSize:20];
            cell.accessoryType=UITableViewCellAccessoryNone;
        }
        else if(indexPath.row==1)
        {
            NSArray *date=[[NSArray alloc]init];
            date=[jsonObjects objectAtIndex:[jsonObjects count]-1];
            cell.textLabel.text=[date objectAtIndex:0];
            cell.imageView.image=[UIImage imageNamed:@"date1.png"];
            cell.accessoryType=UITableViewCellAccessoryNone;
        }
        else
        {
            NSArray *date1=[[NSArray alloc]init];
            date1=[jsonObjects objectAtIndex:[jsonObjects count]-1];
            cell.accessoryType=UITableViewCellAccessoryNone;
            cell.textLabel.text=[date1 objectAtIndex:1];
            cell.imageView.image=[UIImage imageNamed:@"date2.png"];
        }
    }//第一块的实现标题与日期
    //－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    NSDictionary *zhengti=[[NSDictionary alloc]init];
    zhengti=[jsonObjects objectAtIndex:0];
    if (indexPath.section==1)
    {
        cell.textLabel.text=[zhengti objectForKey:@"title"];
        cell.imageView.image=[UIImage imageNamed:@"zheengti.png"];
        cell.accessoryType=
        UITableViewCellAccessoryDisclosureIndicator;
    }//第二模块  整体概况
    //－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    NSDictionary *subject=[[NSDictionary alloc]init];
    subject=[jsonObjects objectAtIndex:1];//功课学业
    NSDictionary *work=[[NSDictionary alloc]init];
    work=[jsonObjects objectAtIndex:2];//工作职场
    NSDictionary *money=[[NSDictionary alloc]init];
    money=[jsonObjects objectAtIndex:3];//金钱理财
    NSDictionary *marriage=[[NSDictionary alloc]init];
    marriage=[jsonObjects objectAtIndex:4];//恋爱婚姻
    if (indexPath.section==2)
    {
        if (indexPath.row==0) {
            cell.textLabel.text=[subject objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"study.png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        else if (indexPath.row==1)
        {
            cell.textLabel.text=[work objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"bao .png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        else if (indexPath.row==2)
        {
            cell.textLabel.text=[money objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"zhu.png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        else
        {
            cell.textLabel.text=[marriage objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"love2.png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
    }
     //－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    NSDictionary *tips=[[NSDictionary alloc]init];
    tips=[jsonObjects objectAtIndex:5];//小提示
    if (indexPath.section==3)
    {
        cell.textLabel.text=[tips objectForKey:@"title"];
        cell.imageView.image=[UIImage imageNamed:@"tips.png"];
        cell.accessoryType=
        UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([jsonObjects count]==0) {//处理数据未加载
    UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"数据未加载成功!" delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
        [detail show];//数据未加载
        return;
    }
    else
    {
    if (indexPath.section==0) {
        return;
    }//使第一块不具有可选项
  //————————————————————————————————————————————————————————————》
    if (indexPath.section==1) {
        NSDictionary *zhengti1=[[NSDictionary alloc]init];
        zhengti1=[jsonObjects objectAtIndex:0];
        
        NSString *s=[[NSString alloc]initWithString:[zhengti1 objectForKey:@"value"]];
        
        UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
        [detail show];//整体运势的详细信息
    }
    //--------------------------------------------------------
       else if (indexPath.section==2)
       {
           NSDictionary *subject=[[NSDictionary alloc]init];
           subject=[jsonObjects objectAtIndex:1];//功课学业
           NSDictionary *work=[[NSDictionary alloc]init];
           work=[jsonObjects objectAtIndex:2];//工作职场
           NSDictionary *money=[[NSDictionary alloc]init];
           money=[jsonObjects objectAtIndex:3];//金钱理财
           NSDictionary *marriage=[[NSDictionary alloc]init];
           marriage=[jsonObjects objectAtIndex:4];//恋爱婚姻
           
           if (indexPath.row==0)
           {
               NSString *s=[[NSString alloc]initWithString:[subject objectForKey:@"value"]];
            UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
               [detail show];
              }
           else if (indexPath.row==1)
              {
                NSString *s=[[NSString alloc]initWithString:[work objectForKey:@"value"]];
                  UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
                  [detail show];

              }
           else if (indexPath.row==2)
              {
                  NSString *s=[[NSString alloc]initWithString:[money objectForKey:@"value"]];
                  UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
                  [detail show];

              }else
              {
                  NSString *s=[[NSString alloc]initWithString:[marriage objectForKey:@"value"]];
                  UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
                  [detail show];
              }
        }
       else
       {
           NSDictionary *tips=[[NSDictionary alloc]init];
           tips=[jsonObjects objectAtIndex:5];//小提示
           NSString *s=[[NSString alloc]initWithString:[tips objectForKey:@"value"]];
           UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
           [detail show];
       }
    }
    }

@end
