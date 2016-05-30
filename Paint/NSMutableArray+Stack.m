//
//  NSMutableArray+Stack.m
//  Paint
//
//  Created by 钟武 on 16/5/30.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)

- (void) push:(id)object
{
    if (object != nil)
        [self addObject:object];
}

- (id) pop
{
    if ([self count] == 0) return nil;
    
    id object = [self lastObject];
    [self removeLastObject];
    
    return object;
}

- (void) dropBottom
{
    if ([self count] == 0) return;
    
    [self removeObjectAtIndex:0];
}

@end
