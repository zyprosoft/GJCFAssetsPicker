//
//  CustomPhotoCell.m
//  GJAssetsPickerViewController
//
//  Created by ZYVincent on 14-9-10.
//  Copyright (c) 2014年 ZYProSoft. All rights reserved.
//

#import "CustomPhotoCell.h"

#define CustomPhotoCellLabelTag 445566

@implementation CustomPhotoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
    }
    return self;
}


- (void)setAssets:(NSArray *)assets
{
    [assets enumerateObjectsUsingBlock:^(GJCFAsset *asset, NSUInteger idx, BOOL *stop) {
        
        UIImageView *customImageView = (UIImageView*)[self.contentView viewWithTag:CustomPhotoCellLabelTag+idx];
        
        if (!customImageView) {
            customImageView = [[UIImageView alloc]init];
            customImageView.frame = CGRectOffset(self.contentView.frame, idx*self.contentView.frame.size.width/4, 0);
            customImageView.tag = CustomPhotoCellLabelTag+idx;
            [self.contentView addSubview:customImageView];
            
        }
        customImageView.image =  [UIImage imageWithCGImage:[asset.containtAsset thumbnail]];

    }];
    
}

@end
