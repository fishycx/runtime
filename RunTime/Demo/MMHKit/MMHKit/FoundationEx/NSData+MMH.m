//
//  NSData+MMH.m
//  MMHKitDemo
//
//  Created by DevilSun on 16/7/12.
//  Copyright © 2016年 mamahao. All rights reserved.
//

#import "NSData+MMH.h"
#include <CommonCrypto/CommonCrypto.h>

@implementation NSData (MMH)


- (NSString *)md5String {
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)sha1String {
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, result);
    NSMutableString *hash = [NSMutableString
                             stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", result[i]];
    }
    return hash;
}

- (NSString *)base64EncodedString {
    NSString* encodeString = [self base64EncodedStringWithOptions:0];
    return encodeString;
}

+ (NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString {
    NSData* decodedData = [[NSData alloc] initWithBase64EncodedString:base64EncodedString options:0];
    return decodedData;
}

+ (NSData *)dataNamed:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@""];
    if (!path) return nil;
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}


@end


