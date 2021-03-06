//
//  CanvasViewController.h
//  Paint
//
//  Created by 钟武 on 16/5/16.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CanvasView.h"
#import "Scribble.h"
#import "CanvasViewGenerator.h"

@interface CanvasViewController : UIViewController

@property (nonatomic, strong) CanvasView *canvasView;
@property (nonatomic, strong) Scribble *scribble;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat strokeSize;

- (void) loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator;

- (NSInvocation *) drawScribbleInvocation;
- (NSInvocation *) undrawScribbleInvocation;

- (void) executeInvocation:(NSInvocation *)invocation withUndoInvocation:(NSInvocation *)undoInvocation;
- (void) unexecuteInvocation:(NSInvocation *)invocation withRedoInvocation:(NSInvocation *)redoInvocation;

@end
