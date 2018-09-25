//
//  文件名: RequestGetCode.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2017/12/18.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

class RequestGetCode: RequestURLModel {
    
    func request(mobile: String?, refreshUI: RefreshUI?) {
        guard let mobile = mobile else { return }
        requestURL(ServiceURLModel.getCode, json: ["mobile" : mobile], refreshUI: refreshUI)
    }
    
    override func requestSucceed(obj: Any?) {
        super.requestSucceed(obj: obj)
    }
    
}
