//
//  MusicModel.m
//  AppHome-Demo
//
//  Created by wxiao on 16/1/12.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import "MusicModel.h"
#import "NSObject+Extension.h"

@implementation MusicModel

- (void)loadDataFinished:(void(^)(NSArray *modelList, NSArray *modelList2))finished {
	NSString *path	= [[NSBundle mainBundle] pathForResource:@"sing.json" ofType:nil];
	NSData *data	= [NSData dataWithContentsOfFile:path];
	id jsonObject	= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
	
	NSArray *datas	= jsonObject[@"result"][@"list_music51"];
	NSArray *datas2 = jsonObject[@"result"][@"list_music52"];
	NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:datas.count];
	NSMutableArray *arrayM2 = [NSMutableArray arrayWithCapacity:datas2.count];
	for (NSDictionary *dict in datas) {
		MusicModel *model = [[MusicModel alloc] init];
		for (NSString *key in [MusicModel propertyList]) {
			NSString *value = dict[key];
			[model setValue:value forKey:key];
		}
		[arrayM addObject:model];
	}
	for (NSDictionary *dict in datas2) {
		MusicModel *model = [[MusicModel alloc] init];
		for (NSString *key in [MusicModel propertyList]) {
			NSString *value = dict[key];
			[model setValue:value forKey:key];
		}
		[arrayM2 addObject:model];
	}
	finished(arrayM, arrayM2);
}

- (NSString *)description {
	
	NSArray *properties = [MusicModel propertyList];
	NSDictionary *dict = [self dictionaryWithValuesForKeys:properties];
	
	return [NSString stringWithFormat:@"<%@: %p> %@", self.class, self, dict];
}

@end
