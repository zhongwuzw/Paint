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

- (void) execute
{
  // get the current stroke size
  // from whatever it's my delegate
  CGFloat strokeSize = 1;
  [_delegate command:self didRequestForStrokeSize:[NSNumber numberWithFloat:strokeSize]];
  
  // get a hold of the current
  // canvasViewController from
  // the coordinatingController
  // (see the Mediator pattern chapter
  // for details)
  CoordinatingController *coordinator = [CoordinatingController sharedInstance];
  CanvasViewController *controller = [coordinator canvasViewController];
  
  // assign the stroke size to
  // the canvasViewController
  [controller setStrokeSize:strokeSize];
}

@end
