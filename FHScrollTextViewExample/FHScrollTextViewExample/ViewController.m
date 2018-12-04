//
//  ViewController.m
//  FHScrollTextViewExample
//
//  Created by fuhang on 2018/12/4.
//  Copyright © 2018 FHScrollTextViewDemo. All rights reserved.
//

#import "ViewController.h"

#import "FHScrollTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    FHScrollTextView *scrollTextView = [[FHScrollTextView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
    [self.view addSubview:scrollTextView];
    scrollTextView.backgroundColor = [UIColor yellowColor];
    // 设置字体大小，默认16
    scrollTextView.textFont = [UIFont systemFontOfSize:16];
    // 设置字体颜色，默认blackColor
    scrollTextView.textColor = [UIColor redColor];
    // 设置文字左边距，默认10
    scrollTextView.labelLeftInset = 10;
    // 设置自动滚动间隔时间,默认3s
    scrollTextView.autoScrollTimeInterval = 2;
    // 设置文字方向，默认左对齐
    scrollTextView.textAlignment = NSTextAlignmentCenter;
    scrollTextView.textArr = @[@"0000000000",@"1111111111",@"2222222222",@"3333333333",@"4444444444"];
}


@end
