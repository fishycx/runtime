//
//  文件名: RequestGroup.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2017/12/20.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit

open class RequestGroup<T: ReceiveBase>: RequestURLModel, ReceiveGroupDelegate {
    
    public var entitys: [T] = []
    
    private var receiveGroup: RequestGroupPage = RequestGroupPage()
    
    var urlHOST: String = ""
    
    override init() {
        super.init()
        receiveGroup.receiveGroupDelegate = self
        json["rows"] = receiveGroup.requestRows
        json["page"] = receiveGroup.page
    }
    
    public func reloadData(refreshUI: RefreshUI?) {
        receiveGroup.reload()
        request(refreshUI: refreshUI)
    }
    
    public func loadMore(refreshUI: RefreshUI?) {
        request(refreshUI: refreshUI)
    }
    
    private func request(refreshUI: RefreshUI?) {
        if receiveGroup.isCanLoad() {
            requestURL(urlHOST, json: json, refreshUI: refreshUI)
            receiveGroup.page = receiveGroup.page + 1
        }
    }
    
    override public func requestSucceed(obj: Any?) {
        receiveGroup.createObj(dic: obj)
        BTSPrint("requestSucceed---------->>>>>>>>>>>\(String(describing: obj))")
    }
    
    func didSetEntitys(_ aEntitys: [Dictionary<String, Any>]) {
        var myEntitys: [T] = []
        for dic in aEntitys {
            let entity = T.init()
            entity.createObj(dic: dic)
            myEntitys.append(entity)
        }
        
        
        entitys = myEntitys
    }
    
    func pageDidChanged(_ page: Int) {
        json["page"] = receiveGroup.page
    }
    
}
