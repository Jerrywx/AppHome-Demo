//
//  CycleModel.m
//  AppHome-Demo
//
//  Created by wxiao on 16/1/12.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import "CycleModel.h"
#import "NSObject+Extension.h"

@implementation CycleModel

- (void)loadDataFinished:(void(^)(NSArray *modelList, NSArray *modelList2, NSArray *modelList3))finished {
	
	NSString *path	= [[NSBundle mainBundle] pathForResource:@"cycl.json" ofType:nil];
	NSData *data	= [NSData dataWithContentsOfFile:path];
	id jsonObject	= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

	NSArray *datas	= jsonObject[@"result"][@"list_res_head"];
	NSArray *datas2 = jsonObject[@"result"][@"list_res_boot"];
	NSArray *datas3 = jsonObject[@"result"][@"list_res_video"];
	NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:datas.count];
	NSMutableArray *arrayM2 = [NSMutableArray arrayWithCapacity:datas2.count];
	NSMutableArray *arrayM3 = [NSMutableArray arrayWithCapacity:datas2.count];
	
	for (NSDictionary *dict in datas) {
		CycleModel *model = [[CycleModel alloc] init];
		for (NSString *key in [CycleModel propertyList]) {
			NSString *value = dict[key];
			[model setValue:value forKey:key];
		}
		[arrayM addObject:model];
	}
	for (NSDictionary *dict in datas2) {
		CycleModel *model = [[CycleModel alloc] init];
		for (NSString *key in [CycleModel propertyList]) {
			NSString *value = dict[key];
			[model setValue:value forKey:key];
		}
		[arrayM2 addObject:model];
	}
	for (NSDictionary *dict in datas3) {
		CycleModel *model = [[CycleModel alloc] init];
		for (NSString *key in [CycleModel propertyList]) {
			NSString *value = dict[key];
			[model setValue:value forKey:key];
		}
		[arrayM3 addObject:model];
	}

	finished(arrayM, arrayM2, arrayM3);	
}

- (NSString *)description {
	NSArray *properties = [CycleModel propertyList];
	NSDictionary *dict = [self dictionaryWithValuesForKeys:properties];
	return [NSString stringWithFormat:@"<%@: %p> %@", self.class, self, dict];
}


@end
