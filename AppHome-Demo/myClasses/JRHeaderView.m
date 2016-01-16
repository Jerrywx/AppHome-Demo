//
//  JRHeaderView.m
//  AppHome-Demo
//
//  Created by wxiao on 16/1/12.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import "JRHeaderView.h"
#import "JRLoopView.h"

@interface JRHeaderView() <JRLoopViewDataSource>
@property (nonatomic, strong) UIImageView		*headerImageView;
@property (nonatomic, assign) CGPoint			prePoint;
@property (nonatomic, strong) JRLoopView		*loopView;
@end

@implementation JRHeaderView

- (id)initWithFrame:(CGRect)frame
	 headerImageURL:(NSString *)headerImageURL {
	
	if (self = [super initWithFrame:frame]) {
		self.backgroundColor = [UIColor clearColor];
		
//		_headerImageView				= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,frame.size.width, frame.size.height)];
//		_headerImageView.contentMode	= UIViewContentModeScaleToFill;
//		_headerImageView.image			= [UIImage imageNamed:@"aaa"];
//		[self addSubview:_headerImageView];
		
		self.loopView = [[JRLoopView alloc] initWithFrame:CGRectMake(0, 0,frame.size.width, frame.size.height)];
		self.loopView.dataSource = self;
		[self addSubview:self.loopView];
		
		self.clipsToBounds = YES;
	}
	return self;
}

-(void)willMoveToSuperview:(UIView *)newSuperview{

	[self.scrollView addObserver:self
					  forKeyPath:@"contentOffset"
						 options:(NSKeyValueObservingOptionNew)
						 context:Nil];

	self.scrollView.contentInset = UIEdgeInsetsMake(self.frame.size.height, 0 ,0, 0);
}


-(void)observeValueForKeyPath:(NSString *)keyPath
					 ofObject:(id)object
					   change:(NSDictionary *)change
					  context:(void *)context{
	CGPoint newOffset = [change[@"new"] CGPointValue];
	[self updateSubViewsWithScrollOffset:newOffset];
}

-(void)updateSubViewsWithScrollOffset:(CGPoint)newOffset{
	float destinaOffset = 10;
	float startChangeOffset = -self.scrollView.contentInset.top;
	newOffset = CGPointMake(newOffset.x, newOffset.y<startChangeOffset?startChangeOffset:(newOffset.y>destinaOffset?destinaOffset:newOffset.y));
	float newY = -newOffset.y - self.scrollView.contentInset.top;
	self.frame = CGRectMake(0, newY, self.frame.size.width, self.frame.size.height);
}

- (NSArray *)imageNumberOfJRLoop:(JRLoopView *)loopView {
	return @[
			 [UIImage imageNamed:@"01"],
			 [UIImage imageNamed:@"02"],
			 [UIImage imageNamed:@"03"],
			 [UIImage imageNamed:@"04"],
			 [UIImage imageNamed:@"05"]
			 ];
}

@end
