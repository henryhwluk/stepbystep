//
//  ChartViewController.m
//  stepbystep
//
//  Created by henvy on 2020/3/11.
//  Copyright © 2020 henvy. All rights reserved.
//

#import "ChartViewController.h"
#import "stepbystep-Bridging-Header.h"

@interface ChartViewController ()  <ChartViewDelegate>
@property (nonatomic, strong) LineChartView *chartView;

@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"三月份每日公司爬九楼192阶楼梯时长统计图";

    _chartView = [[LineChartView alloc] initWithFrame:CGRectMake(50, 100, UIScreen.mainScreen.bounds.size.width - 70, UIScreen.mainScreen.bounds.size.height - 200)];
    _chartView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_chartView];
   
    _chartView.drawGridBackgroundEnabled      = NO;

    _chartView.delegate                       = self;
      
    _chartView.chartDescription.enabled       = NO;
      
    _chartView.leftAxis.enabled               = NO;
    _chartView.rightAxis.drawAxisLineEnabled  = NO;
    _chartView.rightAxis.drawGridLinesEnabled = NO;
    _chartView.xAxis.drawAxisLineEnabled      = NO;
    _chartView.xAxis.drawGridLinesEnabled     = NO;

    _chartView.drawGridBackgroundEnabled      = NO;
    _chartView.drawBordersEnabled             = NO;
    _chartView.dragEnabled                    = YES;
    [_chartView setScaleEnabled:YES];
    _chartView.pinchZoomEnabled               = NO;
      
    ChartLegend *l                            = _chartView.legend;
    l.horizontalAlignment                     = ChartLegendHorizontalAlignmentRight;
    l.verticalAlignment                       = ChartLegendVerticalAlignmentTop;
    l.orientation                             = ChartLegendOrientationVertical;
    l.drawInside                              = NO;
    
    //[self setDataCount:30 range:100];
    [self setupData];
    // Do any additional setup after loading the view.
}
- (void)setupData{
   
    NSArray *rowData = @[
                         @{
                             @"date": @"11",
                             @"time": @"02:18:67",
                             },
                         @{
                             @"date": @"12",
                             @"time": @"02:10:29",
                             },
                         @{
                             @"date": @"13",
                             @"time": @"02:08:67",
                             },
                         @{
                             @"date": @"14",
                             @"time": @"02:03:29",
                             },
                         @{
                            @"date": @"15",
                            @"time": @"02:10:67",
                            },
                         
                        @{
                            @"date": @"16",
                            @"time": @"02:05:29",
                            },
                        @{
                            @"date": @"17",
                            @"time": @"02:03:67",
                            },
                        @{
                            @"date": @"18",
                            @"time": @"02:10:29",
                            },
                         @{
                             @"date": @"19",
                             @"time": @"02:07:67",
                             },
                         @{
                             @"date": @"20",
                             @"time": @"02:05:29",
                             },
                         @{
                             @"date": @"21",
                             @"time": @"02:03:67",
                             },
                         @{
                             @"date": @"22",
                             @"time": @"02:03:29",
                             },
                         @{
                             @"date": @"23",
                             @"time": @"02:03:67",
                             },
                         @{
                             @"date": @"24",
                             @"time": @"02:10:29",
                             },
                          @{
                              @"date": @"25",
                              @"time": @"02:07:67",
                              },
                          @{
                              @"date": @"26",
                              @"time": @"02:05:29",
                              },
                          @{
                              @"date": @"27",
                              @"time": @"02:03:67",
                              },
                          @{
                              @"date": @"28",
                              @"time": @"02:03:29",
                              },
                         @{
                             @"date": @"29",
                             @"time": @"02:05:29",
                             },
                         @{
                             @"date": @"30",
                             @"time": @"02:03:67",
                             },
                         ];
   
    __block NSMutableArray *data = [NSMutableArray array];
    [rowData enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableDictionary *day = [[NSMutableDictionary alloc] initWithDictionary:(NSDictionary *)obj];
        NSString *rowTime = [NSString stringWithFormat:@"%@",[day objectForKey:@"time"]];
        NSArray *split = [rowTime componentsSeparatedByString: @":"];
        int min = [split[0] doubleValue] * 60;
        int sec = [split[1] doubleValue];
        double mil = [split[2] doubleValue] / 100;
        double all = min + sec + mil;
        [day setValue:[NSString stringWithFormat:@"%f",all] forKey:@"time"];
        [data addObject:day];

    }];
    NSLog(@"data:%@",data);

    [self setDataCount:data];
    
}
- (void)setDataCount:(NSArray *)data
{
    NSArray *colors = @[ChartColorTemplates.vordiplom[0], ChartColorTemplates.vordiplom[1], ChartColorTemplates.vordiplom[2]];
    
    NSMutableArray *dataSets = [[NSMutableArray alloc] init];
    
    for (int z = 0; z < 1; z++)
    {
        NSMutableArray *values = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < data.count; i++)
        {
            //double val = (double) (arc4random_uniform(range) + 3);
            NSDictionary *day = (NSDictionary *)data[i];
            int x = [[NSString stringWithFormat:@"%@",[day objectForKey:@"date"]] intValue];
            double y = [[NSString stringWithFormat:@"%@",[day objectForKey:@"time"]] doubleValue];
            [values addObject:[[ChartDataEntry alloc] initWithX:x y:y]];
        }
        
        LineChartDataSet *d = [[LineChartDataSet alloc] initWithEntries:values label:[NSString stringWithFormat:@"DataSet %d", z + 1]];
        d.lineWidth = 5.0;
        d.circleRadius = 4.0;
        d.circleHoleRadius = 2.0;
        
        UIColor *color = colors[z % colors.count];
        [d setColor:color];
        [d setCircleColor:color];
        [dataSets addObject:d];
    }
    
    ((LineChartDataSet *)dataSets[0]).lineDashLengths = @[@5.f, @5.f];
    ((LineChartDataSet *)dataSets[0]).colors = ChartColorTemplates.vordiplom;
    ((LineChartDataSet *)dataSets[0]).circleColors = ChartColorTemplates.vordiplom;
    
    LineChartData *linedata = [[LineChartData alloc] initWithDataSets:dataSets];
    [linedata setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:7.f]];
    _chartView.data = linedata;
    
    for (id<ILineChartDataSet> set in _chartView.data.dataSets) {
        set.drawFilledEnabled = !set.isDrawFilledEnabled;
    }
    [_chartView setNeedsDisplay];
    
    
}
#pragma mark - ChartViewDelegate

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected");
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView
{
    NSLog(@"chartValueNothingSelected");
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
