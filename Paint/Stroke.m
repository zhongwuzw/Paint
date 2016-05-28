//
//  Stroke.m
//  Paint
//
//  Created by 钟武 on 16/5/19.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "Stroke.h"

@interface Stroke ()

@property (nonatomic, strong) NSMutableArray *children;

@end

@implementation Stroke

@synthesize color,size;

- (id) init
{
    if (self = [super init])
    {
        _children = [[NSMutableArray alloc] initWithCapacity:5];
    }
    
    return self;
}

- (void) setLocation:(CGPoint)aPoint
{
}

- (CGPoint) location
{
    if ([_children count] > 0)
    {
        return (CGPoint)[(id<Mark>)[_children objectAtIndex:0] location];
    }
    
    return CGPointZero;
}

- (void)addMark:(id<Mark>)mark
{
    [_children addObject:mark];
}

- (void)removeMark:(id<Mark>)mark
{
    if ([_children containsObject:mark])
    {
        [_children removeObject:mark];
    }
    else
    {
        [_children makeObjectsPerformSelector:@selector(removeMark:)
                                   withObject:mark];
    }
}

- (id <Mark>) childMarkAtIndex:(NSUInteger) index
{
    if (index >= [_children count]) return nil;
    
    return [_children objectAtIndex:index];
}

- (id <Mark>) lastChild
{
    return [_children lastObject];
}

- (NSUInteger) count
{
    return [_children count];
}

#pragma mark -
#pragma mark NSCopying method


- (id)copyWithZone:(NSZone *)zone
{
    Stroke *strokeCopy = [[[self class] allocWithZone:zone] init];

    [strokeCopy setColor:[UIColor colorWithCGColor:[color CGColor]]];
    
    [strokeCopy setSize:size];
    
    for (id <Mark> child in _children)
    {
        id <Mark> childCopy = [child copy];
        [strokeCopy addMark:childCopy];
    }
    
    return strokeCopy;
}

@end
