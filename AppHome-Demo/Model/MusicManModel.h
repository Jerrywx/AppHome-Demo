//
//  MusicManModel.h
//  AppHome-Demo
//
//  Created by wxiao on 16/1/12.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicManModel : NSObject
/*
	user_summary = 音乐人沐帮主;
	user_nick = 沐帮主;
	user_img = http://www.inmoe.cn/assets/uploads/file/20150928/2015092817055241.jpg;
 */

@property (nonatomic, copy) NSString *user_summary;
@property (nonatomic, copy) NSString *user_nick;
@property (nonatomic, copy) NSString *user_img;

- (void)loadDataFinished:(void(^)(NSArray *modelList))finished;

@end
