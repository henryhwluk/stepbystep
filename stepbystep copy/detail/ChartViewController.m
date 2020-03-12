//
//  ChartViewController.m
//  stepbystep
//
//  Created by henvy on 2020/3/11.
//  Copyright © 2020 henvy. All rights reserved.
//

#import "ChartViewController.h"
#import "stepbystep-Bridging-Header.h"

@interface ChartViewController ()

@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    BarChartView *chatView = [[BarChartView alloc] initWithFrame:CGRectMake(0, 40, 300, 300)];
    chatView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:chatView];
   
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
