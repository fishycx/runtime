//
//  文件名: RequestRegister.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2017/12/19.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

class RequestRegister: RequestURLModel {
    
    func request(mobile: String?, code: String?, password: String?, refreshUI: RefreshUI?) {
        guard let mobile = mobile else { return }
        guard let code = code else { return }
        guard let password = password else { return }
        requestURL(ServiceURLModel.register, json: ["mobile": mobile, "code": code, "password": password], refreshUI: refreshUI)
    }
    
    override func requestSucceed(obj: Any?) {
        super.requestSucceed(obj: obj)
    }
    
}
