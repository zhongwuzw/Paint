//
//  Stroke.m
//  Paint
//
//  Created by 钟武 on 16/5/19.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "Stroke.h"
#import "MarkEnumerator.h"

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

- (void) acceptMarkVisitor:(id <MarkVisitor>)visitor
{
    for (id <Mark> dot in _children)
    {
        [dot acceptMarkVisitor:visitor];
    }
    
    [visitor visitStroke:self];
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

#pragma mark -
#pragma mark enumerator methods

- (NSEnumerator *) enumerator
{
    return [[MarkEnumerator alloc] initWithMark:self];
}

- (void) enumerateMarksUsingBlock:(void (^)(id <Mark> item, BOOL *stop)) block
{
    if(!block)
        return;
    
    BOOL stop = NO;
    
    NSEnumerator *enumerator = [self enumerator];
    
    for (id <Mark> mark in enumerator)
    {
        block (mark, &stop);
        if (stop)
            break;
    }
}

#pragma mark -
#pragma mark NSCoder methods

- (id)initWithCoder:(NSCoder *)coder
{
    if (self = [super init])
    {
        color = [coder decodeObjectForKey:@"StrokeColor"];
        size = [coder decodeFloatForKey:@"StrokeSize"];
        _children = [coder decodeObjectForKey:@"StrokeChildren"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:color forKey:@"StrokeColor"];
    [coder encodeFloat:size forKey:@"StrokeSize"];
    [coder encodeObject:_children forKey:@"StrokeChildren"];
}

@end
