//
//  ClothCanvasViewGenerator.m
//  Paint
//
//  Created by 钟武 on 16/5/19.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "ClothCanvasViewGenerator.h"
#import "ClothCanvasView.h"

@implementation ClothCanvasViewGenerator

- (CanvasView *) canvasViewWithFrame:(CGRect) aFrame
{
    return [[ClothCanvasView alloc] initWithFrame:aFrame];
}

@end
