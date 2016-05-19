//
//  CanvasView.h
//  Paint
//
//  Created by 钟武 on 16/5/19.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Mark;

@interface CanvasView : UIView

@property (nonatomic, retain) id <Mark> mark;

@end
