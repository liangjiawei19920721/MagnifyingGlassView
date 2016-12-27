//
//  MagnifyingGlassView.m
//  MagnifyingGlassView
//
//  Created by Liangjiawei on 2016/11/24.
//  Copyright © 2016年 Liangjiawei. All rights reserved.
//

#import "MagnifyingGlassView.h"

@interface MagnifyingGlassView()

@property (nonatomic) CGPoint beginPoint;

@end

@implementation MagnifyingGlassView

- (instancetype)initWithViewToMagnify:(UIView *)viewToMagnify Frame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _isSameView = YES;
        _magnifyingGlassDisplayView = [[MagnifyingGlassDisplayView alloc] initWithViewToMagnify:viewToMagnify Frame:frame];
        self.layer.borderColor = [[UIColor blackColor] CGColor];
        self.layer.borderWidth = 2;
        [viewToMagnify addSubview:self];
        [viewToMagnify addSubview:_magnifyingGlassDisplayView];
        [self setTouchPoint:CGPointMake(self.frame.origin.x+self.frame.size.width/2.0, self.frame.origin.y+self.frame.size.height/2.0)];
    }
    return self;
}

- (instancetype)initWithViewToMagnify:(UIView *)viewToMagnify Frame:(CGRect)frame DisPlayFrame:(CGRect)disPlayFrame{
    if (self = [super initWithFrame:frame]) {
        _isSameView = NO;
        _magnifyingGlassDisplayView = [[MagnifyingGlassDisplayView alloc] initWithViewToMagnify:viewToMagnify Frame:disPlayFrame];
        self.layer.borderColor = [[UIColor blackColor] CGColor];
        self.layer.borderWidth = 2;
        [viewToMagnify addSubview:self];
        [viewToMagnify addSubview:_magnifyingGlassDisplayView];
        [self setTouchPoint:CGPointMake(self.frame.origin.x+self.frame.size.width/2.0, self.frame.origin.y+self.frame.size.height/2.0)];
    }
    return self;
}

- (void)setScale:(float)scale{
    _scale = scale;
    _magnifyingGlassDisplayView.scale = scale;
}

- (void)setTouchPoint:(CGPoint)touchPoint {
    self.hidden = YES;
    self.center = CGPointMake(touchPoint.x, touchPoint.y);
    self.magnifyingGlassDisplayView.displayPoint = touchPoint;
    if (self.isSameView){
        self.magnifyingGlassDisplayView.center = self.center;
    }
    [self.magnifyingGlassDisplayView setNeedsDisplay];
    self.hidden = NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    self.beginPoint = [touch locationInView:self];
    [[self superview] bringSubviewToFront:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    float deltaX = point.x - self.beginPoint.x;
    float deltaY = point.y - self.beginPoint.y;
    CGPoint newCenter = CGPointMake(self.center.x + deltaX, self.center.y + deltaY);
    if (deltaX<0){
        newCenter.x=MAX(CGRectGetMidX(self.bounds),newCenter.x);
    }
    else{
        newCenter.x=MIN(self.superview.bounds.size.width-CGRectGetMidX(self.bounds),newCenter.x);
    }
    if (deltaY<0){
        newCenter.y=MAX(newCenter.y,CGRectGetMidY(self.bounds));
    }
    else{
        newCenter.y=MIN(newCenter.y,self.superview.bounds.size.height-CGRectGetMidY(self.bounds));
    }
    [self setTouchPoint:newCenter];
}

@end
