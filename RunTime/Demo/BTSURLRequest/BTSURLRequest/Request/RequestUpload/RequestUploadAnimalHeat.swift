//
//  文件名: RequestUploadAnimalHeat.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2018/1/29.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

@objc public protocol AnimalHeatData {
    var animalHeatTemperature: String? { get }
    var animalHeatTestTesult: String? { get }
}

open class RequestUploadAnimalHeat: RequestURLModel {
    
    public class func requestUpload(healthUserData: HealthUserData, dataModel: AnimalHeatData, recordTime: String?, refreshUI: RefreshUI?) {
        RequestUploadAnimalHeat().requestUpload(healthUserData: healthUserData, dataModel: dataModel, recordTime: recordTime, refreshUI: refreshUI)
    }
    
    func requestUpload(healthUserData: HealthUserData, dataModel: AnimalHeatData, recordTime: String?, refreshUI: RefreshUI?) {
        
        json["accountId"] = healthUserData.healthUserAccountID
        json["baseUserInfoId"] = healthUserData.healthUserBaseUserInfoID
        json["baseUserFamilyId"] = healthUserData.healthUserBaseUserFamilyID
        json["roleName"] = healthUserData.healthUserRoleName
        json["temperature"] = dataModel.animalHeatTemperature
        json["testTesult"] = dataModel.animalHeatTestTesult
        json["recordTime"] = recordTime
        
        requestURL(ServiceURLModel.uploadTemperature, json: json, refreshUI: refreshUI)
    }
    
}
