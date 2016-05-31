//
//  ThumbnailViewController.m
//  Paint
//
//  Created by 钟武 on 16/5/31.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "ThumbnailViewController.h"
#import "ScribbleManager.h"
#import "ThumbnailViewCell.h"
#import "ThumbnailModel.h"
#import "UIImageView+WebCache.h"
#import "OpenScribbleCommand.h"

static NSString *cellIdentifier = @"Cell";

@interface ThumbnailViewController ()

@property (nonatomic, strong)ScribbleManager * scribbleManager;

@end

@implementation ThumbnailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _scribbleManager = [[ScribbleManager alloc] init];
    
    NSInteger numberOfScribbles = [_scribbleManager numberOfScribbles];
    [self.navigationItem setTitle:[NSString stringWithFormat:
                                   numberOfScribbles > 1 ? @"%ld items" : @"%ld item",
                                   (long)numberOfScribbles]];
    
    [self.collectionView registerClass:[ThumbnailViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    self.collectionView.alwaysBounceVertical = YES;
    [self.collectionView setBackgroundColor:[UIColor colorWithPatternImage:
                                             [UIImage imageNamed:@"background_texture"]]];
}

#pragma mark -
#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_scribbleManager numberOfScribbles];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ThumbnailViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    ThumbnailModel *model = [_scribbleManager scribbleThumbnailViewAtIndex:indexPath.row];
    cell.command = [[OpenScribbleCommand alloc] initWithScribbleSource:model];
    
    [cell.imageView setImage:[UIImage imageNamed:model.imagePath]];
    
    return cell;
}

#pragma mark -
#pragma mark UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ThumbnailViewCell *cell = (ThumbnailViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell.command execute];
}

@end
