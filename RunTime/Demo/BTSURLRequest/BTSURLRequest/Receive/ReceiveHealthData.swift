//
//  文件名: ReceiveHealthData.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2018/1/26.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

open class ReceiveHealthData: ReceiveBase {
    /**
     用户相关数据
     */
    public var createTime: String?
    public var fAccountId: String?
    public var fFamilyId: String?
    public var fUserId: String?
    public var id: String?
    public var recordTime: String?
    public var roleName: String?
    public var result: String?
    
    /**
     血压的数据
     */
    public var diastole: String?
    public var pulse: String?
    public var shirk: String?
    /**
     额温枪的数据
     */
    public var temperature: String?
    /**
     血糖的数据
     */
    public var bloodSugar: String?
    //0餐前1餐后
    public var timeType: String?
    /**
     胎心仪的数据
     */
    public var heartRate: String?
    /**
     成长秤的数据
     */
    public var height: String?
    public var weight: String?
    public var dateTime: String?
    public var testResult: String?
    /**
     血氧的数据
     */
    public var bloodOxygen: String?
    
    open override var description: String {
        return debugDescription
    }
    
    open override var debugDescription: String {
        return "id:\(id ?? "").recordTime:\(recordTime ?? "").roleName:\(roleName ?? "")"
    }
}

extension ReceiveHealthData: AnimalHeatData {
    public var animalHeatTemperature: String? {
        return temperature
    }
    
    public var animalHeatTestTesult: String? {
        return result
    }
}
