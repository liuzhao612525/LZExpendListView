//
//  LZExpendTableViewController.m
//  LZExpendListView
//
//  Created by liuzhao on 16/5/14.
//  Copyright © 2016年 liuzhao. All rights reserved.
//

#import "LZExpendTableViewController.h"
#import <objc/runtime.h>
char* const isOpen = "isOpen";
char* const sectionKey = "sectionKey";
#define sectionIdentifer @"sectionIdentifer"

@interface LZExpendTableViewController ()

@end

@implementation LZExpendTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self setupTabView];
}

- (void)setData:(NSMutableArray *)data{
    _data = data;
    [self.tableView reloadData];
}

- (void)setupTabView {
    self.view.backgroundColor = [UIColor whiteColor];
    //[self initTable];
}
-(void)initTable{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
}

#pragma mark -
#pragma mark - UITableViewDataSource UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *subData = self.data[section];
    NSNumber *open =  objc_getAssociatedObject(subData,isOpen);
    if ([open  isEqual: @(1)]) {
        NSArray *rowData = subData[self.rowDataKey];
        return rowData.count;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    LZExpendSectionView * sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionIdentifer];
    if (sectionView == nil) {
        sectionView = [[LZExpendSectionView alloc] initWithReuseIdentifier:sectionIdentifer];
    }
    sectionView.tag = section;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [sectionView addGestureRecognizer:tap];
    id rowData = self.data[section];
    NSNumber *open =  objc_getAssociatedObject(rowData,isOpen);
    
    if ([open isEqual:@1]) {
        sectionView.leftImgView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        sectionView.leftImgView.transform = CGAffineTransformMakeRotation(0);
    }
    sectionView.title = self.headerTitle;
    objc_setAssociatedObject(sectionView, sectionKey, sectionView.leftImgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return sectionView;
}


#pragma mark
#pragma mark  -select cell


- (void)tap:(UITapGestureRecognizer *)sender
{
    NSInteger idx = sender.view.tag;
    id rowData = self.data[idx];
    NSNumber *open =  objc_getAssociatedObject(rowData,isOpen);
    UIImageView *imageView =  objc_getAssociatedObject(sender,sectionKey);
    if ([open isEqual:@1]) {
        objc_setAssociatedObject(rowData, isOpen, @(0), OBJC_ASSOCIATION_ASSIGN);
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
            imageView.transform = CGAffineTransformRotate(imageView.transform, -M_PI/2);
        } completion:^(BOOL finished) {
        }];
    }else if ([open isEqual:@0]){
        objc_setAssociatedObject(rowData, isOpen, @(1), OBJC_ASSOCIATION_ASSIGN);
        [UIView animateWithDuration:0.3 delay:0.0 options: UIViewAnimationOptionAllowUserInteraction |UIViewAnimationOptionCurveLinear animations:^{
            imageView.transform = CGAffineTransformRotate(imageView.transform, M_PI/2);
        } completion:^(BOOL finished) {
            
        }];
    }
    else{
        objc_setAssociatedObject(rowData, isOpen, @(1), OBJC_ASSOCIATION_ASSIGN);
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:idx] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 55;
}

@end
