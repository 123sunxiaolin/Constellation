//
//  YueViewController.m
//  Constellation
//
//  Created by 孙晓林 on 13-9-18.
//  Copyright (c) 2013年 孙晓林. All rights reserved.
//

#import "YueViewController.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"

@interface YueViewController ()

@end

@implementation YueViewController
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
    // activity.frame=CGRectMake(140, 50, 40, 40);
    activity.center=CGPointMake(150, 240);
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

    // Return the number of sections.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section//返回每一块中的行数
{
    if (section==0)
    {
        return 3;
    }
    else if (section==1)
    {
        return 1;
    }
    else if(section==2)
    {
        return 2;
    }
    else
    {
        return 2;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath//返回cell的高度
{
    return 40;
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
        //cell.detailTextLabel.text=@"详细信息";
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }//第二模块  整体运势
    //－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    NSDictionary *love=[[NSDictionary alloc]init];//爱情运势
    love=[jsonObjects objectAtIndex:1];
    NSDictionary *invest=[[NSDictionary alloc]init];//投资理财
    invest=[jsonObjects objectAtIndex:2];
    if (indexPath.section==2)
    {
        if (indexPath.row==0)
        {
            cell.textLabel.text=[love objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"love.png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        else//投资理财
        {
            cell.textLabel.text=[invest objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"zhu.png"];
        cell.accessoryType=
            UITableViewCellAccessoryDisclosureIndicator;

        }
    }
//－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    NSDictionary *jieya=[[NSDictionary alloc]init];
    jieya=[jsonObjects objectAtIndex:3];//解压方式
    NSDictionary *kaiyun=[[NSDictionary alloc]init];
    kaiyun=[jsonObjects objectAtIndex:4];//开运小秘诀
    if (indexPath.section==3)
    {
        if (indexPath.row==0)
        {
            cell.textLabel.text=[jieya objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"jieya.png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        else
        {
            cell.textLabel.text=[kaiyun objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"lock.png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([jsonObjects count]==0) {//解决数据未加载问题
    UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"数据未加载成功!" delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
        [detail show];//整体运势的详细信息

        return;
    }
    else
    {
    if (indexPath.section==0)
    {
        return;
    }
    
    if (indexPath.section==1)
    {
        NSDictionary *zhengti1=[[NSDictionary alloc]init];
        zhengti1=[jsonObjects objectAtIndex:0];
        
        NSString *s=[[NSString alloc]initWithString:[zhengti1 objectForKey:@"value"]];
        
        UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
        [detail show];//整体运势的详细信息
    }
    //--------------------------------------------------------
      else if (indexPath.section==2)
      {
          NSDictionary *love=[[NSDictionary alloc]init];//爱情运势
          love=[jsonObjects objectAtIndex:1];
          NSDictionary *invest=[[NSDictionary alloc]init];//投资理财
          invest=[jsonObjects objectAtIndex:2];
          if (indexPath.row==0)
          {
              NSString *s=[[NSString alloc]initWithString:[love objectForKey:@"value"]];
            UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
              [detail show];
          }
          else
          {
              NSString *s=[[NSString alloc]initWithString:[invest objectForKey:@"value"]];
              UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
              [detail show];

         }

      }//爱情运势  投资理财
    //--------------------------------------------------------
    else
    {
        NSDictionary *jieya=[[NSDictionary alloc]init];
        jieya=[jsonObjects objectAtIndex:3];//解压方式
        NSDictionary *kaiyun=[[NSDictionary alloc]init];
        kaiyun=[jsonObjects objectAtIndex:4];//开运小秘诀

        if (indexPath.row==0)
        {
            NSString *s=[[NSString alloc]initWithString:[jieya objectForKey:@"value"]];
            UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
            [detail show];
            
        }
        else
        {
            NSString *s=[[NSString alloc]initWithString:[kaiyun objectForKey:@"value"]];
            UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
            [detail show];

        }
    }//解压方式  开运小秘诀
    }
}


@end
