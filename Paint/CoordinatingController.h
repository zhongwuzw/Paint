//
//  ViewController.h
//  Paint
//
//  Created by 钟武 on 16/5/13.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoordinatingController : UIViewController

@property (nonatomic, readonly) UIViewController *activeViewController;

+ (instancetype)sharedInstance;

@end

