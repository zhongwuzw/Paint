//
//  CommandBarButton.h
//  Paint
//
//  Created by 钟武 on 16/5/23.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Command.h"

@interface CommandBarButton : UIBarButtonItem

@property (nonatomic, strong) Command *command;

@end
