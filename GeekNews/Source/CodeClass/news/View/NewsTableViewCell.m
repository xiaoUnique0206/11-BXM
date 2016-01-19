//
//  NewsTableViewCell.m
//  GeekNews
//
//  Created by lanou3g on 16/1/19.
//  Copyright © 2016年 tusm. All rights reserved.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

#define iconURL @"http://imgcdn3.newsrep.net/icon.img?t=provider&id="


- (void)awakeFromNib {
    
}

-(void)setArtieleModel:(ArticleItem *)artieleModel{
    
    if (_artieleModel != artieleModel) {
        _artieleModel = nil;
        _artieleModel = artieleModel;
    }
    self.titleLabel.text = _artieleModel.Title;
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@&w=20",iconURL,_artieleModel.ProviderId]]];
    self.iconLabel.text = _artieleModel.ProviderName;
    
    //计算发布时间
    NSString *dateString = [_artieleModel.PubDate stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *foundDate = [dateFormatter dateFromString:dateString];
    foundDate = [foundDate dateByAddingTimeInterval:8*60*60];
    NSTimeInterval intervalSS = [[NSDate date] timeIntervalSinceDate:foundDate];
    NSInteger mm =  intervalSS/60;
    if (mm >= 60) {
        mm = mm/60;
        self.dataLabel.text = [NSString stringWithFormat:@"%ld小时以前",mm];
    } else {
        self.dataLabel.text = [NSString stringWithFormat:@"%ld分钟以前",mm];
    }
  
    
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
    
    [self.infoImgView sd_setImageWithURL:[NSURL URLWithString:_artieleModel.mes]];
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
