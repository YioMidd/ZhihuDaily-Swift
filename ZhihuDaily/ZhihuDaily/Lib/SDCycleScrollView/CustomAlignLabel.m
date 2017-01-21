//
//  CustomAlignLabel.m
//  ZhihuDaily
//
//  Created by KiBen on 17/1/21.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

#import "CustomAlignLabel.h"

@implementation CustomAlignLabel

- (void)setVerticalTextAlignment:(VerticalTextAlignment)verticalTextAlignment {
    _verticalTextAlignment = verticalTextAlignment;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect rect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (_verticalTextAlignment) {
        case VerticalTextAlignmentTop:
            rect.origin.y = bounds.origin.y;
            break;
        case VerticalTextAlignmentMiddle:
            rect.origin.y = bounds.origin.y + (bounds.size.height - rect.size.height) / 2.0;
            break;
        case VerticalTextAlignmentBottom:
            rect.origin.y = bounds.origin.y + (bounds.size.height - rect.size.height);
            break;
        default:
            break;
    }
    return rect;
}

- (void)drawTextInRect:(CGRect)rect {
    CGRect actualRect = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}
@end
