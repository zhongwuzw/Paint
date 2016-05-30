//
//  Dot.m
//  Paint
//
//  Created by 钟武 on 16/5/19.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "Dot.h"

@implementation Dot

@synthesize color,size;

- (void) acceptMarkVisitor:(id <MarkVisitor>)visitor
{
    [visitor visitDot:self];
}

#pragma mark -
#pragma mark NSCopying method

- (id)copyWithZone:(NSZone *)zone
{
    Dot *dotCopy = [[[self class] allocWithZone:zone] initWithLocation:self.location];
    
    [dotCopy setColor:[UIColor colorWithCGColor:[self.color CGColor]]];
    
    [dotCopy setSize:self.size];
    
    return dotCopy;
}

#pragma mark -
#pragma mark NSCoder methods

- (id)initWithCoder:(NSCoder *)coder
{
    if (self = [super initWithCoder:coder])
    {
        color = [coder decodeObjectForKey:@"DotColor"];
        size = [coder decodeFloatForKey:@"DotSize"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [super encodeWithCoder:coder];
    [coder encodeObject:color forKey:@"DotColor"];
    [coder encodeFloat:size forKey:@"DotSize"];
}

@end
