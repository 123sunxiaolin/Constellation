//
//  WeekViewController.m
//  Constellation
//
//  Created by 孙晓林 on 13-9-15.
//  Copyright (c) 2013年 孙晓林. All rights reserved.
//

#import "WeekViewController.h"
#import "detailTableViewController.h"

@interface WeekViewController ()

@end

@implementation WeekViewController

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
    detailTableViewController *detail=[[detailTableViewController alloc]init];
    detail.title=@"星座运势";
    detail.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=week&id=0&format=json";
    [self.navigationController pushViewController:detail animated:YES];
}
//金牛座
- (IBAction)Taurus:(id)sender {
    detailTableViewController *detail=[[detailTableViewController alloc]init];
    detail.title=@"星座运势";
    detail.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=week&id=1&format=json";
    [self.navigationController pushViewController:detail animated:YES];
}
//双子座
- (IBAction)Gemini:(id)sender {
    detailTableViewController *detail=[[detailTableViewController alloc]init];
    detail.title=@"星座运势";
    detail.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=week&id=2&format=json";
    [self.navigationController pushViewController:detail animated:YES];
}
//巨蟹座
- (IBAction)Cancer:(id)sender {
    detailTableViewController *detail=[[detailTableViewController alloc]init];
    detail.title=@"星座运势";
    detail.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=week&id=3&format=json";
    [self.navigationController pushViewController:detail animated:YES];
}
//狮子座
- (IBAction)Leo:(id)sender {
    detailTableViewController *detail=[[detailTableViewController alloc]init];
    detail.title=@"星座运势";
    detail.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=week&id=4&format=json";
    [self.navigationController pushViewController:detail animated:YES];
}
//处女座
- (IBAction)Virgo:(id)sender {
    detailTableViewController *detail=[[detailTableViewController alloc]init];
    detail.title=@"星座运势";
    detail.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=week&id=5&format=json";
    [self.navigationController pushViewController:detail animated:YES];
}
//天秤座
- (IBAction)Libra:(id)sender {
    detailTableViewController *detail=[[detailTableViewController alloc]init];
    detail.title=@"星座运势";
    detail.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=week&id=6&format=json";
    [self.navigationController pushViewController:detail animated:YES];
}
//天蝎座
- (IBAction)Scorpio:(id)sender {
    detailTableViewController *detail=[[detailTableViewController alloc]init];
    detail.title=@"星座运势";
    detail.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=week&id=7&format=json";
    [self.navigationController pushViewController:detail animated:YES];
}
//射手座
- (IBAction)Sagitarius:(id)sender {
    detailTableViewController *detail=[[detailTableViewController alloc]init];
    detail.title=@"星座运势";
    detail.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=week&id=8&format=json";
    [self.navigationController pushViewController:detail animated:YES];
}
//摩羯座
- (IBAction)Capricorn:(id)sender {
    detailTableViewController *detail=[[detailTableViewController alloc]init];
    detail.title=@"星座运势";
    detail.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=week&id=9&format=json";
    [self.navigationController pushViewController:detail animated:YES];
}
//水瓶座
- (IBAction)Aquarius:(id)sender {
    detailTableViewController *detail=[[detailTableViewController alloc]init];
    detail.title=@"星座运势";
    detail.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=week&id=10&format=json";
    [self.navigationController pushViewController:detail animated:YES];
}
//双鱼座
- (IBAction)Pisces:(id)sender {
    detailTableViewController *detail=[[detailTableViewController alloc]init];
    detail.title=@"星座运势";
    detail.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=week&id=11&format=json";
    [self.navigationController pushViewController:detail animated:YES];
}
@end
