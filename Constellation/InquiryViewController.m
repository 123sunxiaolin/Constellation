//
//  InquiryViewController.m
//  Constellation
//
//  Created by 孙晓林 on 13-9-19.
//  Copyright (c) 2013年 孙晓林. All rights reserved.
//

#import "InquiryViewController.h"
#import "AriesViewController.h"

@interface InquiryViewController ()

@end

@implementation InquiryViewController
@synthesize monthArray,dayArray,showLabel,Picture,datePick,showDate,showMonth,today,tomorrow;

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
    dayArray=[[NSArray alloc]initWithObjects:@"1日",@"2日",@"3日",@"4日",@"5日",@"6日",@"7日",@"8日",@"9日",@"10日",@"11日",@"12日",@"13日",@"14日",@"15日",@"16日",@"17日",@"18日",@"19日",@"20日",@"21日",@"21日",@"22日",@"23日",@"24日",@"25日",@"26日",@"27日",@"28日",@"29日",@"30日",@"31日",nil];//日期
    monthArray=[[NSArray alloc]initWithObjects:@"1月",@"2月",@"3月",@"4月",@"5月",@"6月",@"7月",@"8月",@"9月",@"10月",@"11月",@"12月",nil];//月份
    datePick=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];//设定选择视图
    datePick.showsSelectionIndicator=YES;
    datePick.dataSource=self;
    datePick.delegate=self;
    datePick.backgroundColor=[UIColor redColor];
    datePick.autoresizingMask=UIViewAutoresizingFlexibleWidth;//设置后可以自定义高度
    [self.view addSubview:datePick];
    //添加按钮的方法
    [today addTarget:self action:@selector(Today:) forControlEvents:UIControlEventTouchUpInside];
    [tomorrow addTarget:self action:@selector(Tomorrow:) forControlEvents:UIControlEventTouchUpInside];

    [super viewDidLoad];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}//返回组件数

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component==0) {
        return [monthArray count];
    }
    else
    {
        return [dayArray count];
    }
   }//返回组件的行数

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component==0) {
        return [monthArray objectAtIndex:row];
    }
    else
    {
        return [dayArray objectAtIndex:row];
    }
}//提供制定行制定列的内容

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component//设置每一个组件的宽度

