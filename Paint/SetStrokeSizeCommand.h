//
//  StrokeSizeCommand.h
//  TouchPainter
//
//  Created by 钟武 on 16/5/20.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"

@class SetStrokeSizeCommand;

@protocol SetStrokeSizeCommandDelegate

- (void) command:(SetStrokeSizeCommand *)command 
                didRequestForStrokeSize:(NSNumber *)size;

@end


@interface SetStrokeSizeCommand : Command 

@property (nonatomic, assign) id <SetStrokeSizeCommandDelegate> delegate;

- (void) execute;

@end
