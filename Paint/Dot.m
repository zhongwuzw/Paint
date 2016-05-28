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

#pragma mark -
#pragma mark NSCopying method

- (id)copyWithZone:(NSZone *)zone
{
    Dot *dotCopy = [[[self class] allocWithZone:zone] initWithLocation:self.location];
    
    [dotCopy setColor:[UIColor colorWithCGColor:[self.color CGColor]]];
    
    [dotCopy setSize:self.size];
    
    return dotCopy;
}
@end
