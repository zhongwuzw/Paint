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
                // load a PaletteViewController
                PaletteViewController *controller = [[[PaletteViewController alloc] init] autorelease];
                
                // transition to the PaletteViewController
                [canvasViewController_ presentModalViewController:controller
                                                         animated:YES];
                
                // set the activeViewController to
                // paletteViewController
                activeViewController_ = controller;
            }
                break;
            case kButtonTagOpenThumbnailView:
            {
                // load a ThumbnailViewController
                ThumbnailViewController *controller = [[[ThumbnailViewController alloc] init] autorelease];
                
                
                // transition to the ThumbnailViewController
                [canvasViewController_ presentModalViewController:controller
                                                         animated:YES];
                
                // set the activeViewController to
                // ThumbnailViewController
                activeViewController_ = controller;
            }
                break;
            default:
                // just go back to the main canvasViewController
                // for the other types
            {
                // The Done command is shared on every
                // view controller except the CanvasViewController
                // When the Done button is hit, it should
                // take the user back to the first page in
                // conjunction with the design
                // other objects will follow the same path
                [canvasViewController_ dismissModalViewControllerAnimated:YES];
                
                // set the activeViewController back to
                // canvasViewController
                activeViewController_ = canvasViewController_;
            }
                break;
        }
    }
    // every thing else goes to the main canvasViewController
    else 
    {
        [canvasViewController_ dismissModalViewControllerAnimated:YES];
        
        // set the activeViewController back to 
        // canvasViewController
        activeViewController_ = canvasViewController_;
    }
    
}

@end
