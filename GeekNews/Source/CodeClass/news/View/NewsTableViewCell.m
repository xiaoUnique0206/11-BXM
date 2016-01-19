//
//  NewsTableViewCell.m
//  GeekNews
//
//  Created by fanyanqing on 16/1/18.
//  Copyright © 2016年 tusm. All rights reserved.
//

#import "NewsTableViewCell.h"

#define NEWS_GAP (W/40)
#define NEWS_W (W-2*NEWS_GAP)
#define NEWS_H ((H-206)/2-2*NEWS_GAP)

@implementation NewsTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self drawView];
    }
    return self;
}

- (void)drawView
{
    [self.contentView addSubview:self.subTitleLab];
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.imgView];
    [self.contentView addSubview:self.tagLab];
}
-(UILabel *)subTitleLab
{
    if (!_subTitleLab)
    {
        _subTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(NEWS_GAP, NEWS_GAP, NEWS_W/2, 30)];
    }
    return _subTitleLab;
}
-(UILabel *)titleLab
{
    if (!_titleLab)
    {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(NEWS_GAP, CGRectGetMaxY(self.subTitleLab.frame)+NEWS_GAP, NEWS_W, 35)];
    }
    return _titleLab;
}
-(UIImageView *)imgView
{
    if (!_imgView)
    {
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(NEWS_GAP, CGRectGetMaxY(self.titleLab.frame)+NEWS_GAP, NEWS_W, 200)];
    }
    return _imgView;
}
-(void)setItem:(ArticleItem *)item
{
 if ( _item != item)
    {
        _item = nil;
        _item = item;
    }
    self.subTitleLab.text = _item.ProviderName;
    self.titleLab.text = _item.Title;
        NSLog(@"urlString:%@",_item.picUrl);
//    [self.imgView sd_setImageWithURL:[NSURL URLWithString:_item.picUrl]];
}
- (void)awakeFromNib {
    // Initialization code
  
    
//    NSMutableArray *infoImgArray = [[NSMutableArray alloc]init];
//    @try {
//        for (NSDictionary *dict in _artieleModel.mes) {
//            
//            [infoImgArray addObject:[NSString stringWithFormat:@"%@",[dict objectForKey:@"Url"]]];
//            //        NSLog(@"-%@",[dict objectForKey:@"Url"]);
//            //        NSLog(@"-----------");
//        }
//    }
//    @catch (NSException *exception) {
//         NSLog(@"%@",infoImgArray);
//    }
//    @finally {
//        NSLog(@"不行!!!");
//    }
//    NSString *str = [infoImgArray firstObject];
//NSLog(@"%@",str);
    
//    NSString *str = nil;
//    @try {
//         str = [NSString stringWithFormat:@"%@", [(NSArray*)_artieleModel.mes firstObject]];
//        NSLog(@"%@",str);
//    }
//    @catch (NSException *exception) {
//        [self.infoImgView sd_setImageWithURL:[NSURL URLWithString:str]];
//    }
//    @finally {
//        
//    }
    
   
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",infoImgArray[0]]]];
    
//    [self.infoImgView sd_setImageWithURL:[NSURL URLWithString:_artieleModel.mes]];
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
