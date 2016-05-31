//
//  ThumbnailModel.m
//  Paint
//
//  Created by 钟武 on 16/5/31.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "ThumbnailModel.h"

@implementation ThumbnailModel

- (Scribble *) scribble
{
    if (_scribble == nil)
    {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSData *scribbleData = [fileManager contentsAtPath:_scribblePath];
        ScribbleMemento *scribbleMemento = [ScribbleMemento mementoWithData:scribbleData];
        _scribble = [Scribble scribbleWithMemento:scribbleMemento];
    }
    
    return _scribble;
}

@end
