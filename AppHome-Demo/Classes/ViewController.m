//
//  ViewController.m
//  AppHome-Demo
//
//  Created by wxiao on 16/1/12.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import "ViewController.h"
#import "JRHeaderView.h"
#import "JRTableViewCell.h"
#import "JRTableViewCell2.h"
#import "MusicManModel.h"
#import "MusicModel.h"
#import "CycleModel.h"

#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView					*tableView;
@property (nonatomic, strong) JRHeaderView					*headView;
@property (nonatomic, strong) NSMutableArray				*mainCells;

@property (nonatomic, strong) MusicManModel					*Manmodel;
@property (nonatomic, strong) MusicModel					*musicModel;
@property (nonatomic, strong) CycleModel					*cycModel;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.automaticallyAdjustsScrollViewInsets = NO;
	[self setUpView];
	
	[self loadData];
}

- (void)loadData {

	self.Manmodel = [[MusicManModel alloc] init];
	[self.Manmodel loadDataFinished:^(NSArray *modelList) {
		JRTableViewCell *cell = [self.mainCells firstObject];
		cell.modelList = modelList;
		NSIndexPath *index = [NSIndexPath indexPathForRow:1 inSection:0];
		[self.tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationNone];
//		NSLog(@"=============== %zd", self.mainCells.count);
	}];
	
	self.musicModel = [[MusicModel alloc] init];
	[self.musicModel loadDataFinished:^(NSArray *modelList, NSArray *modelList2) {
		NSLog(@"count:%zd\n", modelList.count);
		NSLog(@"count:%zd\n", modelList2.count);
		
		for (int i = 1; i < 6; ++i) {
			
			JRTableViewCell2 *cell = self.mainCells[i];
			if (i % 2 == 0) {
				cell.modelList = modelList;
			} else {
				cell.modelList = modelList2;
			}
		}
		[self.tableView reloadData];
		
	}];
	
	self.cycModel = [[CycleModel alloc] init];
	[self.cycModel loadDataFinished:^(NSArray *modelList, NSArray *modelList2, NSArray *modelList3) {
		NSLog(@"A: %zd", modelList.count);
		NSLog(@"B: %zd", modelList2.count);
		NSLog(@"C: %zd", modelList3.count);
	}];
	
}

- (void)setUpView {
	JRHeaderView *headerView = [[JRHeaderView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_W, SCREEN_W * 0.5)
													headerImageURL:nil];
	
	self.view.backgroundColor	= [UIColor whiteColor];
	self.tableView				= [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - 64)
													 style:UITableViewStyleGrouped];
	self.tableView.dataSource	= self;
	self.tableView.delegate		= self;
	[self.view addSubview:self.tableView];
	
	headerView.viewController	= self;
	headerView.scrollView		= self.tableView;
	[self.view addSubview:headerView];
	
	self.mainCells = [NSMutableArray arrayWithCapacity:6];
	for (int i = 0; i < 6; i++) {
		if (i == 0) {
			JRTableViewCell *cell = [[JRTableViewCell alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 180)];
			[self.mainCells addObject:cell];
			continue;
		}
		JRTableViewCell2 *cell = [[JRTableViewCell2 alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 180)];
		[self.mainCells addObject:cell];
	}
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	self.view.frame = CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64);
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	
	if (section == 4) {
		return 1;
	}
	return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	if (indexPath.row == 0) {
		UITableViewCell *cell = [[UITableViewCell alloc] init];
		[cell.textLabel setText:@"text Label"];
		return cell;
	}

//	JRTableViewCell *cell = [[JRTableViewCell alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 120)];
//	return cell;
//	----------------------
	return self.mainCells[indexPath.section];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	NSLog(@"----- %@", indexPath);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (indexPath.row == 1) {
		return 180;
	}
	return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
	return 5.0;
}


@end





