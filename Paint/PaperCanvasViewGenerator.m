//
//  PaperCanvasViewGenerator.m
//  Paint
//
//  Created by 钟武 on 16/5/19.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "PaperCanvasViewGenerator.h"
#import "PaperCanvasView.h"

@implementation PaperCanvasViewGenerator

- (CanvasView *) canvasViewWithFrame:(CGRect) aFrame
{
    return [[PaperCanvasView alloc] initWithFrame:aFrame];
}

@end
