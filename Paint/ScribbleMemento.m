//
//  ScribbleMemento.m
//  Paint
//
//  Created by 钟武 on 16/5/24.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "ScribbleMemento.h"
#import "Mark.h"
#import "ScribbleMemento_Friend.h"

@interface ScribbleMemento ()

@end

@implementation ScribbleMemento

- (NSData *) data
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_mark];
    return data;
}

+ (ScribbleMemento *) mementoWithData:(NSData *)data
{
    id<Mark> restoreMark = nil;
    @try {
        restoreMark = (id <Mark>)[NSKeyedUnarchiver unarchiveObjectWithData:data];
    } @catch (NSException *exception) {
        ;
    }

    ScribbleMemento *memento = [[ScribbleMemento alloc]
                                 initWithMark:restoreMark];
    
    return memento;
}

- (id) initWithMark:(id <Mark>)aMark
{
    if (self = [super init])
    {
        [self setMark:aMark];
    }
    
    return self;
}

@end
