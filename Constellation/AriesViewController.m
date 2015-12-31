//
//  AriesViewController.m
//  Constellation
//
//  Created by 孙晓林 on 13-9-10.
//  Copyright (c) 2013年 孙晓林. All rights reserved.
//

#import "AriesViewController.h"
#import "ASIHTTPRequest.h"

@interface AriesViewController ()
{
    float width;
    float height;
}

@end

@implementation AriesViewController
@synthesize Date,label1,label2,label3,label4,label5,label6,label7,label8,label9,label10,word5,word6,word7,word8,word9,URL,name,rool,s1,s2,s3,s4,activity,currentElement,dataDic,tempString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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
     NSXMLParser *m_parser = [[NSXMLParser alloc] initWithData:responseData];
    [m_parser setDelegate:self];  //设置代理为本地
    BOOL flag = [m_parser parse]; //开始解析
    if(flag) {
        NSLog(@"ok");
    }else{
        NSLog(@"获取指定路径的xml文件失败");
    }
   [self.view reloadInputViews];
    [activity stopAnimating];//控制任务指示器的停止
    
}

- (void)viewDidLoad
{
    //NSLog(@"%@",URL);
    
    //添加任务指示视图
    activity=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activity.activityIndicatorViewStyle=UIActivityIndicatorViewStyleWhiteLarge;
    activity.center=CGPointMake(160, 200);
    activity.color=[UIColor whiteColor];
    [self.rool addSubview:activity];
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
    // Do any additional setup after loading the view from its nib.
    
}

-(void)parserDidStartDocument:(NSXMLParser *)parser//解析开始
{
    parserObjects=[[NSMutableArray alloc]init];//每一组信息用数组存放，所有的信息都在这个数组中
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"item"])
    {
        dataDic=[[NSMutableDictionary alloc]initWithCapacity:0];//每一条信息用字典存放
        NSLog(@"%@",dataDic);
    }
    if ([elementName isEqualToString:@"title"])
    {
        self.currentElement=elementName;
        self.tempString=[NSMutableString string];
    }
    else if ([elementName isEqualToString:@"rank"])
    {
        self.currentElement=elementName;
        self.tempString=[NSMutableString string];
    }
    else if ([elementName isEqualToString:@"value"])
    {
        self.currentElement=elementName;
        self.tempString=[NSMutableString string];
    }
    else if ([elementName isEqualToString:@"en"])
    {
        self.currentElement=elementName;
        self.tempString=[NSMutableString string];
    }
    else if ([elementName isEqualToString:@"cn"])
    {
        self.currentElement=elementName;
        self.tempString=[NSMutableString string];
    }
    else
    {
        self.currentElement=@"date";
        self.tempString=[NSMutableString string];
    }

}




