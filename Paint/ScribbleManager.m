//
//  ScribbleManager.m
//  Paint
//
//  Created by 钟武 on 16/5/20.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "ScribbleManager.h"
#import "Scribble.h"
#import "ThumbnailModel.h"

#define kScribbleDataPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data"]
#define kScribbleThumbnailPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/thumbnails"]

@implementation ScribbleManager

- (void) saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image
{
    NSInteger newIndex = [self numberOfScribbles] + 1;
    
    NSString *scribbleDataName = [NSString stringWithFormat:@"data_%ld", (long)newIndex];
    NSString *scribbleThumbnailName = [NSString stringWithFormat:@"thumbnail_%ld.png",
                                       (long)newIndex];
    
    ScribbleMemento *scribbleMemento = [scribble scribbleMemento];
    NSData *mementoData = [scribbleMemento data];
    NSString *mementoPath = [[self scribbleDataPath]
                             stringByAppendingPathComponent:scribbleDataName];
    [mementoData writeToFile:mementoPath atomically:YES];
    
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
    NSString *imagePath = [[self scribbleThumbnailPath]
                           stringByAppendingPathComponent:scribbleThumbnailName];
    [imageData writeToFile:imagePath atomically:YES];
}

- (NSInteger) numberOfScribbles
{
    NSArray *scribbleDataPathsArray = [self scribbleDataPaths];
    return [scribbleDataPathsArray count];
}

- (NSString *) scribbleThumbnailPath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:kScribbleThumbnailPath])
    {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager createDirectoryAtPath:kScribbleThumbnailPath
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:NULL];
    }
    
    return kScribbleThumbnailPath;
}


- (NSArray *) scribbleDataPaths
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *scribbleDataPathsArray = [fileManager contentsOfDirectoryAtPath:[self scribbleDataPath]
                                                                       error:&error];
    
    return scribbleDataPathsArray;
}

- (NSArray*) scribbleThumbnailPaths
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *scribbleThumbnailPathsArray = [fileManager contentsOfDirectoryAtPath:[self scribbleThumbnailPath]
                                                                            error:&error];
    return scribbleThumbnailPathsArray;
}

- (ThumbnailModel *)scribbleThumbnailViewAtIndex:(NSInteger)index
{
    ThumbnailModel *thumbnailModel = [ThumbnailModel new];
    
    NSArray *scribbleThumbnailPathsArray = [self scribbleThumbnailPaths];
    NSArray *scribblePathsArray = [self scribbleDataPaths];
    
    NSString *scribbleThumbnailPath = [scribbleThumbnailPathsArray objectAtIndex:index];
    NSString *scribblePath = [scribblePathsArray objectAtIndex:index];
    
    if (scribbleThumbnailPath) {
        thumbnailModel.imagePath = [kScribbleThumbnailPath
                                    stringByAppendingPathComponent:
                                    scribbleThumbnailPath];
        thumbnailModel.scribblePath = [kScribbleDataPath
                                       stringByAppendingPathComponent:
                                       scribblePath];
    }
    return thumbnailModel;
}

#pragma mark -
#pragma mark Private Methods

- (NSString *) scribbleDataPath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:kScribbleDataPath])
    {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager createDirectoryAtPath:kScribbleDataPath
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:NULL];
    }
    
    return kScribbleDataPath;
}

@end
