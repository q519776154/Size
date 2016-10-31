//
//  NSString+Size.h
//  计算字体宽度的类别
//
//  Created by qianfeng on 16/10/31.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Size)

/**
 *  根据文字来计算宽和高
 *
 *  @param fontSize 字体大小
 *  @param maxSize  最大size
 *
 *  @return 计算好的宽度和高度
 */
- (CGSize)sizeWithFontSize:(CGFloat)fontSize maxSize:(CGSize)maxSize;

@end
