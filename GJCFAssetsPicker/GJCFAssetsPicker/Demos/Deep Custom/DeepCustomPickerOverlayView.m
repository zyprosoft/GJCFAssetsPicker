//
//  DeepCustomPickerOverlayView.m
//  GJCommonFoundation
//
//  Created by ZYVincent on 14-9-15.
//  Copyright (c) 2014年 ZYProSoft. All rights reserved.
//

#import "DeepCustomPickerOverlayView.h"
#import "GJCFUitils.h"

@implementation DeepCustomPickerOverlayView

- (id)init
{
    if (self = [super init]) {
        
        self.enableChooseToSeeBigImageAction = NO;

    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.enableChooseToSeeBigImageAction = NO;
    }
    return self;
}

- (void)switchNormalState
{
    self.selectIconImgView.image = nil;
}

- (void)switchSelectState
{
    self.selectIconImgView.image = [UIImage imageNamed:@"GjAssetsPicker_image_selected_blue.png"];
    [UIView animateWithDuration:0.3 animations:^{
       
        self.selectIconImgView.transform = CGAffineTransformMakeScale(3.5, 3.5);
        
    } completion:^(BOOL finished) {
        
        self.selectIconImgView.transform = CGAffineTransformMakeScale(1.0, 1.0);

    }];
}

@end
