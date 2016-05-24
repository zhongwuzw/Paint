//
//  ScribbleManager.h
//  Paint
//
//  Created by 钟武 on 16/5/20.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Scribble;
@import UIKit;

@interface ScribbleManager : NSObject

- (void) saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image;
- (NSInteger) numberOfScribbles;
- (Scribble *) scribbleAtIndex:(NSInteger)index;
- (UIView *) scribbleThumbnailViewAtIndex:(NSInteger)index;


@end
