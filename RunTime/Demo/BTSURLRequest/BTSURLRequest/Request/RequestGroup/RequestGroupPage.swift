//
//  文件名: RequestGroupPage.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2017/12/20.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

@objc protocol ReceiveGroupDelegate {
    @objc optional func didSetEntitys(_ aEntitys: [Dictionary<String, Any>])
    @objc optional func pageDidChanged(_ page: Int)
}

class RequestGroupPage: ReceiveBase {
    
    var page: Int = 1 {
        didSet {
            receiveGroupDelegate?.pageDidChanged?(page)
        }
    }
    var requestRows: String = "20"
    
    weak var receiveGroupDelegate: ReceiveGroupDelegate?
    
    var entitys: [Dictionary<String, Any>] = [] {
        didSet {
            receiveGroupDelegate?.didSetEntitys?(entitys)
        }
    }
    
    var total: String?
    var rows: [Dictionary<String, Any>]? {
        didSet {
            guard let rows = rows else { return }
            if needClean {
                entitys.removeAll()
                needClean = false
            }
            entitys.append(contentsOf: rows)
        }
    }
    
    required init() {
        super.init()
    }
    
    func isCanLoad() -> Bool {
        guard let total = total, let num = Int(total) else { return true }
        
        if Float(page) <= ceilf(Float(num) / 10) {
            return true
        }
        else {
            return false
        }
    }
    
    var needClean: Bool = false
    
    func reload() {
        page = 1
        total = nil
        needClean = true
    }
    
}
