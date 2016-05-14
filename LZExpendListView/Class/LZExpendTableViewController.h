//
//  LZExpendTableViewController.h
//  LZExpendListView
//
//  Created by liuzhao on 16/5/14.
//  Copyright © 2016年 liuzhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZExpendSectionView.h"
@interface LZExpendTableViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *data;
@property (copy, nonatomic) NSString *headerTitle;
@property (strong, nonatomic) NSString *rowDataKey;
@end
