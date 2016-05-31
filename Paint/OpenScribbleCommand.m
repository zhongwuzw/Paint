//
//  OpenScribbleCommand.m
//  TouchPainter
//
//  Created by 钟武 on 16/5/20.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "OpenScribbleCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"

@implementation OpenScribbleCommand

- (id) initWithScribbleSource:(ThumbnailModel *)aScribbleSource
{
    if (self = [super init]) {
        _scribbleSource = aScribbleSource;
    }
    return self;
}
- (void) execute
{
    Scribble *scribble = [_scribbleSource scribble];
    
    CoordinatingController *coordinator = [CoordinatingController sharedInstance];
    CanvasViewController *controller = [coordinator canvasViewController];
    [controller setScribble:scribble];
    
    [coordinator requestViewChangeByObject:self];
}

@end
