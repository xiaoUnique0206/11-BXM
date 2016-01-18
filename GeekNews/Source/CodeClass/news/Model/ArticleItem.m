//
//  ArticleItem.m
//  xnlParse
//
//  Created by fanyanqing on 16/1/16.
//  Copyright © 2016年 tusm. All rights reserved.
//

#import "ArticleItem.h"

@implementation ArticleItem

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"Medias"])
    {
        self.mes = [value objectForKey:@"Media"];
//        NSDictionary *dict = self.mes[self.mes.count-1];
//        self.picUrl = [dict objectForKey:@"Url"];
    }
    else if ([key isEqualToString:@"Tags"])
    {
        NSDictionary *dict = value;
        self.tags = [dict objectForKey:@"Tag"];
    }
    
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"title:%@ type:%@ locale:%@ medias:%@",_Title,_Locale,_Type,_mes];
}
@end
