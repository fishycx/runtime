//
//  文件名: RequestGetHealthDataGroup.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2018/1/25.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import Foundation

public enum HealthDataType: Int {
    case animalHeat = 1
    case bloodPressure = 2
    case bloodGlucose = 3
    case fetusVoiceMeter = 4
    case weightScales = 7
    case bloodOxygen = 8
}

//请求保存在服务器上的健康记录
open class RequestGetHealthDataGroup: RequestGroup<ReceiveHealthData> {
    
    public override init() {
        super.init()
        
        urlHOST = ServiceURLModel.getHealthData
    }
    
    public func requestHealthDataGroup(healthUserData: HealthUserData, type: HealthDataType, year: String?, month: String?, refreshUI: RefreshUI?) {
        json["userAccountId"] = healthUserData.healthUserAccountID
        json["baseUserFamilyId"] = healthUserData.healthUserBaseUserFamilyID
        json["type"] = type.rawValue
        reloadData(refreshUI: refreshUI)
        
    }
    
    override func didSetEntitys(_ aEntitys: [Dictionary<String, Any>]) {
        super.didSetEntitys(aEntitys)
        //去重
        entitys = entitys.reduce([], { (entityGroup, data) -> [ReceiveHealthData] in
            if entityGroup.contains(where: { $0.id == data.id }) {
                return entityGroup
            } else {
                var group = entityGroup
                group.append(data)
                return group
            }
        })
    }
    
}
