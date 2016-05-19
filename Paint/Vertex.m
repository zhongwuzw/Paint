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

- (id) initWithLocation:(CGPoint) aLocation
{
    if (self = [super init])
    {
        [self setLocation:aLocation];
    }
    
    return self;
}

#pragma mark -
#pragma mark NSCopying method

- (id)copyWithZone:(NSZone *)zone
{
    Vertex *vertexCopy = [[[self class] allocWithZone:zone] initWithLocation:self.location];
    
    return vertexCopy;
}


@end
