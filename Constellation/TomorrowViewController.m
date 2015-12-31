//
//  TomorrowViewController.m
//  Constellation
//
//  Created by 孙晓林 on 13-9-14.
//  Copyright (c) 2013年 孙晓林. All rights reserved.
//

#import "TomorrowViewController.h"
#import "AriesViewController.h"

@interface TomorrowViewController ()

@end

@implementation TomorrowViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//白羊座
- (IBAction)Aries:(id)sender {
    AriesViewController *Aries=[[AriesViewController alloc]init];
    Aries.title=@"星座运势";
    Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=0&format=xml";
    [self.navigationController pushViewController:Aries animated:YES];

}
//金牛座
- (IBAction)Taurus:(id)sender {
    AriesViewController *Aries=[[AriesViewController alloc]init];
    Aries.title=@"星座运势";
    Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=1&format=xml";
    [self.navigationController pushViewController:Aries animated:YES];
}
//双子座
- (IBAction)Gemini:(id)sender {
    AriesViewController *Aries=[[AriesViewController alloc]init];
    Aries.title=@"星座运势";
    Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=2&format=xml";
    [self.navigationController pushViewController:Aries animated:YES];
}
//巨蟹座
- (IBAction)Cancer:(id)sender {
    AriesViewController *Aries=[[AriesViewController alloc]init];
    Aries.title=@"星座运势";
    Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=3&format=xml";
    [self.navigationController pushViewController:Aries animated:YES];
}
//狮子座
- (IBAction)Leo:(id)sender {
    AriesViewController *Aries=[[AriesViewController alloc]init];
    Aries.title=@"星座运势";
    Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=4&format=xml";
    [self.navigationController pushViewController:Aries animated:YES];
}
//处女座
- (IBAction)Virgo:(id)sender {
    AriesViewController *Aries=[[AriesViewController alloc]init];
    Aries.title=@"星座运势";
    Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=5&format=xml";
    [self.navigationController pushViewController:Aries animated:YES];
}
//天秤座
- (IBAction)Libra:(id)sender {
    AriesViewController *Aries=[[AriesViewController alloc]init];
    Aries.title=@"星座运势";
    Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=6&format=xml";
    [self.navigationController pushViewController:Aries animated:YES];
}
//天蝎座
- (IBAction)Scorpio:(id)sender {
    AriesViewController *Aries=[[AriesViewController alloc]init];
    Aries.title=@"星座运势";
    Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=7&format=xml";
    [self.navigationController pushViewController:Aries animated:YES];
}
//射手座
- (IBAction)Sagittarius:(id)sender {
    AriesViewController *Aries=[[AriesViewController alloc]init];
    Aries.title=@"星座运势";
    Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=8&format=xml";
    [self.navigationController pushViewController:Aries animated:YES];
}
//摩羯座座
- (IBAction)Capricorn:(id)sender {
    AriesViewController *Aries=[[AriesViewController alloc]init];
    Aries.title=@"星座运势";
    Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=9&format=xml";
    [self.navigationController pushViewController:Aries animated:YES];
}
//水瓶座
- (IBAction)Aquarius:(id)sender {
    AriesViewController *Aries=[[AriesViewController alloc]init];
    Aries.title=@"星座运势";
    Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=10&format=xml";
    [self.navigationController pushViewController:Aries animated:YES];
}
//双鱼座
- (IBAction)Pisces:(id)sender {
    AriesViewController *Aries=[[AriesViewController alloc]init];
    Aries.title=@"星座运势";
    Aries.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=tomorrow&id=11&format=xml";
    [self.navigationController pushViewController:Aries animated:YES];
}
@end
