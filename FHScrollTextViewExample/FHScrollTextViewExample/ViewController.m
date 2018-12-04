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
    scrollTextView.textFont = [UIFont systemFontOfSize:16];
    scrollTextView.textColor = [UIColor redColor];
    scrollTextView.labelLeftInset = 10;
    scrollTextView.autoScrollTimeInterval = 2;
    scrollTextView.textAlignment = NSTextAlignmentCenter;
    scrollTextView.textArr = @[@"0000000000",@"1111111111",@"2222222222",@"3333333333",@"4444444444"];
}


@end
