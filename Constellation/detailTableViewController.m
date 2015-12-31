//
//  detailTableViewController.m
//  Constellation
//
//  Created by 孙晓林 on 13-9-15.
//  Copyright (c) 2013年 孙晓林. All rights reserved.
//

#import "detailTableViewController.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"

@interface detailTableViewController ()


@end

@implementation detailTableViewController
@synthesize URL;
@synthesize activity;

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
    activity.center=CGPointMake(150, 240);
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
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 3;
            case 1:
            return 1;
            case 2:
            return 3;
            case 3:
            return 3;
        default:return 3;
            
    }
  }
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
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
//————————————————————————————————————————————————————————————————》
    //在单元格上实现标题的显示
    NSDictionary *titledic=[[NSDictionary alloc]init];
    titledic = [jsonObjects objectAtIndex:[jsonObjects count]-2];
    if (indexPath.section==0)
    {
        if (indexPath.row==0)
        {    //星座名称
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
//－－－－－－－－－－－－－－－－------------------------------>
    NSDictionary *zhengti=[[NSDictionary alloc]init];
    zhengti=[jsonObjects objectAtIndex:0];
    if (indexPath.section==1)
    {
        cell.textLabel.text=[zhengti objectForKey:@"title"];
        cell.imageView.image=[UIImage imageNamed:@"zheengti.png"];
        cell.detailTextLabel.text=@"详细信息";
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }//第二模块  整体运势
    //----------------------------------－－－－－－－－－－－－－－
    NSDictionary *love=[[NSDictionary alloc]init];
    love=[jsonObjects objectAtIndex:1];
    NSArray *title2=[[NSArray alloc]init];
    title2=[love objectForKey:@"title2"];
    if (indexPath.section==2)
    {
        if (indexPath.row==0)
        {
            cell.textLabel.text=[love objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"love.png"];
            cell.accessoryType=UITableViewCellAccessoryNone;
        }
        else if (indexPath.row==1)
        {
            cell.textLabel.text=[title2 objectAtIndex:0];
            cell.imageView.image=[UIImage imageNamed:@"2.png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        else
        {
            cell.textLabel.text=[title2 objectAtIndex:1];
            cell.imageView.image=[UIImage imageNamed:@"1.png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
    }//爱情运势
 //----------------------------------------------------->>>>>>
    NSDictionary *health=[[NSDictionary alloc]init];
    health=[jsonObjects objectAtIndex:2];//健康运势
    NSDictionary *study=[[NSDictionary alloc]init];
    study=[jsonObjects objectAtIndex:3];//工作学习运势
    NSDictionary *sex=[[NSDictionary alloc]init];
    sex=[jsonObjects objectAtIndex:4];//性欲指数
    if (indexPath.section==3)
    {
        if(indexPath.row==0)
        {
            cell.textLabel.text=[health objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"Shao.png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        else if(indexPath.row==1)
        {
            cell.textLabel.text=[study objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"bao .png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        else
        {
            cell.textLabel.text=[sex objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"star.png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
    }
  //----------------------------------------------------->>>>>>>>>>>>>
    NSDictionary *red=[[NSDictionary alloc]init];
    red=[jsonObjects objectAtIndex:5];//红心日
    NSDictionary *black=[[NSDictionary alloc]init];
    black=[jsonObjects objectAtIndex:6];//黑梅日
    NSDictionary *tips=[[NSDictionary alloc]init];
    tips=[jsonObjects objectAtIndex:[jsonObjects count]-3];
    if (indexPath.section==4)
    {
        if (indexPath.row==0)
        {
            cell.textLabel.text=[red objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"red.png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        else if (indexPath.row==1)
        {
            cell.textLabel.text=[black objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"black.png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

        }
        else
        {
            cell.textLabel.text=[tips objectForKey:@"title"];
            cell.imageView.image=[UIImage imageNamed:@"tips.png"];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

        }
    }
    return cell;
    
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([jsonObjects count]==0) {//用于处理网络未连接的问题
    UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"数据未加载成功!" delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
        [detail show];//数据未加载
        return;
    }
    else 
    {
     if (indexPath.section==0)
     {
         return;
     }
    
       if (indexPath.section==1) {
        NSDictionary *zhengti1=[[NSDictionary alloc]init];
        zhengti1=[jsonObjects objectAtIndex:0];

           NSString *s=[[NSString alloc]initWithString:[zhengti1 objectForKey:@"value"]];

        UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
        [detail show];//整体运势的详细信息
    }
  //--------------------------------------------------------
           else if (indexPath.section==2) {
                  NSDictionary *love=[[NSDictionary alloc]init];
                  love=[jsonObjects objectAtIndex:1];
                  NSArray *haveornot=[[NSArray alloc]init];
                  haveornot=[love objectForKey:@"value2"];

            if (indexPath.row==1) {//有对象
                NSString *have=[[NSString alloc]init];
                have=[haveornot objectAtIndex:0];
                NSLog(@"%@",have);
                UIAlertView *detail1=[[UIAlertView alloc]initWithTitle:@"详细信息" message:have delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
                [detail1 show];
            }
            else if(indexPath.row==2)//没对象
            {
                NSString *not=[[NSString alloc]init];
                not=[haveornot objectAtIndex:1];
                NSLog(@"%@",not);
                UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:not delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
                [detail show];
            }
        }//爱情运势
 //----------------------------------------------->>>>>>>>>>>>>>>>>
    else if (indexPath.section==3)
    {
        NSDictionary *jiankang=[[NSDictionary alloc]init];
        jiankang=[jsonObjects objectAtIndex:2];//健康运势
        NSDictionary *work=[[NSDictionary alloc]init];
        work=[jsonObjects objectAtIndex:3];//工作学习运
        NSDictionary *sex=[[NSDictionary alloc]init];
        sex=[jsonObjects objectAtIndex:4];//性欲指数
        if (indexPath.row==0) {
            NSString *s=[[NSString alloc]initWithString:[jiankang objectForKey:@"value"]];
            UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
            [detail show];

            }
        else if (indexPath.row==1)
        {
            NSString *s=[[NSString alloc]initWithString:[work objectForKey:@"value"]];
            UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
            [detail show];

        }
        else
        {
            NSString *s=[[NSString alloc]initWithString:[sex objectForKey:@"value"]];
            UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
            [detail show];

        }
        
    }
    //--------------------------------------------->>>>>>>>
    else
    {
        NSDictionary *red=[[NSDictionary alloc]init];
        red=[jsonObjects objectAtIndex:5];//红心日
        NSDictionary *black=[[NSDictionary alloc]init];
        black=[jsonObjects objectAtIndex:6];//黑梅日
        NSDictionary *tips=[[NSDictionary alloc]init];
        tips=[jsonObjects objectAtIndex:[jsonObjects count]-3];//小提示
        if (indexPath.row==0)
        {
            NSString *s=[[NSString alloc]initWithString:[red objectForKey:@"value"]];
            UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
            [detail show];
            }
        else if (indexPath.row==1)
        {
            NSString *s=[[NSString alloc]initWithString:[black objectForKey:@"value"]];
            UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
            [detail show];
        }
        else
        {
            NSString *s=[[NSString alloc]initWithString:[tips objectForKey:@"value"]];
            UIAlertView *detail=[[UIAlertView alloc]initWithTitle:@"详细信息" message:s delegate:self cancelButtonTitle:@"我知道咯！" otherButtonTitles:nil, nil];
            [detail show];

        }

        }
    }
}

@end
