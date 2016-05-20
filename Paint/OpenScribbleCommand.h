//
//  OpenScribbleCommand.h
//  TouchPainter
//
//  Created by 钟武 on 16/5/20.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"
#import "ScribbleSource.h"

@interface OpenScribbleCommand : Command 
{
  @private
  id <ScribbleSource> scribbleSource_;
}

@property (nonatomic, retain) id <ScribbleSource> scribbleSource;

- (id) initWithScribbleSource:(id <ScribbleSource>) aScribbleSource;
- (void) execute;

@end
