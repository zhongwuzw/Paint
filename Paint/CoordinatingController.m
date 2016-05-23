//
//  ViewController.m
//  Paint
//
//  Created by 钟武 on 16/5/13.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "CoordinatingController.h"
#import "CanvasViewController.h"

@interface CoordinatingController ()

@property (nonatomic, strong) CanvasViewController *canvasViewController;
@property (nonatomic, strong) UIViewController *activeViewController;

@end

@implementation CoordinatingController

+ (instancetype)sharedInstance
{
    static CoordinatingController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CoordinatingController alloc] init];
        [sharedInstance initialize];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

- (void) initialize
{
    _canvasViewController = [[CanvasViewController alloc] init];
    _activeViewController = _canvasViewController;
}

@end
