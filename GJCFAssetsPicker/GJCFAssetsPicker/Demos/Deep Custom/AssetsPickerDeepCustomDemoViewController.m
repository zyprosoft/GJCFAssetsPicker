//
//  AssetsPickerDeepCustomDemoViewController.m
//  GJCommonFoundation
//
//  Created by ZYVincent on 14-9-15.
//  Copyright (c) 2014年 ZYProSoft. All rights reserved.
//

#import "AssetsPickerDeepCustomDemoViewController.h"
#import "DeepCustomStyle.h"
#import "GJCFAssetsPickerViewController.h"
#import "TVGDebugQuickUI.h"
#import "CustomAlbumsCell.h"
#import "GJCFUitils.h"

@interface AssetsPickerDeepCustomDemoViewController ()<GJCFAssetsPickerViewControllerDelegate>

@end

@implementation AssetsPickerDeepCustomDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [GJCFAssetsPickerStyle removeCustomStyleByKey:@"DeepCustomStyle"];
    
    DeepCustomStyle *deepStyle = [[DeepCustomStyle alloc]init];
    [GJCFAssetsPickerStyle appendCustomStyle:deepStyle forKey:@"DeepCustomStyle"];
    
    UIButton *showBtn = [TVGDebugQuickUI buttonAddOnView:self.view title:@"选择照片" target:self selector:@selector(showPicker)];
    showBtn.gjcf_top = 88;
    showBtn.gjcf_left = 10;
    
}

- (void)showPicker
{
    GJCFAssetsPickerViewController *assetsPicker = [[GJCFAssetsPickerViewController alloc]init];
    assetsPicker.mutilSelectLimitCount = 8;
    assetsPicker.pickerDelegate = self;
    
    /* 注入自定义相册Cell */
    [assetsPicker registAlbumsCustomCellClass:[CustomAlbumsCell class] withCellHeight:65.f];
    
    /* 注入预先设置的风格 */
    [assetsPicker setCustomStyleByKey:@"DeepCustomStyle"];
    
    [self presentViewController:assetsPicker animated:YES completion:nil];
}

#pragma mark - assetsPicker delegate
- (void)pickerViewController:(GJCFAssetsPickerViewController *)pickerViewController didReachLimitSelectedCount:(NSInteger)limitCount
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"超过限制%d张数",limitCount] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
}

- (void)pickerViewControllerRequirePreviewButNoSelectedImage:(GJCFAssetsPickerViewController *)pickerViewController
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"请选择要预览的图片"] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
}

- (void)pickerViewController:(GJCFAssetsPickerViewController *)pickerViewController didFinishChooseMedia:(NSArray *)resultArray
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)pickerViewControllerPhotoLibraryAccessDidNotAuthorized:(GJCFAssetsPickerViewController *)pickerViewController
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"请授权访问你的相册"] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
}

@end
