//
//  CanvasViewController.m
//  Paint
//
//  Created by 钟武 on 16/5/16.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "CanvasViewController.h"
#import "Masonry.h"
#import "CommandBarButton.h"

@interface CanvasViewController ()

@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, strong) UIToolbar *toolBar;

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
    
    [self initializeToolBar];
}

- (void)initializeToolBar
{
    //set toolBar
    self.toolBar = [UIToolbar new];
    self.toolBar.barStyle = UIBarStyleBlackTranslucent;
    self.toolBar.tintColor = [UIColor grayColor];
    [self.view addSubview:self.toolBar];
    
    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.equalTo(@(44));
    }];
    
    CommandBarButton *trashToolBar = [[CommandBarButton alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(handleCustomBarButtonHit:)];
    
    [self.toolBar setItems:@[trashToolBar] animated:YES];

}

#pragma mark - 
#pragma mark handle barbutton

- (void)handleCustomBarButtonHit:(CommandBarButton *)barButton
{
    
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

#pragma mark -
#pragma mark Touch Event Handlers

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _startPoint = [[touches anyObject] locationInView:_canvasView];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

#pragma mark -
#pragma mark Scribble observer method

- (void) observeValueForKeyPath:(NSString *)keyPath
                       ofObject:(id)object
                         change:(NSDictionary *)change
                        context:(void *)context
{
    if ([object isKindOfClass:[Scribble class]] &&
        [keyPath isEqualToString:@"mark"])
    {
        id <Mark> mark = [change objectForKey:NSKeyValueChangeNewKey];
        [_canvasView setMark:mark];
        [_canvasView setNeedsDisplay];
    }
}


@end
