//
//  文件名: ServiceURLModel.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2017/12/17.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

public struct ServiceURLModel {
    //对域名进行修改,默认域名为："http://login.lcc.so"
    public static var urlHead: String! {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "BTSServiceURLModel")
        }
        get {
            return UserDefaults.standard.string(forKey: "BTSServiceURLModel") ?? "http://login.lcc.so"
        }
    }
    static let token = "myS1gnatrue2017gO0dB0y4svr12o2503371"
    static let getCode = "/appService/getCode"
    static let register = "/appService/registOfUser"
    static let login = "/appService/login"
    static let getUserInfo = "/appService/getSelfInfo"
    static let getDepartmentgroup = "/appService/departMentList"
    static let getDoctorGroup = "/appService/doctorList"
    static let getUserConsultationList = "/appService/userConsultationList"
    static let getSystemMessage = "/appService/notifyList"
    static let updateUserInfo = "/appService/uploadUserInfo"
    static let getHealthData = "/healthService/queryHealthData"
    static let uploadBloodPressure = "/healthService/uploadBloodPressure"
    static let uploadTemperature = "/healthService/uploadTemperature"
    static let uploadBloodSugar = "/healthService/uploadBloodSugar"
    static let uploadFhb = "/healthService/uploadFhb"
    static let uploadGrowUpData = "/healthService/uploadGrowUpData"
    static let uploadWalkData = "/healthService/uploadWalkData"
    static let uploadSleepData = "/healthService/uploadSleepData"
    static let uploadBloodOxygen = "/healthService/uploadBloodOxygen"
}
