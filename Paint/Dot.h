//
//  Dot.h
//  Paint
//
//  Created by 钟武 on 16/5/19.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "Vertex.h"

@interface Dot : Vertex

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;

- (id) copyWithZone:(NSZone *)zone;

- (id)initWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(NSCoder *)coder;

- (void) acceptMarkVisitor:(id <MarkVisitor>)visitor;

@end
