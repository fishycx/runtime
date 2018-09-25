//
//  NSDictionary+MMH.m
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import "NSDictionary+MMH.h"
#import "NSObject+MMH.h"

@implementation NSDictionary (MMH)


- (BOOL)hasKey:(id)key {
    return [self.allKeys containsObject:key];
}

- (NSData *)plistData {
    return [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListBinaryFormat_v1_0 options:kNilOptions error:NULL];
}

- (NSString *)plistString {
    NSData *xmlData = [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListXMLFormat_v1_0 options:kNilOptions error:NULL];
    if (xmlData) return  [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
    return nil;
}

+ (NSDictionary *)dictionaryWithPlistData:(NSData *)plist {
    if (!plist) return nil;
    NSDictionary *dictionary = [NSPropertyListSerialization propertyListWithData:plist options:NSPropertyListImmutable format:NULL error:NULL];
    if ([dictionary isKindOfClass:[NSDictionary class]]) return dictionary;
    return nil;
}

+ (NSDictionary *)dictionaryWithPlistString:(NSString *)plist {
    if (!plist) return nil;
    NSData *data = [plist dataUsingEncoding:NSUTF8StringEncoding];
    return [self dictionaryWithPlistData:data];
}

- (NSInteger)integerForKey:(id)key {
    id object = self[key];
    if ([object respondsToSelector:@selector(integerValue)]) {
        return [object integerValue];
    }
    return 0;
}

- (double)doubleForKey:(NSString *)key {
    id object = self[key];
    if ([object respondsToSelector:@selector(doubleValue)]) {
        return [object doubleValue];
    }
    return 0.0;
}

- (BOOL)boolForKey:(NSString *)key {
    id object = self[key];
    if ([object respondsToSelector:@selector(boolValue)]) {
        return [object boolValue];
    }
    return NO;
}

- (NSString *)stringForKey:(id)key {
    id object = [self objectForKey:key];
    if (object == nil) {
        return @"";
    }
    if ([object isEqual:[NSNull null]]) {
        return @"";
    }
    if ([object isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%@", object];
    }
    if (![object isKindOfClass:[NSString class]]) {
        return [NSString stringWithFormat:@"%@", object];
    }
    return object;
}

- (NSDate *)dateForKey:(NSString *)key {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [formatter dateFromString:[self stringForKey:key]];
    return date;
}

- (NSDictionary *)wipeOffNilObject {
    NSMutableDictionary *mDict = [[NSMutableDictionary alloc] init];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj notNilOrEmpty]) {
            [mDict setObject:obj forKey:key];
        }
    }];
    return mDict;
}

- (NSString *)mmh_JSONString {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
    if (error) {
        NSLog(@"ERROR: cannot convert array to JSON string: %@", self);
        return nil;
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end


@implementation NSMutableDictionary (MMH)

+ (NSMutableDictionary *)dictionaryWithPlistData:(NSData *)plist {
    if (!plist) return nil;
    NSMutableDictionary *dictionary = [NSPropertyListSerialization propertyListWithData:plist options:NSPropertyListMutableContainersAndLeaves format:NULL error:NULL];
    if ([dictionary isKindOfClass:[NSMutableDictionary class]]) return dictionary;
    return nil;
}

+ (NSMutableDictionary *)dictionaryWithPlistString:(NSString *)plist {
    if (!plist) return nil;
    NSData *data = [plist dataUsingEncoding:NSUTF8StringEncoding];
    return [self dictionaryWithPlistData:data];
}

- (void)setNullableObject:(id)anObject forKey:(id <NSCopying>)aKey
{
    if (anObject == nil) {
        return;
    }
    if (![anObject notNilOrEmpty]) {
        return;
    }
    self[aKey] = anObject;
}


@end












