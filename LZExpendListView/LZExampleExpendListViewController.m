//
//  LZExampleExpendListViewController.m
//  LZExpendListView
//
//  Created by liuzhao on 16/5/14.
//  Copyright © 2016年 liuzhao. All rights reserved.
//

#import "LZExampleExpendListViewController.h"

@interface LZExampleExpendListViewController ()
@property (strong, nonatomic) NSArray *array;
@end

@implementation LZExampleExpendListViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Expend";
    
    self.rowDataKey = @"rowData";
    self.array = @[
                   @{@"secTitle" : @"OneTitle" ,@"rowData" : @[@"aaa",@"bbb"]},
                   @{@"secTitle" : @"TwoTitle" ,@"rowData" : @[@"ccc",@"ddd" ,@"eee"]},
                   @{@"secTitle" : @"ThreeTitle" ,@"rowData" : @[@"fff"]},
                   @{@"secTitle" : @"FuorTitle" ,@"rowData" : @[@"ggg",@"hhhh" ,@"uuu" ,@"www" ,@"xxx"]},
                   ];
   
    self.data = [self.array mutableCopy];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSDictionary *rowDic = self.array[indexPath.section];
    NSArray *secArray = rowDic[@"rowData"];
    cell.textLabel.text = secArray[indexPath.row];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSDictionary *rowDic = self.array[section];
    self.headerTitle = rowDic[@"secTitle"];
    
    return [super tableView:tableView viewForHeaderInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
@end
