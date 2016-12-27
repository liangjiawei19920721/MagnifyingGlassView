//
//  MagnifyingGlassDisplayView.m
//  MagnifyingGlassDisplayView
//
//  Created by Liangjiawei on 2016/11/24.
//  Copyright © 2016年 Liangjiawei. All rights reserved.
//

#import "MagnifyingGlassDisplayView.h"

@implementation MagnifyingGlassDisplayView

- (instancetype)initWithViewToMagnify:(UIView *)viewToMagnify Frame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        _scale = 1.5;
        _viewToMagnify = viewToMagnify;
        self.layer.borderColor = [[UIColor blackColor] CGColor];
        self.layer.borderWidth = 2;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    self.hidden = YES;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context,self.frame.size.width/2.0,self.frame.size.height/2.0);
    CGContextScaleCTM(context, self.scale, self.scale);
    CGContextTranslateCTM(context,-self.displayPoint.x,-self.displayPoint.y);
    [self.viewToMagnify.layer renderInContext:context];
    self.hidden = NO;
}

@end
