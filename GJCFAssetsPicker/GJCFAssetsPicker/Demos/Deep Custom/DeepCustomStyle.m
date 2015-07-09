//
//  DeepCustomStyle.m
//  GJCommonFoundation
//
//  Created by ZYVincent on 14-9-15.
//  Copyright (c) 2014年 ZYProSoft. All rights reserved.
//

#import "DeepCustomStyle.h"
#import "DeepCustomPickerOverlayView.h"

@implementation DeepCustomStyle

- (UIColor *)sysNavigationBarBackgroundColor
{
    return [UIColor colorWithRed:4/255.f green:150/255.f blue:234/255.f alpha:1];
}
- (UIFont *)sysNavigationBarTitleFont
{
    return [UIFont boldSystemFontOfSize:17];
}

- (UIColor *)sysNavigationBarTitleColor
{
    return [UIColor whiteColor];
}

- (UIFont *)sysNavigationButtonFont
{
    return [UIFont boldSystemFontOfSize:17];
}

- (UIFont *)sysButtonFont
{
    return [UIFont systemFontOfSize:17];
}

- (UIColor *)sysNavigationButtonNormalStateTextColor
{
    return [UIColor whiteColor];
}

- (UIColor *)sysButtonNormalStateTextColor
{
    return [self sysNavigationBarBackgroundColor];
}


#pragma mark - 自定义风格

- (NSInteger)numberOfColums
{
    return 3;
}

- (BOOL)enableBigImageShowAction
{
    return NO;
}

- (CGFloat)columSpace
{
    return 5.f;
}

- (Class)sysOverlayViewClass
{
    return [DeepCustomPickerOverlayView class];
}

- (GJCFAssetsPickerCommonStyleDescription *)sysAlbumsNavigationBarDes
{
    GJCFAssetsPickerCommonStyleDescription *aStyle = [[GJCFAssetsPickerCommonStyleDescription alloc]init];
    aStyle.backgroundColor = [self sysNavigationBarBackgroundColor];
    aStyle.title = @"选择相册";
    aStyle.font = [self sysNavigationBarTitleFont];
    aStyle.titleColor = [self sysNavigationBarTitleColor];
    
    return aStyle;
}

- (GJCFAssetsPickerCommonStyleDescription *)sysPhotoNavigationBarDes
{
    GJCFAssetsPickerCommonStyleDescription *aStyle = [[GJCFAssetsPickerCommonStyleDescription alloc]init];
    aStyle.backgroundColor = [self sysNavigationBarBackgroundColor];
    aStyle.title = @"选择照片";
    aStyle.font = [self sysNavigationBarTitleFont];
    aStyle.titleColor = [self sysNavigationBarTitleColor];

    return aStyle;
}

- (GJCFAssetsPickerCommonStyleDescription *)sysPreviewNavigationBarDes
{
    GJCFAssetsPickerCommonStyleDescription *aStyle = [[GJCFAssetsPickerCommonStyleDescription alloc]init];
    aStyle.backgroundColor = [self sysNavigationBarBackgroundColor];
    aStyle.font = [self sysNavigationBarTitleFont];
    aStyle.titleColor = [self sysNavigationBarTitleColor];

    return aStyle;
}

- (GJCFAssetsPickerCommonStyleDescription *)sysCancelBtnDes
{
    GJCFAssetsPickerCommonStyleDescription *aStyle = [super sysCancelBtnDes];
    aStyle.font = [self sysNavigationBarTitleFont];
    
    
    return aStyle;
}

- (GJCFAssetsPickerCommonStyleDescription *)sysPreviewBtnDes
{
    GJCFAssetsPickerCommonStyleDescription *aStyle = [super sysPreviewBtnDes];
    aStyle.font = [self sysButtonFont];
    aStyle.normalStateTextColor = [self sysNavigationBarBackgroundColor];
    
    return aStyle;
}

- (GJCFAssetsPickerCommonStyleDescription *)sysFinishDoneBtDes
{
    GJCFAssetsPickerCommonStyleDescription *aStyle = [super sysFinishDoneBtDes];
    aStyle.title = @"选择图片";
    aStyle.font = [self sysButtonFont];
    aStyle.normalStateTextColor = [self sysNavigationBarBackgroundColor];
    
    return aStyle;
}

- (GJCFAssetsPickerCommonStyleDescription *)sysPreviewChangeSelectStateBtnDes
{
    GJCFAssetsPickerCommonStyleDescription *aStyle = [super sysPreviewChangeSelectStateBtnDes];
    aStyle.selectedStateImage = [UIImage imageNamed:@"GjAssetsPicker_image_selected_blue.png"];
    
    return aStyle;
}


@end
