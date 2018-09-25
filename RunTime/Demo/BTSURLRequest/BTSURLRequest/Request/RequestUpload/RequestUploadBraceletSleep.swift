//
//  文件名: RequestUploadBraceletSleep.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司
//  日期: 2018/4/3.
//
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

public protocol BraceletSleepData {
    //日期 yyyy-MM-dd
    var braceletSleepDate: String? { get }
    //全天睡眠 （单位 分钟）
    var braceletSleepAllDaySleep: String? { get }
    //全天深睡（单位 分钟）
    var braceletSleepAllDayDeepSleep: String? { get }
    //全天浅睡（单位 分钟）
    var braceletSleepAllDayLightSleep: String? { get }
    //昨晚入睡（时间 HH:mm）
    var braceletSleepFallAsleepTime: String? { get }
    //今天醒来（时间 HH:mm）
    var braceletSleepWakeTime: String? { get }
    //清醒时长（单位 分钟）
    var braceletSleepWakeLength: String? { get }
}

public class RequestUploadBraceletSleep: RequestURLModel {
    
    public class func requestUpload(healthUserData: HealthUserData, dataModel: BraceletSleepData, refreshUI: RefreshUI?) {
        RequestUploadBraceletSleep().requestUpload(healthUserData: healthUserData, dataModel: dataModel, refreshUI: refreshUI)
    }
    
    func requestUpload(healthUserData: HealthUserData, dataModel: BraceletSleepData, refreshUI: RefreshUI?) {
        
        json["accountId"] = healthUserData.healthUserAccountID
        json["baseUserInfoId"] = healthUserData.healthUserBaseUserInfoID
        json["baseUserFamilyId"] = healthUserData.healthUserBaseUserFamilyID
        json["roleName"] = healthUserData.healthUserRoleName
        json["allDaySleep"] = dataModel.braceletSleepAllDaySleep
        json["allDayDeepSleep"] = dataModel.braceletSleepAllDayDeepSleep
        json["allDayLightSleep"] = dataModel.braceletSleepAllDayLightSleep
        json["fallAsleepTime"] = dataModel.braceletSleepFallAsleepTime
        json["date"] = dataModel.braceletSleepDate
        json["wakeTime"] = dataModel.braceletSleepWakeTime
        json["wakeLength"] = dataModel.braceletSleepWakeLength
        
        requestURL(ServiceURLModel.uploadSleepData, json: json, refreshUI: refreshUI)
    }
    
}
