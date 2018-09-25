//
//  文件名: ReceiveMessage.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2017/12/19.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

open class ReceiveMessage: ReceiveBase {
    
    public var msg: String?
    public var info: String?
    public var data: Dictionary<String, Any>?
    
    public var isSucceed: Bool {
        get {
            return msg == "success"
        }
    }
    
    open override var description: String {
        return "msg:\(String(describing: msg)), info:\(String(describing: info)), data:\(String(describing: data))"
    }
    
}
