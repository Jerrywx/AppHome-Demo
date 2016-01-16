//
//  JRHeaderView.h
//  AppHome-Demo
//
//  Created by wxiao on 16/1/12.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRHeaderView : UIView

@property (nonatomic, weak) UIViewController	*viewController;
@property (nonatomic, weak) UIScrollView		*scrollView;

- (id)initWithFrame:(CGRect)frame
	 headerImageURL:(NSString *)headerImageURL;

-(void)updateSubViewsWithScrollOffset:(CGPoint)newOffset;

@end
