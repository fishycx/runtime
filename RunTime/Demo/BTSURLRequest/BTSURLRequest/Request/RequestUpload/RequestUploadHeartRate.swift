//
//  文件名: RequestUploadHeartRate.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2018/1/29.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

@objc public protocol HeartRateData {
    var rate: String? { get }
}

open class RequestUploadHeartRate: RequestURLModel {
    
    public class func requestUpload(healthUserData: HealthUserData, dataModel: HeartRateData, recordTime: String, refreshUI: RefreshUI?) {
        RequestUploadHeartRate().requestUpload(healthUserData: healthUserData, dataModel: dataModel, recordTime: recordTime, refreshUI: refreshUI)
    }
    
    func requestUpload(healthUserData: HealthUserData, dataModel: HeartRateData, recordTime: String, refreshUI: RefreshUI?) {
        
        json["accountId"] = healthUserData.healthUserAccountID
        json["baseUserInfoId"] = healthUserData.healthUserBaseUserInfoID
        json["baseUserFamilyId"] = healthUserData.healthUserBaseUserFamilyID
        json["roleName"] = healthUserData.healthUserRoleName
        json["testTesult"] = dataModel.rate
        json["recordTime"] = recordTime
        json["dataUrl"] = ""
        
        requestURL(ServiceURLModel.uploadFhb, json: json, refreshUI: refreshUI)
    }
    
}
