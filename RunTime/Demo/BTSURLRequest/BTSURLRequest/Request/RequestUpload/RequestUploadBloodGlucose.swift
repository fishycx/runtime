//
//  文件名: RequestUploadBloodGlucose.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2018/1/29.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

public protocol BloodGlucoseData {
    var serverBloodGlucoseBloodSugar: String? { get }
    var serverBloodGlucoseTimeType: String? { get }
    var serverBloodGlucoseTestTesult: String? { get }
}

open class RequestUploadBloodGlucose: RequestURLModel {
    
    public class func requestUpload(healthUserData: HealthUserData, dataModel: BloodGlucoseData, recordTime: String, refreshUI: RefreshUI?) {
        RequestUploadBloodGlucose().requestUpload(healthUserData: healthUserData, dataModel: dataModel, recordTime: recordTime, refreshUI: refreshUI)
    }
    
    func requestUpload(healthUserData: HealthUserData, dataModel: BloodGlucoseData, recordTime: String, refreshUI: RefreshUI?) {
        
        json["accountId"] = healthUserData.healthUserAccountID
        json["baseUserInfoId"] = healthUserData.healthUserBaseUserInfoID
        json["baseUserFamilyId"] = healthUserData.healthUserBaseUserFamilyID
        json["roleName"] = healthUserData.healthUserRoleName
        json["bloodSugar"] = dataModel.serverBloodGlucoseBloodSugar
        json["timeType"] = dataModel.serverBloodGlucoseTimeType
        json["testTesult"] = dataModel.serverBloodGlucoseTestTesult
        json["recordTime"] = recordTime
        
        requestURL(ServiceURLModel.uploadBloodSugar, json: json, refreshUI: refreshUI)
    }
    
}
