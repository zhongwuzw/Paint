//
//  UIView+UIImage.m
//  Paint
//
//  Created by 钟武 on 16/5/23.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "UIView+UIImage.h"

@implementation UIView (UIImage)

- (UIImage *)image
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:true];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
