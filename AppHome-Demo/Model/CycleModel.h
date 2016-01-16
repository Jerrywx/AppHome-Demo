//
//  CycleModel.h
//  AppHome-Demo
//
//  Created by wxiao on 16/1/12.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CycleModel : NSObject

/*
	res_img = http://www.inmoe.cn/assets/uploads/file/20160104/2016010414191454.jpg;
	res_title = 江左有梅郎，音萌有逗编;
	res_url = http://www.inmoe.cn/assets/video/xkx/;
 */
@property (nonatomic, copy) NSString *res_img;
@property (nonatomic, copy) NSString *res_title;
@property (nonatomic, copy) NSString *res_url;

- (void)loadDataFinished:(void(^)(NSArray *modelList, NSArray *modelList2, NSArray *modelList3))finished;

@end
