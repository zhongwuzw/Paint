//
//  Command.h
//  Paint
//
//  Created by 钟武 on 16/5/20.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Command : NSObject

@property (nonatomic, strong) NSDictionary *userInfo;

- (void) execute;
- (void) undo;

@end
