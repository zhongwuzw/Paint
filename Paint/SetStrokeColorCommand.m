//
//  StrokeColorCommand.m
//  TouchPainter
//
//  Created by 钟武 on 16/5/20.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "SetStrokeColorCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"

@implementation SetStrokeColorCommand

@synthesize delegate=delegate_;

- (void) execute
{
    NSNumber *redValue = [NSNumber numberWithFloat:0.0];
    NSNumber *greenValue = [NSNumber numberWithFloat:0.0];
    NSNumber *blueValue = [NSNumber numberWithFloat:0.0];
    
    [delegate_ command:self didRequestColorComponentsForRed:&redValue
                 green:&greenValue
                  blue:&blueValue];
    
    if (_RGBValuesProvider != nil)
    {
        _RGBValuesProvider(redValue, greenValue, blueValue);
    }
    
    UIColor *color = [UIColor colorWithRed:[redValue floatValue]
                                     green:[greenValue floatValue]
                                      blue:[blueValue floatValue]
                                     alpha:1.0];
    
    CoordinatingController *coordinator = [CoordinatingController sharedInstance];
    CanvasViewController *controller = [coordinator canvasViewController];
    [controller setStrokeColor:color];
    
    [delegate_ command:self didFinishColorUpdateWithColor:&color];
    
    if (_postColorUpdateProvider != nil)
    {
        _postColorUpdateProvider(color);
    }
}

@end
