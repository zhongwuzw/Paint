//
//  OpenScribbleCommand.h
//  TouchPainter
//
//  Created by 钟武 on 16/5/20.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"
#import "ThumbnailModel.h"

@interface OpenScribbleCommand : Command

@property (nonatomic, strong) ThumbnailModel *scribbleSource;

- (id) initWithScribbleSource:(ThumbnailModel *)aScribbleSource;
- (void) execute;

@end
