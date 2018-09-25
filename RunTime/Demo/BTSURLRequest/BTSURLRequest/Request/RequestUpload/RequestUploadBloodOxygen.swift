//
//  文件名: RequestUploadBloodOxygen.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司
//  日期: 2018/5/19.
//
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

public protocol BloodOxygenDataUpload {
    var bloodOxygenDataUploadRecordTime: String? { get }
    var bloodOxygenDataUploadBloodOxygen: String? { get }
    var bloodOxygenDataUploadHeartRate: String? { get }
    var bloodOxygenDataUploadResult: String? { get }
}

public class RequestUploadBloodOxygen: RequestURLModel {
    
    public class func requestUpload(healthUserData: HealthUserData, dataModel: BloodOxygenDataUpload, refreshUI: RefreshUI?) {
        RequestUploadBloodOxygen().requestUpload(healthUserData: healthUserData, dataModel: dataModel, refreshUI: refreshUI)
    }
    
    func requestUpload(healthUserData: HealthUserData, dataModel: BloodOxygenDataUpload, refreshUI: RefreshUI?) {
        
        json["accountId"] = healthUserData.healthUserAccountID
        json["baseUserInfoId"] = healthUserData.healthUserBaseUserInfoID
        json["baseUserFamilyId"] = healthUserData.healthUserBaseUserFamilyID
        json["roleName"] = healthUserData.healthUserRoleName
        json["recordTime"] = dataModel.bloodOxygenDataUploadRecordTime
        json["bloodOxygen"] = dataModel.bloodOxygenDataUploadBloodOxygen
        json["heartRate"] = dataModel.bloodOxygenDataUploadHeartRate
        json["result"] = dataModel.bloodOxygenDataUploadResult
        
        requestURL(ServiceURLModel.uploadBloodOxygen, json: json, refreshUI: refreshUI)
    }
    
}
