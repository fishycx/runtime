//
//  NSURL+MMH.m
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/14.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import "NSURL+MMH.h"

@implementation NSURL (MMH)


- (NSDictionary *)queryParams {
    NSString *query = [self.query stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSArray *components = [query componentsSeparatedByString:@"&"];
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    for (NSString *component in components) {
        NSArray *pair = [component componentsSeparatedByString:@"="];
        if (pair.count < 2) {
            continue;
        }
        else if (pair.count > 2) {
            NSRange range = [component rangeOfString:@"="];
            NSString *key = [component substringToIndex:range.location];
            NSString *value = [component substringFromIndex:range.location+1];
            [parameters setObject:value forKey:key];
        }
        else {
            NSString *key = pair[0];
            NSString *value = pair[1];
            [parameters setObject:value forKey:key];
        }
    }
    return parameters;
}


@end
