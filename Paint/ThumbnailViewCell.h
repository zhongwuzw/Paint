//
//  ThumbnailViewCell.h
//  Paint
//
//  Created by 钟武 on 16/5/31.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpenScribbleCommand.h"

@interface ThumbnailViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) OpenScribbleCommand *command;

@end
