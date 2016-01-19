//
//  Select.m
//  GeekNews
//
//  Created by 宋庆亮 on 16/1/18.
//  Copyright © 2016年 tusm. All rights reserved.
//

#import "Select.h"

@implementation Select

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"Medias"]) {
        self.Url = [value objectForKey:@"Media"][@"Url"];
    }
}

- (NSString *)description{
    return [NSString stringWithFormat:@"====%@",_ProviderName];
}



@end
