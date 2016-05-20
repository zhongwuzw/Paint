//
//  CanvasViewController.m
//  Paint
//
//  Created by 钟武 on 16/5/16.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "CanvasViewController.h"
#import "Masonry.h"

@implementation CanvasViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    CanvasViewGenerator *defaultGenerator = [CanvasViewGenerator new];
    [self loadCanvasViewWithGenerator:defaultGenerator];
}

#pragma mark -
#pragma mark Loading a CanvasView from a CanvasViewGenerator

- (void) loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator
{
    [_canvasView removeFromSuperview];
    
    CanvasView *aCanvasView = [generator canvasViewWithFrame:CGRectZero];
    [self setCanvasView:aCanvasView];
    [self.view addSubview:self.canvasView];
    
    [self.canvasView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(_canvasView.superview);
    }];
}


@end
