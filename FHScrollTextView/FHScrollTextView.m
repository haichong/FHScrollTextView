//
//  FHScrollTextView.m
//  TestAppIOS
//
//  Created by fuhang on 2018/12/4.
//  Copyright © 2018 fuhang. All rights reserved.
//

#import "FHScrollTextView.h"

#import "FHScrollTextCell.h"

static NSString *const CellId = @"FHScrollTextCell";

@interface FHScrollTextView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *mainScrollView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger textCount;
@property (nonatomic, assign) NSInteger totalItemCount;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@end

@implementation FHScrollTextView

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (!newSuperview) {
        [self invalidateTimer];
        _mainScrollView = nil;
    }
}

- (UIScrollView *)mainScrollView
{
    if (!_mainScrollView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(self.width, self.height);
        layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _mainScrollView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        [self addSubview:_mainScrollView];
        _mainScrollView.backgroundColor = [UIColor clearColor];
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.userInteractionEnabled = NO;
        _mainScrollView.delegate  = self;
        _mainScrollView.dataSource = self;
        
        [_mainScrollView registerClass:[FHScrollTextCell class] forCellWithReuseIdentifier:@"FHScrollTextCell"];
    }
    
    return _mainScrollView;
}

- (void)initTimer
{
    [self invalidateTimer];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:self.autoScrollTimeInterval target:self selector:@selector(automaticScrollAction) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)invalidateTimer
{
    [_timer invalidate];
    _timer = nil;
}

- (void)automaticScrollAction
{
    NSInteger index = self.mainScrollView.contentOffset.y / self.height;
    if (index + 1 < self.totalItemCount) {
        [self.mainScrollView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index + 1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    } else {
        [self.mainScrollView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
}

- (void)setTextArr:(NSArray *)textArr
{
    NSMutableArray *mutableTextArr = [[NSMutableArray alloc] initWithArray:textArr];
    [mutableTextArr enumerateObjectsUsingBlock:^(NSString * text, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![text isKindOfClass:[NSString class]]) {return;}

        if (text.length == 0) {
            [mutableTextArr removeObject:text];
        }
    }];
    
    _textArr = [mutableTextArr copy];
    
    if (self.textCount == 0) { return; }

    [self.mainScrollView reloadData];
    
    if (self.textCount == 1) {return;}
    
    [self initTimer];
}

#pragma mark - UICollectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.totalItemCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FHScrollTextCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellId forIndexPath:indexPath];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UILabel *label = [self createLabelWithFrame:CGRectMake(self.labelLeftInset, 0, self.width, self.height)];
    label.text = self.textArr[[self currentIndexWithRow:indexPath.row]];
    [cell.contentView addSubview:label];
    
    return cell;
}

- (UILabel *)createLabelWithFrame:(CGRect)frame
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.font = self.textFont;
    label.textColor = self.textColor;
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = self.textAlignment;
    label.numberOfLines = 1;
    
    return label;
}

- (NSInteger)currentIndexWithRow:(NSInteger)row
{
    return row % self.textCount;
}

- (NSInteger)totalItemCount
{
    return self.textArr.count * 10000;
}

- (NSInteger)textCount
{
    return self.textArr.count;
}

- (UIFont *)textFont
{
    return _textFont ? _textFont : [UIFont systemFontOfSize:16];
}

- (UIColor *)textColor
{
    return _textColor ? _textColor : [UIColor blackColor];
}

- (CGFloat)labelLeftInset
{
    return  _labelLeftInset > 0 ? _labelLeftInset : 10;
}

- (CGFloat)autoScrollTimeInterval
{
    return _autoScrollTimeInterval > 0 ? _autoScrollTimeInterval : 3;
}

- (void)setAutoScrollTimeInterval:(CGFloat)autoScrollTimeInterval
{
    _autoScrollTimeInterval = autoScrollTimeInterval;

    [self invalidateTimer];
    [self initTimer];
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

@end
