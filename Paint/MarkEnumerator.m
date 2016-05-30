//
//  MarkEnumerator.m
//  Paint
//
//  Created by 钟武 on 16/5/30.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "MarkEnumerator.h"
#import "NSMutableArray+Stack.h"

@interface MarkEnumerator ()

@property (nonatomic, strong) NSMutableArray *stack;

@end

@implementation MarkEnumerator

- (NSArray *)allObjects
{
    return [[_stack reverseObjectEnumerator] allObjects];
}

- (id)nextObject
{
    return [_stack pop];
}

- (id) initWithMark:(id <Mark>)aMark
{
    if (self = [super init])
    {
        _stack = [[NSMutableArray alloc] initWithCapacity:[aMark count]];
        
        [self traverseAndBuildStackWithMark:aMark];
    }
    
    return self;
}

- (void) traverseAndBuildStackWithMark:(id <Mark>)mark
{
    if (mark == nil) return;
    
    [_stack push:mark];
    
    NSUInteger index = [mark count];
    id <Mark> childMark;
    while ((childMark = [mark childMarkAtIndex:--index]))
    {
        [self traverseAndBuildStackWithMark:childMark];
    }
}

@end
