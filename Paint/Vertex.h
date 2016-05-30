//
//  Vertex.h
//  Paint
//
//  Created by 钟武 on 16/5/19.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface Vertex : NSObject <Mark>

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id <Mark> lastChild;

- (id) initWithLocation:(CGPoint) location;
- (void) addMark:(id <Mark>) mark;
- (void) removeMark:(id <Mark>) mark;
- (id <Mark>) childMarkAtIndex:(NSUInteger) index;

- (id)copyWithZone:(NSZone *)zone;

- (NSEnumerator *) enumerator;
- (void) enumerateMarksUsingBlock:(void (^)(id <Mark> item, BOOL *stop)) block;

- (id)initWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(NSCoder *)coder;

- (void) acceptMarkVisitor:(id <MarkVisitor>)visitor;

@end
