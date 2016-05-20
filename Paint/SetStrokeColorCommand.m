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

- (void) execute
{
  NSNumber *redValue = [NSNumber numberWithFloat:0.0];
  NSNumber *greenValue = [NSNumber numberWithFloat:0.0];
  NSNumber *blueValue = [NSNumber numberWithFloat:0.0];
  
  // Retrieve RGB values from a delegate or a block 
  
  // Delegation (object adapter) approach:
  [_delegate command:self didRequestColorComponentsForRed:redValue
                                                    green:greenValue
                                                     blue:blueValue];
  
  // Block approach:
  if (_RGBValuesProvider != nil)
  {
    _RGBValuesProvider(redValue, greenValue, blueValue);
  }
  
  // Create a color object based on the RGB values
  UIColor *color = [UIColor colorWithRed:[redValue floatValue]
                                   green:[greenValue floatValue]
                                    blue:[blueValue floatValue]
                                   alpha:1.0];
  
  // Assign it to the current canvasViewController
  CoordinatingController *coordinator = [CoordinatingController sharedInstance];
  CanvasViewController *controller = [coordinator canvasViewController];
  [controller setStrokeColor:color];
  
  // Forward a post update message
  
  // Delegation approach:
  [_delegate command:self didFinishColorUpdateWithColor:color];
  
  // Block approach:
  if (_postColorUpdateProvider != nil)
  {
    _postColorUpdateProvider(color);
  }
}

@end
