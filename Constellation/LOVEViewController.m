//
//  LOVEViewController.m
//  Constellation
//
//  Created by 孙晓林 on 13-9-18.
//  Copyright (c) 2013年 孙晓林. All rights reserved.
//

#import "LOVEViewController.h"
#import "LoveConditionViewController.h"

@interface LOVEViewController ()

@end

@implementation LOVEViewController

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
    LoveConditionViewController *love=[[LoveConditionViewController alloc]init];
    love.title=@"星座运势";
    love.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=love&id=0&format=json";
    [self.navigationController pushViewController:love animated:YES];

}
//金牛座
- (IBAction)Taurus:(id)sender {
    LoveConditionViewController *love=[[LoveConditionViewController alloc]init];
    love.title=@"星座运势";
    love.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=love&id=1&format=json";
    [self.navigationController pushViewController:love animated:YES];
}
//双子座
- (IBAction)Gemini:(id)sender {
    LoveConditionViewController *love=[[LoveConditionViewController alloc]init];
    love.title=@"星座运势";
    love.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=love&id=2&format=json";
    [self.navigationController pushViewController:love animated:YES];
}
//巨蟹座
- (IBAction)Cancer:(id)sender {
    LoveConditionViewController *love=[[LoveConditionViewController alloc]init];
    love.title=@"星座运势";
    love.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=love&id=3&format=json";
    [self.navigationController pushViewController:love animated:YES];
}
//狮子座
- (IBAction)Leo:(id)sender {
    LoveConditionViewController *love=[[LoveConditionViewController alloc]init];
    love.title=@"星座运势";
    love.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=love&id=4&format=json";
    [self.navigationController pushViewController:love animated:YES];
}
//处女座
- (IBAction)Virgo:(id)sender {
    LoveConditionViewController *love=[[LoveConditionViewController alloc]init];
    love.title=@"星座运势";
    love.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=love&id=5&format=json";
    [self.navigationController pushViewController:love animated:YES];
}
//天秤座
- (IBAction)Libra:(id)sender {
    LoveConditionViewController *love=[[LoveConditionViewController alloc]init];
    love.title=@"星座运势";
    love.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=love&id=6&format=json";
    [self.navigationController pushViewController:love animated:YES];
}
//天蝎座
- (IBAction)Scorpio:(id)sender {
    LoveConditionViewController *love=[[LoveConditionViewController alloc]init];
    love.title=@"星座运势";
    love.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=love&id=7&format=json";
    [self.navigationController pushViewController:love animated:YES];
}
//射手座
- (IBAction)Sagittarius:(id)sender {
    LoveConditionViewController *love=[[LoveConditionViewController alloc]init];
    love.title=@"星座运势";
    love.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=love&id=8&format=json";
    [self.navigationController pushViewController:love animated:YES];
}
//摩羯座
- (IBAction)Capricorn:(id)sender {
    LoveConditionViewController *love=[[LoveConditionViewController alloc]init];
    love.title=@"星座运势";
    love.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=love&id=9&format=json";
    [self.navigationController pushViewController:love animated:YES];
}
//水瓶座
- (IBAction)Aquarius:(id)sender {
    LoveConditionViewController *love=[[LoveConditionViewController alloc]init];
    love.title=@"星座运势";
    love.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=love&id=10&format=json";
    [self.navigationController pushViewController:love animated:YES];
}
//双鱼座
- (IBAction)Pisces:(id)sender {
    LoveConditionViewController *love=[[LoveConditionViewController alloc]init];
    love.title=@"星座运势";
    love.URL=@"http://api.uihoo.com/astro/astro.http.php?fun=love&id=11&format=json";
    [self.navigationController pushViewController:love animated:YES];
}
@end
