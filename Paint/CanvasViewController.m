//
//  CanvasViewController.m
//  Paint
//
//  Created by 钟武 on 16/5/16.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "CanvasViewController.h"
#import "Masonry.h"

@interface CanvasViewController ()

@property (nonatomic, assign) CGPoint startPoint;

@end

@implementation CanvasViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    CanvasViewGenerator *defaultGenerator = [CanvasViewGenerator new];
    [self loadCanvasViewWithGenerator:defaultGenerator];
    
    self.scribble = [Scribble new];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    CGFloat redValue = [userDefaults floatForKey:@"red"];
    CGFloat greenValue = [userDefaults floatForKey:@"green"];
    CGFloat blueValue = [userDefaults floatForKey:@"blue"];
    CGFloat sizeValue = [userDefaults floatForKey:@"size"];
    
    self.strokeSize = sizeValue;
    self.strokeColor = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0];
}

- (void) setScribble:(Scribble *)aScribble
{
    if (_scribble != aScribble)
    {
        //修复KVO崩溃问题，设置新的scribble时，由于原有scribble实例有KVO监听，所以需要先remove掉
        if (_scribble) {
            [_scribble removeObserver:self forKeyPath:@"mark"];
        }
        
        _scribble = aScribble;
        
        [_scribble addObserver:self
                    forKeyPath:@"mark"
                       options:NSKeyValueObservingOptionInitial |
         NSKeyValueObservingOptionNew
                       context:nil];
    }
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
