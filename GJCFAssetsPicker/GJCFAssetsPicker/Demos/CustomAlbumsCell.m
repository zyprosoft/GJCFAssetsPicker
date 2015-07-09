//
//  CustomAlbumsCell.m
//  GJAssetsPickerViewController
//
//  Created by ZYVincent on 14-9-10.
//  Copyright (c) 2014年 ZYProSoft. All rights reserved.
//

#import "CustomAlbumsCell.h"

@implementation CustomAlbumsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //选中背景
        UIView *selectedBack = [[UIView alloc]initWithFrame:(CGRect){0,0,self.contentView.frame.size.width,65.f}];
        selectedBack.backgroundColor = [UIColor colorWithRed:4/255.f green:100/255.f blue:180/255.f alpha:1];
        self.selectedBackgroundView = selectedBack;
        
    }
    return self;
}

- (void)layoutSubviews
{
    self.imageView.frame = CGRectMake(8, 8, 49, 49);
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    self.textLabel.textColor = [UIColor colorWithRed:26.0/255.0 green:198.0/255.0 blue:3.0/255.0 alpha:1.0];
    self.textLabel.highlightedTextColor = [UIColor whiteColor];
    self.textLabel.font = [UIFont systemFontOfSize:16];
    [self.textLabel sizeToFit];
    self.textLabel.frame = (CGRect){70,24,self.textLabel.frame.size.width,self.textLabel.frame.size.height};
    
    self.detailTextLabel.textColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0];
    self.detailTextLabel.highlightedTextColor = [UIColor whiteColor];
    self.detailTextLabel.font = [UIFont systemFontOfSize:16];
    [self.detailTextLabel sizeToFit];
    self.detailTextLabel.frame = (CGRect){self.textLabel.frame.origin.x+self.textLabel.frame.size.width+4.5,24,self.detailTextLabel.frame.size.width,self.detailTextLabel.frame.size.height};
}


- (void)setAlbums:(GJCFAlbums *)aAlbums
{
    self.textLabel.textColor = [UIColor redColor];
    self.textLabel.font = [UIFont boldSystemFontOfSize:15];
    
    self.textLabel.text = [NSString stringWithFormat:@"%@ 共 %d 张",aAlbums.name,aAlbums.totalCount];
    self.imageView.image = aAlbums.posterImage;
    
}

@end
