//
//  ScribbleMemento.h
//  Paint
//
//  Created by 钟武 on 16/5/24.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface ScribbleMemento : NSObject

//@property (nonatomic, assign) BOOL hasCompleteSnapshot;
//@property (nonatomic, copy) id<Mark> mark;

+ (ScribbleMemento *) mementoWithData:(NSData *)data;
- (NSData *) data;

@end
