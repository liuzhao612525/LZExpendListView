//
//  LZExpendSectionView.m
//  LZExpendListView
//
//  Created by liuzhao on 16/5/14.
//  Copyright © 2016年 liuzhao. All rights reserved.
//

#import "LZExpendSectionView.h"

@interface LZExpendSectionView ()
@property (strong, nonatomic) UILabel *secTitleLabel;
@end
@implementation LZExpendSectionView
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self initialize];
    }
    return self;
    
}

- (void)initialize
{
    self.contentView.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1.0];
    
    self.secTitleLabel = [[UILabel alloc] init];
    self.secTitleLabel.textColor = [UIColor blackColor];
    self.secTitleLabel.text = self.title;
    [self addSubview:self.secTitleLabel];
    
    
    self.leftImgView = [[UIImageView alloc]init];
    [self.leftImgView setImage:[UIImage imageNamed:@"ico_list"]];
    [self addSubview:self.leftImgView];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.secTitleLabel.frame = CGRectMake(30, 0, self.bounds.size.width - 30, 55);
    self.leftImgView.frame = CGRectMake(10, (55-16)/2, 14, 16);
}

- (void)setTitle:(NSString *)title{
    _title = title;
    self.secTitleLabel.text = self.title;
}

@end
