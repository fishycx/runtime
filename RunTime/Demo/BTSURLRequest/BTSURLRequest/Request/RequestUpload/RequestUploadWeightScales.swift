//
//  文件名: RequestUploadWeightScales.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司
//  日期: 2018/3/25.
//
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

public protocol WeightScalesData {
    var serverWeightScalesHeight: String? { get }
    var serverWeightScalesWeight: String? { get }
}

open class RequestUploadWeightScales: RequestURLModel {
    
    public class func requestUpload(healthUserData: HealthUserData, dataModel: WeightScalesData, recordTime: String?, refreshUI: RefreshUI?) {
        RequestUploadWeightScales().requestUpload(healthUserData: healthUserData, dataModel: dataModel, recordTime: recordTime, refreshUI: refreshUI)
    }
    
    func requestUpload(healthUserData: HealthUserData, dataModel: WeightScalesData, recordTime: String?, refreshUI: RefreshUI?) {
        
        json["accountId"] = healthUserData.healthUserAccountID
        json["baseUserInfoId"] = healthUserData.healthUserBaseUserInfoID
        json["baseUserFamilyId"] = healthUserData.healthUserBaseUserFamilyID
        json["roleName"] = healthUserData.healthUserRoleName
        json["height"] = dataModel.serverWeightScalesHeight  ?? ""
        json["weight"] = dataModel.serverWeightScalesWeight ?? ""
        json["dateTime"] = recordTime
        
        requestURL(ServiceURLModel.uploadGrowUpData, json: json, refreshUI: refreshUI)
    }
    
}
