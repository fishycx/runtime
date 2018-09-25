//
//  MMHKeychain.m
//  Mamahao
//
//  Created by Louis Zhu on 15/9/25.
//  Copyright (c) 2015年 Mamahao. All rights reserved.
//

#import "MMHKeychain.h"

@implementation MMHKeychain

+ (NSMutableDictionary *)keychainQueryForKey:(NSString *)key {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge id)kSecClassGenericPassword,(__bridge id)kSecClass,
            key, (__bridge id)kSecAttrService,
            key, (__bridge id)kSecAttrAccount,
            (__bridge id)kSecAttrAccessibleAfterFirstUnlock,(__bridge id)kSecAttrAccessible,
            nil];
}


+ (void)saveData:(id)data forKey:(NSString *)key {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self keychainQueryForKey:key];
    //Delete old item before add new item
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((__bridge CFDictionaryRef)keychainQuery, NULL);
}


+ (id)dataForKey:(NSString *)key {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self keychainQueryForKey:key];
    //Configure the search setting
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keychainQuery setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    [keychainQuery setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
//            NSLog(@"Unarchive of %@ failed: %@", key, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}


+ (void)deleteDataForKey:(NSString *)key {
    NSMutableDictionary *keychainQuery = [self keychainQueryForKey:key];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
}


@end


@implementation UIDevice (MamHao)


+ (NSString *)deviceID
{
    static NSString *MMHKeychainDeviceID = @"com.mamahao.keychain.deviceid";
    
    NSString *deviceID = (NSString *)[MMHKeychain dataForKey:MMHKeychainDeviceID];
    if (deviceID.length != 0) {
        return deviceID;
    }
    
    NSUUID *identifierForVendor = [[UIDevice currentDevice] identifierForVendor];
    if (identifierForVendor) {
        deviceID = [[identifierForVendor UUIDString] stringByReplacingOccurrencesOfString:@"-" withString:@""];
        [MMHKeychain saveData:deviceID forKey:MMHKeychainDeviceID];
        return deviceID;
    }
    
    return @"";
}


@end