-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
 {//填充string
     if (currentElement)
     {
         [self.tempString appendString:string];
         [dataDic setObject:string forKey:currentElement];
         
     }
        
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{     //填充Dic
    if (currentElement)
    {
        [dataDic setObject:self.tempString forKey:currentElement];
        self.currentElement=nil;
        self.tempString=nil;
    }
    //结束结点
    if([elementName isEqualToString:@"item"])
 {
    if([dataDic count]>0)
    {
        [parserObjects addObject:dataDic];//添加数据
    }
 }
   
}

-(void)parserDidEndDocument:(NSXMLParser *)parser
{   //加载wuxing
    UIImage *starImage=[UIImage imageNamed:@"star.png"];
    width=starImage.size.width;//视图的宽度
    height=starImage.size.height;//视图的高度
    NSLog(@"parserObjects=%@",parserObjects);
  for(NSDictionary *dic in parserObjects)//遍历解析的数组
   {
       if ((dic==[parserObjects objectAtIndex:0]))//综合运势
       {
           label1.text=[dic objectForKey:@"title"];
           NSString *str=[NSString stringWithString:[dic objectForKey:@"rank"]];
           int num=[str intValue];
           for (int i=0; i<num;i++ )//显示星星的等级
           {
               UIImageView *star=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"star.png"]];
               [star setFrame:CGRectMake(163+i*width, 100, width, height)];
               [self.rool addSubview:star];
           }

           }
        else if (dic==[parserObjects objectAtIndex:1])//爱情运势
   {
    label2.text=[dic objectForKey:@"title"];
    NSString *str=[NSString stringWithString:[dic objectForKey:@"rank"]];
    int num=[str intValue];
    for (int i=0; i<num;i++ )//显示星星的等级
    {
        UIImageView *star=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"star.png"]];
        [star setFrame:CGRectMake(163+i*width, 140, width, height)];
        [self.rool addSubview:star];
    }

    
}
       else if (dic==[parserObjects objectAtIndex:2])//理财投资
       {
           label3.text=[dic objectForKey:@"title"];
           NSString *str=[NSString stringWithString:[dic objectForKey:@"rank"]];
           int num=[str intValue];
           for (int i=0; i<num;i++ )//显示星星的等级
           {
               UIImageView *star=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"star.png"]];
               [star setFrame:CGRectMake(163+i*width, 180, width, height)];
               [self.rool addSubview:star];
           }

       }
       else if (dic==[parserObjects objectAtIndex:3])//工作状况
       {
           label4.text=[dic objectForKey:@"title"];
           NSString *str=[NSString stringWithString:[dic objectForKey:@"rank"]];
           int num=[str intValue];
           for (int i=0; i<num;i++ )//显示星星的等级
           {
               UIImageView *star=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"star.png"]];
               [star setFrame:CGRectMake(163+i*width, 220, width, height)];
               [self.rool addSubview:star];
           }

       }
       else if (dic==[parserObjects objectAtIndex:4])//健康指数
       {
           label5.text=[dic objectForKey:@"title"];
           word5.text=[dic objectForKey:@"value"];
       }
       else if (dic==[parserObjects objectAtIndex:5])//商谈指数
       {
           label6.text=[dic objectForKey:@"title"];
           word6.text=[dic objectForKey:@"value"];
       }
       else if (dic==[parserObjects objectAtIndex:6])//幸运颜色
       {
           label7.text=[dic objectForKey:@"title"];
           word7.text=[dic objectForKey:@"value"];
       }
       else if (dic==[parserObjects objectAtIndex:7])//幸运数字
       {
           label8.text=[dic objectForKey:@"title"];
           word8.text=[dic objectForKey:@"value"];
       }
       else if (dic==[parserObjects objectAtIndex:8])//速配星座
       {
           label9.text=[dic objectForKey:@"title"];
           word9.text=[dic objectForKey:@"value"];
       }
       else if (dic==[parserObjects objectAtIndex:9])//综合概述
       {
           label10.text=[dic objectForKey:@"title"];
           UILabel *word10=[[UILabel alloc]initWithFrame:CGRectMake(100, 450, 107, 80)];//初始化
           word10.text=[dic objectForKey:@"value"];
           word10.backgroundColor=[UIColor clearColor];
           word10.numberOfLines=0;
           UIFont *font=[UIFont systemFontOfSize:18];
           CGSize size=CGSizeMake(260,400 );
           //设定自定义长度的label
           CGSize labelSize=[word10.text sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
           [word10 setFrame:CGRectMake(47, 490, labelSize.width, labelSize.height)];
          
           self.rool.contentSize = CGSizeMake( 320,self.rool.contentSize.height+labelSize.height);
           
           [self.rool addSubview:word10];

                 }
       else if (dic==[parserObjects objectAtIndex:10])
       {
                      name.text=[dic objectForKey:@"cn"];
       }
       else if (dic==[parserObjects objectAtIndex:11])
       {
           Date.text = [dic valueForKey:@"date"];
       }
       
   }
    
}

- (void)viewDidAppear:(BOOL)animated//更新界面
{
    [super viewDidAppear:animated];
   self.rool.contentSize=CGSizeMake(320.0,800.0);
}//显示区域的扩展



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
