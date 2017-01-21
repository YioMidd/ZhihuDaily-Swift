//
//  CustomAlignLabel.h
//  ZhihuDaily
//
//  Created by KiBen on 17/1/21.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, VerticalTextAlignment) {
    VerticalTextAlignmentTop = 0,
    VerticalTextAlignmentMiddle,
    VerticalTextAlignmentBottom,
};

@interface CustomAlignLabel : UILabel
@property (nonatomic, assign)  VerticalTextAlignment verticalTextAlignment;
@end
