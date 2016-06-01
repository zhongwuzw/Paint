//
//  SaveScribbleCommand.m
//  TouchPainter
//
//  Created by 钟武 on 16/5/20.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "SaveScribbleCommand.h"
#import "ScribbleManager.h"
#import "CoordinatingController.h"
#import "UIView+UIImage.h"

@implementation SaveScribbleCommand

- (void) execute
{
    CoordinatingController *coordinatingController = [CoordinatingController sharedInstance];
    CanvasViewController *canvasViewController = [coordinatingController canvasViewController];
    
    UIImage *canvasViewImage = [canvasViewController.canvasView image];
    
    Scribble *scribble = [canvasViewController scribble];
    
    ScribbleManager *scribbleManager = [ScribbleManager new];
    [scribbleManager saveScribble:scribble thumbnail:canvasViewImage];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"绘图保存成功"
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
