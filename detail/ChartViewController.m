//
//  ChartViewController.m
//  stepbystep
//
//  Created by henvy on 2020/3/11.
//  Copyright © 2020 henvy. All rights reserved.
//

#import "ChartViewController.h"
#import "stepbystep-Bridging-Header.h"
//#import "XAxisLogRenderer-Swift.h"
@interface ChartViewController ()  <ChartViewDelegate>
@property (nonatomic, strong) LineChartView *chartView;

@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"9楼192阶-每日跑楼梯时长统计图";

    _chartView = [[LineChartView alloc] initWithFrame:CGRectMake(50, 100, UIScreen.mainScreen.bounds.size.width - 70, UIScreen.mainScreen.bounds.size.height - 200)];
    _chartView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_chartView];
   
    _chartView.drawGridBackgroundEnabled      = NO;

    _chartView.delegate                       = self;
      
    _chartView.chartDescription.enabled       = YES;
    _chartView.legend.enabled                 = YES;
    _chartView.chartDescription.text          = @"henvy`s charts demo";

    _chartView.leftAxis.enabled               = NO;
    _chartView.rightAxis.drawAxisLineEnabled  = NO;
    _chartView.rightAxis.drawGridLinesEnabled = NO;
    _chartView.xAxis.drawAxisLineEnabled      = NO;
    _chartView.xAxis.drawGridLinesEnabled     = NO;

    _chartView.xAxis.granularityEnabled       = YES;
    _chartView.xAxis.granularity              = 1;
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
//
//    NSArray *rowData = @[
//                         @{
//                             @"date": @"11",
//                             @"time": @"02:18:67",
//                             },
//                         @{
//                             @"date": @"12",
//                             @"time": @"02:10:29",
//                             },
//                         @{
//                             @"date": @"13",
//                             @"time": @"02:14:62",
//                             },
//                         @{
//                             @"date": @"16",
//                             @"time": @"02:04:43",
//                             },
//                         @{
//                            @"date": @"17",
//                            @"time": @"01:51:27",
//                            },
//                         @{
//                             @"date": @"18",
//                             @"time": @"01:56:04",
//                             },
//                         @{
//                            @"date": @"19",
//                            @"time": @"02:02:21",
//                            },
//                         @{
//                            @"date": @"20",
//                            @"time": @"02:02:60",
//                            },
//                         @{
//                             @"date": @"23",
//                             @"time": @"02:02:95",
//                            },
//                         @{
//                            @"date": @"24",
//                            @"time": @"01:55:29",
//                           },
//                         @{
//                            @"date": @"25",
//                            @"time": @"01:49:31",
//                           },
//                         @{
//                            @"date": @"26",
//                            @"time": @"01:50:44",
//                           },
//                         @{
//                           @"date": @"27",
//                           @"time": @"01:39:66",
//                           },
//                         ];

   NSArray *rowData = @[
                        @{
                            @"date": @"1",
                            @"time": @"02:18:67",
                            },
                        @{
                            @"date": @"2",
                            @"time": @"02:10:29",
                            },
                        @{
                            @"date": @"3",
                            @"time": @"02:14:62",
                            },
                        @{
                            @"date": @"4",
                            @"time": @"02:04:43",
                            },
                        @{
                           @"date": @"5",
                           @"time": @"01:51:27",
                           },
                        @{
                            @"date": @"6",
                            @"time": @"01:56:04",
                            },
                        @{
                           @"date": @"7",
                           @"time": @"02:02:21",
                           },
                        @{
                           @"date": @"8",
                           @"time": @"02:02:60",
                           },
                        @{
                            @"date": @"9",
                            @"time": @"02:02:95",
                           },
                        @{
                           @"date": @"10",
                           @"time": @"01:55:29",
                          },
                        @{
                           @"date": @"11",
                           @"time": @"01:49:31",
                          },
                        @{
                           @"date": @"12",
                           @"time": @"01:50:44",
                          },
                        @{
                          @"date": @"13",
                          @"time": @"01:39:66",
                          },
                        @{
                          @"date": @"14",
                          @"time": @"01:38:61",
                         },
                          @{
                           @"date": @"15",
                           @"time": @"01:43:17",
                         },
                          @{
                           @"date": @"16",
                           @"time": @"01:40:38",
                         },
                        @{
                          @"date": @"17",
                          @"time": @"01:37:37",
                        },
                        @{
                          @"date": @"18",
                          @"time": @"01:43:38",
                        },
                        
                        @{
                          @"date": @"19",
                          @"time": @"01:33:66",
                        },
                        
                        @{
                          @"date": @"20",
                          @"time": @"01:55:01",
                        },
                        @{
                                                 @"date": @"21",
                                                 @"time": @"01:57:55",
                                               },
                        @{
                                                 @"date": @"22",
                                                 @"time": @"02:15:18",
                                               },
                        @{
                                                 @"date": @"23",
                                                 @"time": @"01:50:47",
                                               },
                        @{
                                                 @"date": @"24",
                                                 @"time": @"02:01:10",
                                               },
                        @{
                                                 @"date": @"25",
                                                 @"time": @"01:59:32",
                                               },
                        @{
                                                 @"date": @"26",
                                                 @"time": @"02:09:35",
                                               },
                        @{
                                                 @"date": @"27",
                                                 @"time": @"02:07:25",
                                               },
                        @{
                                                 @"date": @"28",
                                                 @"time": @"02:00:67",
                                               },
                        @{
                                                 @"date": @"29",
                                                 @"time": @"01:51:68",
                                               },
                        @{
                                                 @"date": @"30",
                                                 @"time": @"01:58:45",
                                               },
                        @{
                                                 @"date": @"31",
                                                 @"time": @"02:11:07",
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
        
        LineChartDataSet *d = [[LineChartDataSet alloc] initWithEntries:values label:[NSString stringWithFormat:@"天数/秒数"]];
        d.lineWidth = 5.0;
        d.circleRadius = 4.0;
        d.circleHoleRadius = 2.0;
        
        UIColor *color = colors[z % colors.count];
        [d setColor:color];
        [d setCircleColor:color];
        [d setCircleColors: ChartColorTemplates.vordiplom];
        d.mode = LineChartModeCubicBezier;
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
