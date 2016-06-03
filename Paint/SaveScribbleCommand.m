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
#import "MBProgressHUD.h"

@implementation SaveScribbleCommand

- (void) execute
{
    CoordinatingController *coordinatingController = [CoordinatingController sharedInstance];
    CanvasViewController *canvasViewController = [coordinatingController canvasViewController];
    
    UIImage *canvasViewImage = [canvasViewController.canvasView image];
    
    Scribble *scribble = [canvasViewController scribble];
    
    ScribbleManager *scribbleManager = [ScribbleManager new];
    [scribbleManager saveScribble:scribble thumbnail:canvasViewImage];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:canvasViewController.navigationController.view animated:YES];
    
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.customView.tintColor = [UIColor whiteColor];
    hud.square = YES;
    hud.labelText = NSLocalizedString(@"Done", @"HUD done title");
    
    [hud hide:YES afterDelay:3.f];

}

@end
