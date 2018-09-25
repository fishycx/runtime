//
//  文件名: RequestUploadBloodPressure.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2018/1/26.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

public protocol ServerBloodPressureData {
    var serverBooldPressureShirk: String? { get }
    var serverBooldPressureDiastole: String? { get }
    var serverBooldPressurePulse: String?  { get }
    var serverBooldPressureTestTesult: String? { get }
    var serverBooldPressureRecordTime: String? { get }
}

public protocol HealthUserData {
    var healthUserAccountID: String? { get }
    var healthUserBaseUserInfoID: String?  { get }
    var healthUserBaseUserFamilyID: String? { get }
    var healthUserRoleName: String? { get }
}

//上传测量数据
open class RequestUploadBoolPressure: RequestURLModel {
    
    public class func requestUpload(healthUserData: HealthUserData, dataModel: ServerBloodPressureData, refreshUI: RefreshUI?) {
        RequestUploadBoolPressure().requestUpload(healthUserData: healthUserData, dataModel: dataModel, refreshUI: refreshUI)
    }
    
    func requestUpload(healthUserData: HealthUserData, dataModel: ServerBloodPressureData, refreshUI: RefreshUI?) {
        
        json["accountId"] = healthUserData.healthUserAccountID
        json["baseUserInfoId"] = healthUserData.healthUserBaseUserInfoID
        json["baseUserFamilyId"] = healthUserData.healthUserBaseUserFamilyID
        json["roleName"] = healthUserData.healthUserRoleName
        json["shirk"] = dataModel.serverBooldPressureShirk
        json["diastole"] = dataModel.serverBooldPressureDiastole
        json["pulse"] = dataModel.serverBooldPressurePulse
        json["testTesult"] = dataModel.serverBooldPressureTestTesult
        json["recordTime"] = dataModel.serverBooldPressureRecordTime
        
        requestURL(ServiceURLModel.uploadBloodPressure, json: json, refreshUI: refreshUI)
    }
    
}