{
    
    CGFloat componentWidth = 0.0;
    
    
    if (component == 0)
        
        componentWidth = 200.0; // 第一个组键的宽度
    
    else
        
        componentWidth = 120.0; // 第2个组键的宽度
    
    
    return componentWidth;
    
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component//设置高度
{
    if (component==0) {
        return 80.0;
    }
    else
    {
        return 50.0;
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //呈现月日
    if (component==0) {
        showMonth.text=[monthArray objectAtIndex:row];
       // NSLog(@"%d",[showMonth.text length]);
        
    }
     else
     {
          showDate.text=[dayArray objectAtIndex:row];
         // NSLog(@"%d",[showDate.text length]);
     }//显示日期

    UIAlertView *warning=[[UIAlertView alloc]init];//显示警告日期格式
    int month=[showMonth.text intValue];//转换成整型
    int day=[showDate.text intValue];//转换成整型
    
//————————————————————————————————————————————————》判断日期是否符合格式
    if (month<1||month>12||day<1||day>31){
        warning=[[UIAlertView alloc]initWithTitle:@"错误日期格式！" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [warning show];
        return;
           }
     else if(month==2 && day>29)
    {
        warning=[[UIAlertView alloc]initWithTitle:@"错误日期格式！" message:nil delegate:self cancelButtonTitle:@"OK"otherButtonTitles:nil, nil];
               [warning show];
        return;
    }else if(month==4 || month==6 || month==9 || month==11) {
        if (day>30)
        {
            warning=[[UIAlertView alloc]initWithTitle:@"错误日期格式！" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [warning show];
            return;
        }
        
    }
    else
    {
        
    }
 //——————————————————————————————————————————————————————————————》
      //根据日期判断星座
       if ((month==3&&day>=21)||(month==4&&day<=19))
    {
        showLabel.text=@"白羊座";
        Picture.image=[UIImage imageNamed:@"aries1.png"];
     }
    else if ((month==4&&day>=20)||(month==5&&day<=20))
    {
        showLabel.text=@"金牛座";
        Picture.image=[UIImage imageNamed:@"taurus.png"];
    }else if ((month==5&&day>=21)||(month==6&&day<=21))
    {
        showLabel.text=@"双子座";
        Picture.image=[UIImage imageNamed:@"gemini.png"];
    }else if ((month==6&&day>=22)||(month==7&&day<=22))
    {
        showLabel.text=@"巨蟹座";
        Picture.image=[UIImage imageNamed:@"cancer.png"];
    }else if ((month==7&&day>=23)||(month==8&&day<=22))
    {
        showLabel.text=@"狮子座";
        Picture.image=[UIImage imageNamed:@"leo.png"];
    }else if ((month==8&&day>=23)||(month==9&&day<=22))
    {
        showLabel.text=@"处女座";
        Picture.image=[UIImage imageNamed:@"virgo.png"];
    }else if ((month==9&&day>=23)||(month==10&&day<=23))
    {
        showLabel.text=@"天秤座";
        Picture.image=[UIImage imageNamed:@"libra.png"];
    }else if ((month==10&&day>=24)||(month==11&&day<=22))
    {
        showLabel.text=@"天蝎座";
        Picture.image=[UIImage imageNamed:@"scorpio.png"];
    }else if ((month==11&&day>=23)||(month==12&&day<=21))
    {
        showLabel.text=@"射手座";
        Picture.image=[UIImage imageNamed:@"sagittarius.png"];

    }else if ((month==12&&day>=22)||(month==1&&day<=19))
    {
        showLabel.text=@"摩羯座";
        Picture.image=[UIImage imageNamed:@"capricorn.png"];
 
    }else if ((month==1&&day>=20)||(month==2&&day<=18))
    {
        showLabel.text=@"水瓶座";
        Picture.image=[UIImage imageNamed:@"aquarius.png"];
  
    }else if ((month==2&&day>=19)||(month==3&&day<=20))
    {
        showLabel.text=@"双鱼座";
        Picture.image=[UIImage imageNamed:@"pisces.png"];
     }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)Today:(id)sender {//切换到今日星座运势
    
    AriesViewController *Aries=[[AriesViewController alloc]init];
    Aries.title=@"星座运势";
    
    if ([showLabel.text isEqualToString:@"白羊座"]) {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=day&id=0&format=xml";
    }else if ([showLabel.text isEqualToString:@"金牛座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=day&id=1&format=xml";
    }else if ([showLabel.text isEqualToString:@"双子座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=day&id=2&format=xml";
    }else if ([showLabel.text isEqualToString:@"巨蟹座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=day&id=3&format=xml";
    }else if ([showLabel.text isEqualToString:@"狮子座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=day&id=4&format=xml";
    }else if ([showLabel.text isEqualToString:@"处女座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=day&id=5&format=xml";
    }else if ([showLabel.text isEqualToString:@"天秤座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=day&id=6&format=xml";
    }else if ([showLabel.text isEqualToString:@"天蝎座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=day&id=7&format=xml";
    }else if ([showLabel.text isEqualToString:@"射手座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=day&id=8&format=xml";
    }else if ([showLabel.text isEqualToString:@"摩羯座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=day&id=9&format=xml";
    }else if ([showLabel.text isEqualToString:@"水瓶座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=day&id=10&format=xml";
    }else if ([showLabel.text isEqualToString:@"双鱼座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=day&id=11&format=xml";
    }
     
    
[self.navigationController pushViewController:Aries animated:YES];
}
    

- (void)Tomorrow:(id)sender {//切换到明日星座运势
    AriesViewController *Aries=[[AriesViewController alloc]init];
    Aries.title=@"星座运势";
    if ([showLabel.text isEqualToString:@"白羊座"]) {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=0&format=xml";
    }else if ([showLabel.text isEqualToString:@"金牛座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=1&format=xml";
    }else if ([showLabel.text isEqualToString:@"双子座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=2&format=xml";
    }else if ([showLabel.text isEqualToString:@"巨蟹座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=3&format=xml";
    }else if ([showLabel.text isEqualToString:@"狮子座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=4&format=xml";
    }else if ([showLabel.text isEqualToString:@"处女座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=5&format=xml";
    }else if ([showLabel.text isEqualToString:@"天秤座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=6&format=xml";
    }else if ([showLabel.text isEqualToString:@"天蝎座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=7&format=xml";
    }else if ([showLabel.text isEqualToString:@"射手座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=8&format=xml";
    }else if ([showLabel.text isEqualToString:@"摩羯座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=9&format=xml";
    }else if ([showLabel.text isEqualToString:@"水瓶座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=10&format=xml";
    }else if ([showLabel.text isEqualToString:@"双鱼座"])
    {
        Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=11&format=xml";
    }
    [self.navigationController pushViewController:Aries animated:YES];
}
@end
