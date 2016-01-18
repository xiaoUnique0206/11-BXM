//
//  NewsTableViewCell.h
//  GeekNews
//
//  Created by fanyanqing on 16/1/18.
//  Copyright © 2016年 tusm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell

@property(strong,nonatomic)UILabel *subTitleLab;
@property(strong,nonatomic)UILabel *timeLab;
@property(strong,nonatomic)UILabel *titleLab;
@property(strong,nonatomic)UILabel *tagLab;
@property(strong,nonatomic)UIImageView *imgView;
@property(strong,nonatomic)ArticleItem *item;
//@property(strong,nonatomic)<#NSObject#> *<#obj#>;

@end
