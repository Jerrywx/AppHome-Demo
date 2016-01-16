//
//  MusicModel.h
//  AppHome-Demo
//
//  Created by wxiao on 16/1/12.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicModel : NSObject

/*
	music_composer = 银临;
	music_url = http://oss-cn-beijing.aliyuncs.com/music-appa1/20151228/2015091510291041.mp3;
	music_name = 雪舞;
	user = {
				user_img = http://www.inmoe.cn/assets/uploads/file/20151231/2015123116305038.jpg;
				user_sex = 2;
				is_attention = 0;
				user_nick = 银临;
				user_summary = 音乐人银临;
		};
	music_coverimg = http://www.inmoe.cn/assets/uploads/file/20160111/2016011117464645.png;
 }
 
 */
@property (nonatomic, copy)		NSString		*music_composer;
@property (nonatomic, copy)		NSString		*music_url;
@property (nonatomic, copy)		NSString		*music_name;
@property (nonatomic, strong)	NSDictionary	*user;
@property (nonatomic, copy)		NSString		*music_coverimg;

- (void)loadDataFinished:(void(^)(NSArray *modelList, NSArray *modelList2))finished;

@end
