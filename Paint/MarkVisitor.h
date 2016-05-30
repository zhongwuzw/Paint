//
//  MarkVisitor.h
//  Paint
//
//  Created by 钟武 on 16/5/30.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol Mark;
@class Dot, Vertex, Stroke;

@protocol MarkVisitor <NSObject>

- (void) visitMark:(id <Mark>)mark;
- (void) visitDot:(Dot *)dot;
- (void) visitVertex:(Vertex *)vertex;
- (void) visitStroke:(Stroke *)stroke;

@end
