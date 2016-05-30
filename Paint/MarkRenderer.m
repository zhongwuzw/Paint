//
//  MarkRenderer.m
//  Paint
//
//  Created by 钟武 on 16/5/30.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "MarkRenderer.h"

@interface MarkRenderer ()

@property (nonatomic, assign) BOOL shouldMoveContextToDot;
@property (nonatomic, assign) CGContextRef context;

@end

@implementation MarkRenderer

- (id) initWithCGContext:(CGContextRef)context
{
    if (self = [super init])
    {
        _context = context;
        _shouldMoveContextToDot = YES;
    }
    
    return self;
}

- (void) visitMark:(id <Mark>)mark
{
}

- (void)visitDot:(Dot *)dot
{
    CGFloat x = [dot location].x;
    CGFloat y = [dot location].y;
    CGFloat frameSize = [dot size];
    CGRect frame = CGRectMake(x - frameSize / 2.0,
                              y - frameSize / 2.0,
                              frameSize,
                              frameSize);
    
    CGContextSetFillColorWithColor (_context,[[dot color] CGColor]);
    CGContextFillEllipseInRect(_context, frame);
}

- (void) visitVertex:(Vertex *)vertex
{
    CGFloat x = [vertex location].x;
    CGFloat y = [vertex location].y;
    
    if (_shouldMoveContextToDot)
    {
        CGContextMoveToPoint(_context, x, y);
        _shouldMoveContextToDot = NO;
    }
    else
    {
        CGContextAddLineToPoint(_context, x, y);
    }
}

- (void) visitStroke:(Stroke *)stroke
{
    CGContextSetStrokeColorWithColor (_context,[[stroke color] CGColor]);
    CGContextSetLineWidth(_context, [stroke size]);
    CGContextSetLineCap(_context, kCGLineCapRound);
    CGContextStrokePath(_context);
    _shouldMoveContextToDot = YES;
}
@end
