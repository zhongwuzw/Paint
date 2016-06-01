//
//  PaletteViewController.h
//  TouchPainter
//
//  Created by 钟武 on 16/5/20.
//  Copyright © 2016年 钟武. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommandBarButton.h"
#import "CommandSlider.h"
#import "SetStrokeColorCommand.h"
#import "SetStrokeSizeCommand.h"

@interface PaletteViewController : UIViewController 
                                   <SetStrokeColorCommandDelegate, 
                                    SetStrokeSizeCommandDelegate>
{
	@private
	IBOutlet CommandSlider *redSlider_;
	IBOutlet CommandSlider *greenSlider_;
	IBOutlet CommandSlider *blueSlider_;
	IBOutlet CommandSlider *sizeSlider_;
	IBOutlet UIView *paletteView_;
}

// slider event handler
- (IBAction) onCommandSliderValueChanged:(CommandSlider *)slider;

@end
