//
//  MusicManCell.m
//  AppHome-Demo
//
//  Created by wxiao on 16/1/12.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import "MusicManCell.h"
#import "MusicManModel.h"
#import <SDWebImageDownloader.h>
#import <SDWebImageManager.h>

@interface MusicManCell ()
@property (nonatomic, strong) CALayer			*imageLayer;
@property (nonatomic, strong) CATextLayer		*titleLayer;
@end

@implementation MusicManCell

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		self.imageLayer					= [CALayer layer];
		self.imageLayer.bounds			= CGRectMake(0, 0, frame.size.width, frame.size.width);
		self.imageLayer.anchorPoint		= CGPointMake(0, 0);
		self.imageLayer.backgroundColor = [UIColor whiteColor].CGColor;
		[self.contentView.layer addSublayer:self.imageLayer];
		
		self.titleLayer					= [CATextLayer layer];
		self.titleLayer.frame			= CGRectMake(0, frame.size.width, frame.size.width, 25);
		self.titleLayer.alignmentMode	= kCAAlignmentCenter;
		self.titleLayer.backgroundColor = [UIColor yellowColor].CGColor;
		self.titleLayer.truncationMode	= kCATruncationEnd;						//
		[self.contentView.layer addSublayer:self.titleLayer];
	}
	return self;
}

- (void)setModel:(MusicManModel *)model {
	_model = model;

	[[SDWebImageDownloader sharedDownloader]
							downloadImageWithURL:[NSURL URLWithString:model.user_img]
										 options:SDWebImageDownloaderUseNSURLCache
										progress:^(NSInteger receivedSize, NSInteger expectedSize) {
									 } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {

										 self.imageLayer.contents = (id)image.CGImage;
									 }];
	self.imageLayer.shouldRasterize = YES;
	
	
	NSDictionary *titleAttrs = @{
								 NSFontAttributeName : [UIFont systemFontOfSize:14.0f],
								 NSForegroundColorAttributeName : [UIColor blackColor],
								 };
	self.titleLayer.string = [[NSAttributedString alloc] initWithString:(NSString *)model.user_nick attributes:titleAttrs];
	
}

@end
