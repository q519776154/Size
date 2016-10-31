//
//  Cell.m
//  计算字体宽度的类别
//
//  Created by qianfeng on 16/10/31.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

#import "Cell.h"

@implementation Cell
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    self.titleLabel.layer.cornerRadius = self.frame.size.height/2;
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLabel.clipsToBounds = YES;
}

@end
