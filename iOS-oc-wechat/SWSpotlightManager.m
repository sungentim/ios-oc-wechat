//
//  SWSpotLightManager.m
//  iOS-oc-wechat
//
//  Created by winter on 16/2/17.
//  Copyright © 2016年 wangsen. All rights reserved.
//

#import <CoreSpotlight/CoreSpotlight.h>
#import "SWSpotlightManager.h"

@implementation SWSpotlightManager

+ (void)saveData: (NSArray *)items {
    NSMutableArray *seachableItems = [NSMutableArray array];
    [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CSSearchableItemAttributeSet *attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:@"views"];
        // 标题
        attributeSet.title = [obj objectForKey:@"title"];
        // 描述
        attributeSet.contentDescription = [obj objectForKey:@"contentDescription"];
        // 图片
        attributeSet.thumbnailData = [obj objectForKey:@"thumbnailData"];
        
        //key 用作点击搜到的索引跳到应用用来识别点击哪一个条目的标识
        CSSearchableItem *item = [[CSSearchableItem alloc] initWithUniqueIdentifier:[obj objectForKey:@"key"] domainIdentifier:@"com.itrydo.wechat" attributeSet:attributeSet];
        [seachableItems addObject:item];
    }];
    
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:seachableItems completionHandler:^(NSError * __nullable error) {
        if (!error){
            NSLog(@"%@",error.localizedDescription);
        }
    }];
}

+ (void)testSpotlight {
    [self saveData:@[
                     [NSDictionary dictionaryWithObjectsAndKeys:@"title10", @"title", @"contentDescription1", @"contentDescription", @"Contact_icon_ContactTag", @"thumbnailData",@"key1", @"key", nil],
                     [NSDictionary dictionaryWithObjectsAndKeys:@"title20", @"title", @"contentDescription2", @"contentDescription", @"Contact_icon_ContactTag", @"thumbnailData",@"key2", @"key", nil],
                     [NSDictionary dictionaryWithObjectsAndKeys:@"title30", @"title", @"contentDescription3", @"contentDescription", @"Contact_icon_ContactTag", @"thumbnailData",@"key3", @"key", nil]
                     ]];
}

@end
