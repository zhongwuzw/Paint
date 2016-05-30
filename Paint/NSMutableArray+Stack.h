//
//  NSMutableArray+Stack.h
//  Paint
//
//  Created by 钟武 on 16/5/30.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Stack)

- (void) push:(id)object;
- (id) pop;
- (void) dropBottom;

@end
