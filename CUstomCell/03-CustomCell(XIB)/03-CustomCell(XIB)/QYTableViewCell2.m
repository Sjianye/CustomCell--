//
//  QYTableViewCell2.m
//  03-CustomCell(XIB)
//
//  Created by qingyun on 16/5/16.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "QYTableViewCell2.h"
#import "QYModel.h"
@interface QYTableViewCell2 ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation QYTableViewCell2


-(void)setModel:(QYModel *)model{
    _model = model;
    
    //设置子视图属性
    _iconView.image = [UIImage imageNamed:model.icon];
    _label.text = [NSString stringWithFormat:@"%@说:%@",model.name,model.desc];
    
    self.backgroundColor = [UIColor orangeColor];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
