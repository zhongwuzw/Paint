//
//  DeleteScribbleCommand.m
//  TouchPainter
//
//  Created by 钟武 on 16/5/20.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "DeleteScribbleCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"

@implementation DeleteScribbleCommand

- (void) execute
{
  // get a hold of the current
  // CanvasViewController from
  // the CoordinatingController
  CoordinatingController *coordinatingController = [CoordinatingController sharedInstance];
  CanvasViewController *canvasViewController = [coordinatingController canvasViewController];
  
  // create a new scribble for
  // canvasViewController
  Scribble *newScribble = [[Scribble alloc] init];
  [canvasViewController setScribble:newScribble];
}


@end
