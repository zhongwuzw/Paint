//
//  ThumbnailModel.h
//  Paint
//
//  Created by 钟武 on 16/5/31.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scribble.h"

@interface ThumbnailModel : NSObject

@property (nonatomic, copy) NSString *imagePath;
@property (nonatomic, copy) NSString *scribblePath;
@property (nonatomic, strong) Scribble *scribble;

@end
