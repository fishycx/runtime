//
//  文件名: RequestGetUserInfo.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2017/12/20.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

class RequestGetUserInfo: RequestURLModel {
    
    func request(accountId: String?, refreshUI: RefreshUI?) {
        guard let accountId = accountId else { return }
        requestURL(ServiceURLModel.getUserInfo, json: ["accountId": accountId], refreshUI: refreshUI)
    }
    
}
