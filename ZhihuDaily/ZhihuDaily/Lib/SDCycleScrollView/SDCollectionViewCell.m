//
//  SDCollectionViewCell.m
//  SDCycleScrollView
//
//  Created by aier on 15-3-22.
//  Copyright (c) 2015年 GSD. All rights reserved.
//


/*
 
 *********************************************************************************
 *
 * 🌟🌟🌟 新建SDCycleScrollView交流QQ群：185534916 🌟🌟🌟
 *
 * 在您使用此自动轮播库的过程中如果出现bug请及时以以下任意一种方式联系我们，我们会及时修复bug并
 * 帮您解决问题。
 * 新浪微博:GSD_iOS
 * Email : gsdios@126.com
 * GitHub: https://github.com/gsdios
 *
 * 另（我的自动布局库SDAutoLayout）：
 *  一行代码搞定自动布局！支持Cell和Tableview高度自适应，Label和ScrollView内容自适应，致力于
 *  做最简单易用的AutoLayout库。
 * 视频教程：http://www.letv.com/ptv/vplay/24038772.html
 * 用法示例：https://github.com/gsdios/SDAutoLayout/blob/master/README.md
 * GitHub：https://github.com/gsdios/SDAutoLayout
 *********************************************************************************
 
 */


#import "SDCollectionViewCell.h"
#import "UIView+SDExtension.h"
#import "GradientView.h"
#import "CustomAlignLabel.h"

@implementation SDCollectionViewCell
{
    __weak CustomAlignLabel *_titleLabel;
    GradientView *_maskView;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupImageView];
        [self setupTitleLabel];
    }
    
    return self;
}

- (void)setTitleLabelBackgroundColor:(UIColor *)titleLabelBackgroundColor
{
    _titleLabelBackgroundColor = titleLabelBackgroundColor;
    _titleLabel.backgroundColor = titleLabelBackgroundColor;
}

- (void)setTitleLabelTextColor:(UIColor *)titleLabelTextColor
{
    _titleLabelTextColor = titleLabelTextColor;
    _titleLabel.textColor = titleLabelTextColor;
}

- (void)setTitleLabelTextFont:(UIFont *)titleLabelTextFont
{
    _titleLabelTextFont = titleLabelTextFont;
    _titleLabel.font = titleLabelTextFont;
}

- (void)setupImageView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    _imageView = imageView;
    [self.contentView addSubview:imageView];
    
    _maskView = [[GradientView alloc]initWithFrame:self.bounds type:TRANSPARENT_GRADIENT_TWICE_TYPE];
    [self.contentView addSubview:_maskView];
    
}

- (void)setupTitleLabel
{
    CustomAlignLabel *titleLabel = [[CustomAlignLabel alloc] init];
    titleLabel.verticalTextAlignment = VerticalTextAlignmentBottom;
    titleLabel.numberOfLines = 0;
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.hidden = YES;
    [self.contentView addSubview:titleLabel];
    _titleLabel = titleLabel;
}

- (void)setTitle:(NSString *)title
{
    _title = [title copy];
    _titleLabel.text = _title;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.onlyDisplayText) {
        _titleLabel.frame = self.bounds;
    } else {
        _imageView.frame = self.bounds;
        _maskView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [_maskView resetWithType:TRANSPARENT_GRADIENT_TWICE_TYPE];
        
        [self bringSubviewToFront:_titleLabel];
        
        CGFloat titleLabelW = self.sd_width - 30;
        CGFloat titleLabelH = _titleLabelHeight;
        CGFloat titleLabelX = 15;
        CGFloat titleLabelY = self.sd_height - titleLabelH - 25;
        _titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
        _titleLabel.hidden = !_titleLabel.text;
    }
}

@end
