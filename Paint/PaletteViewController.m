//
//  PaletteViewController.m
//  TouchPainter
//
//  Created by 钟武 on 16/5/20.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import "PaletteViewController.h"

@implementation PaletteViewController

- (void) viewDidDisappear:(BOOL)animated
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setFloat:[redSlider_ value] forKey:@"red"];
    [userDefaults setFloat:[greenSlider_ value] forKey:@"green"];
    [userDefaults setFloat:[blueSlider_ value] forKey:@"blue"];
    [userDefaults setFloat:[sizeSlider_ value] forKey:@"size"];
}

- (void)viewDidLoad 
{
    [super viewDidLoad];
    
    SetStrokeColorCommand *colorCommand = (SetStrokeColorCommand *)[redSlider_ command];
    
    [colorCommand setRGBValuesProvider: ^(NSNumber *red, NSNumber *green, NSNumber *blue)
     {
         red = [NSNumber numberWithFloat:[redSlider_ value]];
         green = [NSNumber numberWithFloat:[greenSlider_ value]];
         blue = [NSNumber numberWithFloat:[blueSlider_ value]];
     }];
    
    [colorCommand setPostColorUpdateProvider: ^(UIColor *color)
     {
         [paletteView_ setBackgroundColor:color];
     }];

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    CGFloat redValue = [userDefaults floatForKey:@"red"];
    CGFloat greenValue = [userDefaults floatForKey:@"green"];
    CGFloat blueValue = [userDefaults floatForKey:@"blue"];
    CGFloat sizeValue = [userDefaults floatForKey:@"size"];
    
    [redSlider_ setValue:redValue];
    [greenSlider_ setValue:greenValue];
    [blueSlider_ setValue:blueValue];
    [sizeSlider_ setValue:sizeValue];
    
    UIColor *color = [UIColor colorWithRed:redValue
                                     green:greenValue
                                      blue:blueValue
                                     alpha:1.0];
    
    [paletteView_ setBackgroundColor:color];
}

#pragma mark -
#pragma mark SetStrokeColorCommandDelegate methods

- (void) command:(SetStrokeColorCommand *) command 
                didRequestColorComponentsForRed:(NSNumber **) red
                                          green:(NSNumber **) green
                                           blue:(NSNumber **) blue
{
    *red = [NSNumber numberWithFloat:[redSlider_ value]];
    *green = [NSNumber numberWithFloat:[greenSlider_ value]];
    *blue = [NSNumber numberWithFloat:[blueSlider_ value]];
}

- (void) command:(SetStrokeColorCommand *) command
                didFinishColorUpdateWithColor:(UIColor **) color
{
    [paletteView_ setBackgroundColor:*color];
}

#pragma mark SetStrokeSizeCommandDelegate method

- (void) command:(SetStrokeSizeCommand *)command 
                didRequestForStrokeSize:(NSNumber **)size
{
    *size = [NSNumber numberWithFloat:[sizeSlider_ value]];
}

#pragma mark -
#pragma mark Slider event handler

- (IBAction) onCommandSliderValueChanged:(CommandSlider *)slider
{
    [[slider command] execute];
}


@end
