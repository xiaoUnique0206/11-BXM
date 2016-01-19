//
//  SelectTableViewCell.m
//  GeekNews
//
//  Created by 宋庆亮 on 16/1/18.
//  Copyright © 2016年 tusm. All rights reserved.
//

#import "SelectTableViewCell.h"

@implementation SelectTableViewCell

- (void)setSelect:(Select *)select{
    self.provideLabel.text = select.ProviderName;
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
