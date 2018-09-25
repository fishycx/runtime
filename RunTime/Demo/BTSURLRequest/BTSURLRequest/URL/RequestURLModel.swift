//
//  文件名: RequestURLModel.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2017/12/17.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit
import Alamofire
import CryptoSwift

//URL 操作，上传，下载测量数据，健康档案
@objc public protocol RequestURLModelDelegate {
    @objc optional func requestSucceed(obj: Any?)
    @objc optional func requestFailed(error: Error?)
}

open class RequestURLModel {
    
    public typealias RefreshUI = ((_ requestModel: RequestURLModel) -> Void)
    public weak var requestURLModelDelegate: RequestURLModelDelegate?
    public var receiveMessage: ReceiveMessage = ReceiveMessage()
    
    var urlHead: String = ServiceURLModel.urlHead
    var json: [String: Any] = [:]
    
    public init() {
        requestURLModelDelegate = self
    }
    
    //把服务器需要的参数用字典的形式返回
    private func signatureParameter() -> Dictionary<String, Any> {
        
        var signature = ""
        let timestamp = String(describing: Int(Date().timeIntervalSince1970))
        let nonce = String(describing: arc4random())
        let token = ServiceURLModel.token
        
        let arr = [timestamp, nonce, token].sorted()
        
        for item in arr {
            signature.append(item)
        }
        signature = signature.getSha1()
        
        return ["signature": signature, "timestamp": timestamp, "nonce": nonce]
    }
    
    func requestURL(_ url: String,
                           json: [String: Any],
                           refreshUI: RefreshUI?,
                           method: HTTPMethod = HTTPMethod.post,
                           encoding: ParameterEncoding = URLEncoding.httpBody,
                           headers: HTTPHeaders? = nil) {
        
        print("url:\(urlHead + url)")
        print("json:\(json)")
        
        request(urlHead + url, method: method, parameters: json + signatureParameter(), encoding: encoding, headers: headers).responseJSON { (response) in
            if response.result.isSuccess {
                self.requestURLModelDelegate?.requestSucceed?(obj: response.value)
                refreshUI?(self)
            }
            else {
                print("response:\(String(describing: response.response))")
                self.requestURLModelDelegate?.requestFailed?(error: response.error)
            }
        }
        
    }
}

extension String {
    func getSha1() -> String {
        
        return self.sha1()
    }
}

extension RequestURLModel: RequestURLModelDelegate {
    
    public func requestSucceed(obj: Any?) {
        receiveMessage.createObj(dic: obj)
        
        print("requestSucceed---------->>>>>>>>>>>\(String(describing: obj))")
    }
    
    public func requestFailed(error: Error?) {
        print("requestFailed error:\(String(describing: error))")
    }
    
}

public func +<T>(lhs: Dictionary<T, Any>, rhs: Dictionary<T, Any>) -> Dictionary<T, Any> {
    var dic = lhs
    for (key, value) in rhs {
        dic[key] = value
    }
    return dic
}

extension NSObject {
    func createObj(dic: Any?) {
        
        var mdic = dic
        
        if let strDic = dic as? String, let jsonData = strDic.data(using: String.Encoding.utf8) {
            mdic = try? JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments)
        }
        
        guard let mydic = mdic else { BTSPrint("dic为nil"); return }
        guard let dictionary = mydic as? Dictionary<String, Any> else { BTSPrint("dic不是字典"); return }
        
        for (k, v) in dictionary {
            guard self.responds(to: Selector("\(k)")) else { continue }
            guard !(v is NSNull) else { continue }
            if v is Array<Any> || v is Dictionary<String, Any> {
                self.setValue(v, forKey: k)
            }
            else {
                self.setValue(String(describing: v), forKey: k)
            }
        }
        
    }
}
