//
//  StrokeSizeCommand.m
//  TouchPainter
//
//  Created by 钟武 on 16/5/20.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "SetStrokeSizeCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"

@implementation SetStrokeSizeCommand

@synthesize delegate=delegate_;

- (void) execute
{
    NSNumber *strokeSize = [NSNumber numberWithFloat:1];
    [delegate_ command:self didRequestForStrokeSize:&strokeSize];
    
    CoordinatingController *coordinator = [CoordinatingController sharedInstance];
    CanvasViewController *controller = [coordinator canvasViewController];
    
    [controller setStrokeSize:[strokeSize floatValue]];
}

@end
