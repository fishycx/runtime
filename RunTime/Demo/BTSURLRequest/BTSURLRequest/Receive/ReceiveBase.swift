//
//  文件名: BaseModel.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2017/12/19.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

/**
 使用@objcMembers关键字是为了使用oc的kvc，
 swift4.0开始，继承NSObject的不在默认全部bridge到oc。
 */
@objcMembers open class ReceiveBase: NSObject {
    
    required override public init() {
        super.init()
    }
    
    public convenience init(obj: Any?) {
        self.init()
        
        createObj(dic: obj)
        
    }
    
}
