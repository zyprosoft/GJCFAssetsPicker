//
//  DemoViewController.m
//  GJAssetsPickerViewController
//
//  Created by ZYVincent on 14-9-8.
//  Copyright (c) 2014年 ZYProSoft. All rights reserved.
//

#import "DemoViewController.h"
#import "CustomAlbumsCell.h"
#import "CustomPhotoViewController.h"

@interface DemoViewController ()

@property (nonatomic,strong)NSMutableArray *currentSelectedAssetsArray;

@end

@implementation DemoViewController

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
    self.currentSelectedAssetsArray = [[NSMutableArray alloc]init];
    
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = (CGRect){50,80,150,50};
    [self.view addSubview:testBtn];
    [testBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [testBtn setTitle:@"test" forState:UIControlStateNormal];
    
    [testBtn addTarget:self action:@selector(showPicker) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    showBtn.frame = (CGRect){200,80,150,50};
    [self.view addSubview:showBtn];
    [showBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [showBtn setTitle:@"show" forState:UIControlStateNormal];
    
    [showBtn addTarget:self action:@selector(showResultImages) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)showResultImages
{
    [self.view.subviews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        
        if ([obj isKindOfClass:[UIImageView class]]) {
            [obj removeFromSuperview];
        }
    }];
    
    [self.currentSelectedAssetsArray enumerateObjectsUsingBlock:^(GJCFAsset *asset, NSUInteger idx, BOOL *stop) {
        
        NSLog(@"meta:%d",asset.isHaveBeenEdit);
        UIImageView *aImageView = [[UIImageView alloc]initWithImage:asset.thumbnail];
        aImageView.frame = (CGRect){0,100+idx*aImageView.frame.size.width+(idx+1)*3,aImageView.frame.size.width,aImageView.frame.size.height};
        [self.view addSubview:aImageView];
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)showPicker
{
    GJCFAssetsPickerViewController *assetsViewController = [[GJCFAssetsPickerViewController alloc]init];
    assetsViewController.pickerDelegate = self;
    assetsViewController.mutilSelectLimitCount = 8;

    /* 便捷自定义，需要预先注入风格 */
    [assetsViewController setCustomStyleByKey:@"GJCFMyCustomStyle"];
    
    /* 深度自定义 */
//    [assetsViewController registAlbumsCustomCellClass:[CustomAlbumsCell class] withCellHeight:70.f];
//    [assetsViewController registPhotoViewControllerClass:[CustomPhotoViewController class]];
    
    [self presentViewController:assetsViewController animated:YES completion:nil];
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

- (void)pickerViewController:(GJCFAssetsPickerViewController *)pickerViewController didFaildWithErrorMsg:(NSString *)errorMsg withErrorType:(GJAssetsPickerErrorType)errorType
{
    if (errorType == GJAssetsPickerErrorTypePhotoLibarayChooseZeroCountPhoto) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:errorMsg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }
}
- (void)pickerViewController:(GJCFAssetsPickerViewController *)pickerViewController didFinishChooseMedia:(NSArray *)resultArray
{
    [self.currentSelectedAssetsArray removeAllObjects];
    [self.currentSelectedAssetsArray addObjectsFromArray:resultArray];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)pickerViewControllerPhotoLibraryAccessDidNotAuthorized:(GJCFAssetsPickerViewController *)pickerViewController
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:[NSString stringWithFormat:@"请授权访问你的相册"] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
}

@end
