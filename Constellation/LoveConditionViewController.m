//
//  LoveConditionViewController.m
//  Constellation
//
//  Created by 孙晓林 on 13-9-18.
//  Copyright (c) 2013年 孙晓林. All rights reserved.
//

#import "LoveConditionViewController.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"

@interface LoveConditionViewController ()

@end

@implementation LoveConditionViewController
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
    activity.center=CGPointMake(150, 150);//任务指示器的位置
    activity.color=[UIColor grayColor];
    [self.view addSubview:activity];
    [activity startAnimating];//开始转动
    activity.hidesWhenStopped=YES;
    
    
    //数据加载。。。
    NSURL *url = [NSURL URLWithString:URL];
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setValidatesSecureCertificate:NO];
    [request setDelegate:self];
    [request setDidFailSelector:@selector(ASIHttpRequestFailed:)];
    [request setDidFinishSelector:@selector(ASIHttpRequestSuceed:)];
    [request startAsynchronous];//启动同步请求
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

    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 3;
    }else if (section==1)
    {
        return 1;
    }else
    {
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
//————————————————————————————————————————————————————————》》
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
    NSDictionary *boys=[[NSDictionary alloc]init];
    boys=[jsonObjects objectAtIndex:1];//男生篇
    NSDictionary *girls=[[NSDictionary alloc]init];
    girls=[jsonObjects objectAtIndex:2];//女生篇
    if (indexPath.section==2)
    {
        if (indexPath.row==0)
        {
            cell.textLabel.text=[boys objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"girl.png"];
         cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        else
        {
            cell.textLabel.text=[girls objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"boy.png"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([jsonObjects count]==0) {//用于处理网络未连接时数据加载问题
    UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"数据未加载成功!" delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
        [detail show];//数据未加载
        return;
    }
    else 
    {
    if (indexPath.section==0) {
        return;
    }//使第一块不具有可选项
 //——————————————————————————————————————————————————————————》
    if (indexPath.section==1) {
        NSDictionary *zhengti1=[[NSDictionary alloc]init];
        zhengti1=[jsonObjects objectAtIndex:0];
          NSString *s=[[NSString alloc]initWithString:[zhengti1 objectForKey:@"value"]];
          UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
        [detail show];//整体运势的详细信息
    }
    //--------------------------------------------------------
     else
     {
         NSDictionary *boys=[[NSDictionary alloc]init];
         boys=[jsonObjects objectAtIndex:1];//男生篇
         NSDictionary *girls=[[NSDictionary alloc]init];
         girls=[jsonObjects objectAtIndex:2];//女生篇
         if (indexPath.row==0)
         {
            NSString *s=[[NSString alloc]initWithString:[boys objectForKey:@"value"]];
            UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
             [detail show];
         }
         else
         {
             NSString *s=[[NSString alloc]initWithString:[girls objectForKey:@"value"]];
             UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
             [detail show];

         }
     }
    }
   }

@end
