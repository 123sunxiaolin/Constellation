//
//  YearViewController.m
//  Constellation
//
//  Created by 孙晓林 on 13-9-18.
//  Copyright (c) 2013年 孙晓林. All rights reserved.
//

#import "YearViewController.h"
#import "NianDuViewController.h"

@interface YearViewController ()

@end

@implementation YearViewController

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
    NianDuViewController *Nian=[[NianDuViewController alloc]init];
    Nian.title=@"星座运势";
    Nian.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=year&id=0&format=json";
    [self.navigationController pushViewController:Nian animated:YES];
    
}
//金牛座
- (IBAction)Taurus:(id)sender {
    NianDuViewController *Nian=[[NianDuViewController alloc]init];
    Nian.title=@"星座运势";
    Nian.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=year&id=1&format=json";
    [self.navigationController pushViewController:Nian animated:YES];

}
//双子座
- (IBAction)Gemini:(id)sender {
    NianDuViewController *Nian=[[NianDuViewController alloc]init];
    Nian.title=@"星座运势";
    Nian.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=year&id=2&format=json";
    [self.navigationController pushViewController:Nian animated:YES];

}
//巨蟹座
- (IBAction)Cancer:(id)sender {
    NianDuViewController *Nian=[[NianDuViewController alloc]init];
    Nian.title=@"星座运势";
    Nian.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=year&id=3&format=json";
    [self.navigationController pushViewController:Nian animated:YES];

}
//狮子座
- (IBAction)Leo:(id)sender {
    NianDuViewController *Nian=[[NianDuViewController alloc]init];
    Nian.title=@"星座运势";
    Nian.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=year&id=4&format=json";
    [self.navigationController pushViewController:Nian animated:YES];

}
//处女座
- (IBAction)Virgo:(id)sender {
    NianDuViewController *Nian=[[NianDuViewController alloc]init];
    Nian.title=@"星座运势";
    Nian.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=year&id=5&format=json";
    [self.navigationController pushViewController:Nian animated:YES];

}
//天秤座
- (IBAction)Libra:(id)sender {
    NianDuViewController *Nian=[[NianDuViewController alloc]init];
    Nian.title=@"星座运势";
    Nian.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=year&id=6&format=json";
    [self.navigationController pushViewController:Nian animated:YES];

}
//天蝎座
- (IBAction)Scorpio:(id)sender {
    NianDuViewController *Nian=[[NianDuViewController alloc]init];
    Nian.title=@"星座运势";
    Nian.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=year&id=7&format=json";
    [self.navigationController pushViewController:Nian animated:YES];

}
//射手座
- (IBAction)Sagittarius:(id)sender {
    NianDuViewController *Nian=[[NianDuViewController alloc]init];
    Nian.title=@"星座运势";
    Nian.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=year&id=8&format=json";
    [self.navigationController pushViewController:Nian animated:YES];

}
//摩羯座
- (IBAction)Capricorn:(id)sender {
    NianDuViewController *Nian=[[NianDuViewController alloc]init];
    Nian.title=@"星座运势";
    Nian.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=year&id=9&format=json";
    [self.navigationController pushViewController:Nian animated:YES];

}
//水瓶座
- (IBAction)Aquarius:(id)sender {
    NianDuViewController *Nian=[[NianDuViewController alloc]init];
    Nian.title=@"星座运势";
    Nian.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=year&id=10&format=json";
    [self.navigationController pushViewController:Nian animated:YES];

}
//双鱼座
- (IBAction)Psces:(id)sender {
    NianDuViewController *Nian=[[NianDuViewController alloc]init];
    Nian.title=@"星座运势";
    Nian.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=year&id=11&format=json";
    [self.navigationController pushViewController:Nian animated:YES];

}
@end
