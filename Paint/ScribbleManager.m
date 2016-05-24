//
//  ScribbleManager.m
//  Paint
//
//  Created by 钟武 on 16/5/20.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "ScribbleManager.h"
#import "Scribble.h"

#define kScribbleDataPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data"]
#define kScribbleThumbnailPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/thumbnails"]

@implementation ScribbleManager

- (void) saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image
{
    NSInteger newIndex = [self numberOfScribbles] + 1;
    
    NSString *scribbleDataName = [NSString stringWithFormat:@"data_%ld", (long)newIndex];
    NSString *scribbleThumbnailName = [NSString stringWithFormat:@"thumbnail_%ld.png",
                                       (long)newIndex];
    
    // get a memento from the scribble
    // then save the memento in the file system
    ScribbleMemento *scribbleMemento = [scribble scribbleMemento];
    NSData *mementoData = [scribbleMemento data];
    NSString *mementoPath = [[self scribbleDataPath]
                             stringByAppendingPathComponent:scribbleDataName];
    [mementoData writeToFile:mementoPath atomically:YES];
    
    // save the thumbnail directly in
    // the file system
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
    // lazy create the scribble thumbnail directory
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

#pragma mark -
#pragma mark Private Methods

- (NSString *) scribbleDataPath
{
    // lazy create the scribble data directory
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
