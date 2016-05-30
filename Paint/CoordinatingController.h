//
//  ViewController.h
//  Paint
//
//  Created by 钟武 on 16/5/13.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasViewController.h"

typedef enum
{
    kButtonTagDone,
    kButtonTagOpenPaletteView,
    kButtonTagOpenThumbnailView
} ButtonTag;

@interface CoordinatingController : NSObject

@property (nonatomic, readonly) UIViewController *activeViewController;
@property (nonatomic, readonly) CanvasViewController *canvasViewController;

+ (instancetype)sharedInstance;

- (void)requestViewChangeByObject:(id)object;

@end

