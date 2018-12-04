# FHScrollTextView文字滚动播放
####Example

![FHScrollTextView.GIF](https://upload-images.jianshu.io/upload_images/1798226-4d7e0088cc2e2877.GIF?imageMogr2/auto-orient/strip)

####用法简介
```
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
```
####[简书](https://www.jianshu.com/p/a7b7d2bed3f2)
