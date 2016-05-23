//
//  Scribble.m
//  Paint
//
//  Created by 钟武 on 16/5/19.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "Scribble.h"
#import "Stroke.h"

@interface Scribble ()

@property (nonatomic, strong) id <Mark> mark;

@end

@implementation Scribble

@synthesize mark = _parentMark;

- (id) init
{
    if (self = [super init])
    {
        _parentMark = [[Stroke alloc] init];
    }
    
    return self;
}


@end
