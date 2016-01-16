//
//  JRTableViewCell2.m
//  AppHome-Demo
//
//  Created by wxiao on 16/1/12.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import "JRTableViewCell2.h"
#import "MusicViewCell.h"

#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)

@interface JRTableViewCell2 () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView				*collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout	*layout;
@property (nonatomic, assign) CGRect						cellFrame;
@end

@implementation JRTableViewCell2

- (instancetype)initWithFrame:(CGRect)frame {
	
	if (self =[super initWithFrame:frame]) {
		self.cellFrame					= frame;
		self.collectionView				= [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:self.layout];
		self.collectionView.dataSource	= self;
		self.collectionView.delegate	= self;
		[self.collectionView registerClass:[MusicViewCell class] forCellWithReuseIdentifier:@"item"];
		[self.contentView addSubview:self.collectionView];
	}
	return self;
}

- (void)setModelList:(NSArray *)modelList {
	_modelList = modelList;
	[self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return self.modelList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	MusicViewCell *cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
	cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0)
										   green:((float)arc4random_uniform(256) / 255.0)
											blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
	cell.model = self.modelList[indexPath.row];
	return cell;
}

#pragma mark - 懒加载
- (UICollectionViewFlowLayout *)layout {
	if (_layout) {
		return _layout;
	}
	
	_layout						= [[UICollectionViewFlowLayout alloc] init];
	_layout.itemSize			= CGSizeMake(SCREEN_W * 0.27, self.cellFrame.size.height - 20);
	_layout.sectionInset		= UIEdgeInsetsMake(0, 10, 0, 10);
	_layout.scrollDirection		= UICollectionViewScrollDirectionHorizontal;
	_layout.minimumLineSpacing	= 10;
	_layout.minimumLineSpacing	= 10;
	
	return _layout;
}

@end
