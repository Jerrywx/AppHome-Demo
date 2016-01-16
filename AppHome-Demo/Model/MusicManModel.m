//
//  MusicManModel.m
//  AppHome-Demo
//
//  Created by wxiao on 16/1/12.
//  Copyright © 2016年 wxiao. All rights reserved.
//

#import "MusicManModel.h"
#import "NSObject+Extension.h"

@implementation MusicManModel

- (void)loadDataFinished:(void(^)(NSArray *modelList))finished {
	NSString *path	= [[NSBundle mainBundle] pathForResource:@"man.json" ofType:nil];
	NSData *data	= [NSData dataWithContentsOfFile:path];
	id jsonObject	= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
	
	NSArray *datas = jsonObject[@"result"][@"list_user"];
	NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:datas.count];
	for (NSDictionary *dict in datas) {
		MusicManModel *model = [[MusicManModel alloc] init];
		for (NSString *key in [MusicManModel propertyList]) {
			NSString *value = dict[key];
			[model setValue:value forKey:key];
		}
		[arrayM addObject:model];
	}
//	NSLog(@"list:%@", arrayM);
	finished(arrayM);
}

- (NSString *)description {
	NSArray *properties = [MusicManModel propertyList];
	NSDictionary *dict = [self dictionaryWithValuesForKeys:properties];
	return [NSString stringWithFormat:@"<%@: %p> %@", self.class, self, dict];
}


@end
