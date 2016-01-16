//
//  MusicViewCell.m
//  AppHome-Demo
//
//  Created by wxiao on 16/1/12.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import "MusicViewCell.h"
#import "MusicModel.h"
#import <SDWebImageDownloader.h>
#import <SDWebImageManager.h>

@interface MusicViewCell ()
@property (nonatomic, strong) CALayer			*imageLayer;
@property (nonatomic, strong) CALayer			*userLayer;
@property (nonatomic, strong) CATextLayer		*titleLayer;
@end

@implementation MusicViewCell

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		self.imageLayer					= [CALayer layer];
		self.imageLayer.bounds			= CGRectMake(0, 0, frame.size.width, frame.size.width);
		self.imageLayer.anchorPoint		= CGPointMake(0, 0);
		self.imageLayer.backgroundColor = [UIColor whiteColor].CGColor;
		[self.contentView.layer addSublayer:self.imageLayer];
		
		self.userLayer					= [CALayer layer];
		self.userLayer.frame			= CGRectMake(frame.size.width * 0.375, frame.size.width * 0.75,
													 frame.size.width * 0.25, frame.size.width * 0.25);
		self.userLayer.backgroundColor  = [UIColor blackColor].CGColor;
		[self.contentView.layer addSublayer:self.userLayer];
		
		self.titleLayer					= [CATextLayer layer];
		self.titleLayer.frame			= CGRectMake(0, frame.size.width, frame.size.width, 25);
		self.titleLayer.alignmentMode	= kCAAlignmentCenter;
		self.titleLayer.backgroundColor = [UIColor yellowColor].CGColor;
		self.titleLayer.truncationMode	= kCATruncationEnd;						//
		[self.contentView.layer addSublayer:self.titleLayer];
		
//		self.imageLayer.cornerRadius	= 5;
//		self.imageLayer.masksToBounds	= YES;
//		self.imageLayer.shouldRasterize = YES;
//		self.userLayer.cornerRadius		= frame.size.width * 0.125;
//		self.userLayer.masksToBounds	= YES;
//		self.userLayer.shouldRasterize	= YES;
	}
	return self;
}

- (void)setModel:(MusicModel *)model {
	_model = model;
	
	[[SDWebImageDownloader sharedDownloader]
	 downloadImageWithURL:[NSURL URLWithString:model.music_coverimg]
	 options:SDWebImageDownloaderUseNSURLCache
	 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
	 } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
		 
		 self.imageLayer.contents = (id)image.CGImage;
	 }];
	
	[[SDWebImageDownloader sharedDownloader]
	 downloadImageWithURL:[NSURL URLWithString:model.user[@"user_img"]]
	 options:SDWebImageDownloaderUseNSURLCache
	 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
	 } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
		 
		 self.userLayer.contents = (id)image.CGImage;
	 }];
	
	NSDictionary *titleAttrs = @{
								 NSFontAttributeName : [UIFont systemFontOfSize:14.0f],
								 NSForegroundColorAttributeName : [UIColor blackColor],
								 };
	self.titleLayer.string = [[NSAttributedString alloc] initWithString:(NSString *)model.music_name attributes:titleAttrs];
	
}


@end
