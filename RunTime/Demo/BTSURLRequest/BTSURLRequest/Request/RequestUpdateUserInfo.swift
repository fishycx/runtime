//
//  文件名: RequestUpdateUserInfo.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2017/12/23.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

@objc public protocol NuresUserData {
    var baseUserInfoId: String? { get }
    var nickName: String? { get }
    var mobile: String? { get }
    var sex: String? { get }
    var birth: String? { get }
}

open class RequestUpdateUserInfo: RequestURLModel {
    
    func update(userData: NuresUserData, refreshUI: RefreshUI?) {
        
        json["baseUserInfoId"] = userData.baseUserInfoId
        json["nickName"] = userData.nickName
        json["mobile"] = userData.mobile
        json["birth"] = userData.birth
        
        if userData.sex == "男" {
            json["sex"] = "1"
        }
        else if userData.sex == "女" {
            json["sex"] = "2"
        }
        
        requestURL(ServiceURLModel.updateUserInfo, json: json, refreshUI: refreshUI)
    }
    
}
