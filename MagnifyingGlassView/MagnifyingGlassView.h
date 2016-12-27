//
//  MagnifyingGlassView.h
//  MagnifyingGlassView
//
//  Created by Liangjiawei on 2016/11/24.
//  Copyright © 2016年 Liangjiawei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagnifyingGlassDisplayView.h"

@interface MagnifyingGlassView : UIView

@property (nonatomic) MagnifyingGlassDisplayView *magnifyingGlassDisplayView;
@property (nonatomic) BOOL isSameView;
@property (nonatomic) float scale;

- (instancetype)initWithViewToMagnify:(UIView *)viewToMagnify Frame:(CGRect)frame;
- (instancetype)initWithViewToMagnify:(UIView *)viewToMagnify Frame:(CGRect)frame DisPlayFrame:(CGRect)disPlayFrame;

@end
