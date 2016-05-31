//
//  ViewController.m
//  Paint
//
//  Created by 钟武 on 16/5/13.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "CoordinatingController.h"
#import "CanvasViewController.h"
#import "PaletteViewController.h"
#import "ThumbnailViewController.h"

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

#pragma mark -
#pragma mark A method for view transitions

- (void)requestViewChangeByObject:(id)object
{
    
    if ([object isKindOfClass:[UIBarButtonItem class]])
    {
        switch ([(UIBarButtonItem *)object tag])
        {
            case kButtonTagOpenPaletteView:
            {
                PaletteViewController *controller = [[PaletteViewController alloc] init];
                
                [_canvasViewController.navigationController pushViewController:controller animated:YES];
                
                _activeViewController = controller;
            }
                break;
            case kButtonTagOpenThumbnailView:
            {
                UICollectionViewFlowLayout *collectionLayout = [UICollectionViewFlowLayout new];
                collectionLayout.itemSize = CGSizeMake(90, 130);
                
                ThumbnailViewController *controller = [[ThumbnailViewController alloc] initWithCollectionViewLayout:collectionLayout];
                
                [_canvasViewController.navigationController pushViewController:controller animated:YES];
                
                _activeViewController = controller;
            }
                break;
            default:
            {
                [_canvasViewController.navigationController popViewControllerAnimated:YES];
                
                _activeViewController = _canvasViewController;
            }
                break;
        }
    }
    else 
    {
        [_canvasViewController.navigationController popViewControllerAnimated:YES];

        _activeViewController = _canvasViewController;
    }
    
}

@end
