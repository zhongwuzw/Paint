//
//  ScribbleMemento_Friend.h
//  Paint
//
//  Created by 钟武 on 16/5/24.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "ScribbleMemento.h"
#import "Mark.h"

@interface ScribbleMemento ()

- (id) initWithMark:(id <Mark>)aMark;

@property (nonatomic, copy) id <Mark> mark;
@property (nonatomic, assign) BOOL hasCompleteSnapshot;

@end
