//
//  文件名: RequestUploadBraceletStep.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司
//  日期: 2018/4/2.
//
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

public protocol BraceletStepData {
    var braceletStepDateTime: String? { get }
    var braceletStepWalkSteps: String? { get }
    //时长  （单位 分）
    var braceletStepWalkDuration: String? { get }
    //距离  （单位 米）
    var braceletStepWalkDistances: String? { get }
    //卡路里  （单位 千卡）
    var braceletStepWalkCalories: String? { get }
}

public class RequestUploadBraceletStep: RequestURLModel {
    
    public class func requestUpload(healthUserData: HealthUserData, dataModel: BraceletStepData, refreshUI: RefreshUI?) {
        RequestUploadBraceletStep().requestUpload(healthUserData: healthUserData, dataModel: dataModel, refreshUI: refreshUI)
    }
    
    func requestUpload(healthUserData: HealthUserData, dataModel: BraceletStepData, refreshUI: RefreshUI?) {
        
        json["accountId"] = healthUserData.healthUserAccountID
        json["baseUserInfoId"] = healthUserData.healthUserBaseUserInfoID
        json["baseUserFamilyId"] = healthUserData.healthUserBaseUserFamilyID
        json["roleName"] = healthUserData.healthUserRoleName
        json["walkSteps"] = dataModel.braceletStepWalkSteps
        json["walkDuration"] = dataModel.braceletStepWalkDuration
        json["walkDistances"] = dataModel.braceletStepWalkDistances
        json["walkCalories"] = dataModel.braceletStepWalkCalories
        json["dateTime"] = dataModel.braceletStepDateTime
        
        requestURL(ServiceURLModel.uploadWalkData, json: json, refreshUI: refreshUI)
    }
    
}
