//
//  MagnifyingGlassDisplayView.h
//  MagnifyingGlassDisplayView
//
//  Created by Liangjiawei on 2016/11/24.
//  Copyright © 2016年 Liangjiawei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MagnifyingGlassDisplayView : UIView

@property (nonatomic) UIView *viewToMagnify;
@property (nonatomic) CGPoint displayPoint;
@property (nonatomic) float scale;

- (instancetype)initWithViewToMagnify:(UIView *)viewToMagnify Frame:(CGRect)frame;

@end
