//
//  SelectTableViewCell.m
//  GeekNews
//
//  Created by 宋庆亮 on 16/1/19.
//  Copyright © 2016年 tusm. All rights reserved.
//

#import "SelectTableViewCell.h"

@implementation SelectTableViewCell

- (void)setSelect:(Select *)select{
    self.provideLabel.text = select.ProviderName;
    self.titleLabel.text = select.Title;
    [self.titleImaView sd_setImageWithURL:[NSURL URLWithString:select.Url]];
    [self.provideImaView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://imgcdn3.newsrep.net/icon.img?t=provider&id=%@&w=36",select.ProviderId]]placeholderImage:[UIImage imageNamed:@"cf50ab3.png"]];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
