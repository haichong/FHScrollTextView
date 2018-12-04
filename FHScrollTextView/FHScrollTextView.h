//
//  FHScrollTextView.h
//  TestAppIOS
//
//  Created by fuhang on 2018/12/4.
//  Copyright © 2018 fuhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FHScrollTextView : UIView
{
    CGFloat _autoScrollTimeInterval;
}
@property (nonatomic, copy) NSArray *textArr;

/** 字体大小，默认16 */
@property (nonatomic, copy) UIFont *textFont;
/** 字体颜色，默认blackColor */
@property (nonatomic, copy) UIColor *textColor;
/** 文字左边距，默认10 */
@property (nonatomic, assign) CGFloat labelLeftInset;
/** 自动滚动间隔时间,默认3s */
@property (nonatomic, assign) CGFloat autoScrollTimeInterval;
/** 文字方向，默认左对齐 */
@property (nonatomic, assign) NSTextAlignment textAlignment;


@end

NS_ASSUME_NONNULL_END
