//
//  CanvasView.m
//  Paint
//
//  Created by 钟武 on 16/5/19.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "CanvasView.h"
#import "MarkRenderer.h"

@interface CanvasView ()

@end

@implementation CanvasView

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    MarkRenderer *markRenderer = [[MarkRenderer alloc] initWithCGContext:context];
    [self.mark acceptMarkVisitor:markRenderer];
}

@end
