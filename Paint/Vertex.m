//
//  Vertex.m
//  Paint
//
//  Created by 钟武 on 16/5/19.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "Vertex.h"

@interface Vertex ()

@end

@implementation Vertex

@synthesize location;
@dynamic color,size;

- (id) initWithLocation:(CGPoint) aLocation
{
    if (self = [super init])
    {
        [self setLocation:aLocation];
    }
    
    return self;
}

- (void) setColor:(UIColor *)color {}
- (UIColor *) color { return nil; }
- (void) setSize:(CGFloat)size {}
- (CGFloat) size { return 0.0; }

- (void) addMark:(id <Mark>) mark {}
- (void) removeMark:(id <Mark>) mark {}
- (id <Mark>) childMarkAtIndex:(NSUInteger) index { return nil; }
- (id <Mark>) lastChild { return nil; }
- (NSUInteger) count { return 0; }
- (NSEnumerator *) enumerator { return nil; }
- (void) enumerateMarksUsingBlock:(void (^)(id <Mark> item, BOOL *stop)) block {}

- (void) acceptMarkVisitor:(id <MarkVisitor>)visitor
{
    [visitor visitVertex:self];
}

#pragma mark -
#pragma mark NSCopying method

- (id)copyWithZone:(NSZone *)zone
{
    Vertex *vertexCopy = [[[self class] allocWithZone:zone] initWithLocation:self.location];
    
    return vertexCopy;
}

#pragma mark -
#pragma mark NSCoder methods

- (id)initWithCoder:(NSCoder *)coder
{
    if (self = [super init])
    {
        location = [(NSValue *)[coder decodeObjectForKey:@"VertexLocation"] CGPointValue];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:[NSValue valueWithCGPoint:location] forKey:@"VertexLocation"];
}

@end
