//
//  LZExpendSectionView.h
//  LZExpendListView
//
//  Created by liuzhao on 16/5/14.
//  Copyright © 2016年 liuzhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZExpendSectionView : UITableViewHeaderFooterView
@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) UIImageView *leftImgView;
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;
@end
