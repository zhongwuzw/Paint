//
//  ThumbnailViewCell.m
//  Paint
//
//  Created by 钟武 on 16/5/31.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "ThumbnailViewCell.h"
#import "Masonry.h"

@implementation ThumbnailViewCell

- (instancetype)initWithFrame:(CGRect)aRect
{
    if (self = [super initWithFrame:aRect]) {
        [self initializeView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)initializeView
{
    _imageView = [UIImageView new];
    [self.contentView addSubview:_imageView];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(self.contentView);
    }];
}

@end
