//
//  ArticleItem.h
//  xnlParse
//
//  Created by fanyanqing on 16/1/16.
//  Copyright © 2016年 tusm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleItem : NSObject
@property(strong,nonatomic)NSString *ArticleId;
@property(strong,nonatomic)NSString *Description;
@property(strong,nonatomic)NSString *EditoType;
@property(strong,nonatomic)NSString *Index;
@property(strong,nonatomic)NSString *Link;
@property(strong,nonatomic)NSString *Locale;
@property(strong,nonatomic)NSArray *mes;
@property(strong,nonatomic)NSString *MoodTotal;
@property(strong,nonatomic)NSString *MoodType;
@property(strong,nonatomic)NSString *Moods;
@property(strong,nonatomic)NSString *ProviderId;
@property(strong,nonatomic)NSString *ProviderName;
@property(strong,nonatomic)NSString *PubDate;
@property(strong,nonatomic)NSString *Rating;
@property(strong,nonatomic)NSString *ShareLink;
@property(strong,nonatomic)NSArray *tags;
@property(strong,nonatomic)NSString *Title;
@property(strong,nonatomic)NSString *Type;
@property(strong,nonatomic)NSString *text;
@property(strong,nonatomic)NSString *picUrl;
@end
