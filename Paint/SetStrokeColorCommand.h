//
//  StrokeColorCommand.h
//  TouchPainter
//
//  Created by 钟武 on 16/5/20.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
#import "Command.h"

typedef void (^RGBValuesProvider)(NSNumber *red, NSNumber *green, NSNumber *blue);
typedef void (^PostColorUpdateProvider)(UIColor *color);

@class SetStrokeColorCommand;

@protocol SetStrokeColorCommandDelegate

- (void) command:(SetStrokeColorCommand *) command 
                didRequestColorComponentsForRed:(NSNumber **) red
                                          green:(NSNumber **) green
                                           blue:(NSNumber **) blue;

- (void) command:(SetStrokeColorCommand *) command
                didFinishColorUpdateWithColor:(UIColor **) color;

@end


@interface SetStrokeColorCommand : Command

@property (nonatomic, weak) id <SetStrokeColorCommandDelegate> delegate;
@property (nonatomic, copy) RGBValuesProvider RGBValuesProvider;
@property (nonatomic, copy) PostColorUpdateProvider postColorUpdateProvider;

- (void) execute;

@end
