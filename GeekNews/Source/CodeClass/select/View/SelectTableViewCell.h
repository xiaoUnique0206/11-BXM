//
//  SelectTableViewCell.h
//  GeekNews
//
//  Created by 宋庆亮 on 16/1/19.
//  Copyright © 2016年 tusm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *titleImaView;
@property (weak, nonatomic) IBOutlet UIImageView *provideImaView;
@property (weak, nonatomic) IBOutlet UILabel *provideLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property(nonatomic,strong)Select *select;
@end
