//
//  MarkEnumerator.h
//  Paint
//
//  Created by 钟武 on 16/5/30.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface MarkEnumerator : NSEnumerator

- (NSArray *)allObjects;
- (id)nextObject;

- (id) initWithMark:(id <Mark>)mark;
- (void) traverseAndBuildStackWithMark:(id <Mark>)mark;

@end
