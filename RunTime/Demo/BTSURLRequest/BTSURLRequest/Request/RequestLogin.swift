//
//  文件名: RequestLogin.swift
//  模块名: 智能生活
//
//  作者: 妈妈好零售技术有限公司 
//  日期: 2017/12/19.
//  Copyright © 妈妈好零售技术有限公司 All rights reserved.
//

import UIKit
import SwiftyJSON

@objc public enum LoginType: Int {
    case none = -1
    case accountPassword = 0
    case wechat = 1
    case QQ = 2
    case weibo = 3
    case mamHao = 4
}

open class RequestLogin: RequestURLModel {
    
    public class func requestAccountPassword(_ account: String?, _ password: String?, refreshUI: RefreshUI?) {
        RequestLogin().requestAccountPassword(account, password, refreshUI: refreshUI)
    }
    
    func requestAccountPassword(_ account: String?, _ password: String?, refreshUI: RefreshUI?) {
        
        guard let account = account else { return }
        guard let password = password else { return }
        
        requestURL(ServiceURLModel.login, json: ["username": account, "password": (password + ServiceURLModel.token).getMd5(), "logintype": "0"], refreshUI: refreshUI)
    }
    
    public class func requestOtherPlatform(logintype: LoginType, openid: String?, nickname: String?, headimage: String?, refreshUI: RefreshUI?) {
        RequestLogin().requestOtherPlatform(logintype: logintype, openid: openid, nickname: nickname, headimage: headimage, refreshUI: refreshUI)
    }
    
    func requestOtherPlatform(logintype: LoginType, openid: String?, nickname: String?, headimage: String?, refreshUI: RefreshUI?) {
        guard let openid = openid else { return }
        
        json["openid"] = openid
        json["nickname"] = nickname ?? ""
        json["headimage"] = headimage ?? ""
        json["logintype"] = logintype.rawValue
        
        requestURL(ServiceURLModel.login, json: json, refreshUI: refreshUI)
        
    }
    
    public class func requestMMHPlatform(openid: String?, nickname: String?, headimage: String?, phoneNum: String?, babyInfo: [Any]?, refreshUI: RefreshUI?)  {
        RequestLogin().requestMMHPlatform(openid: openid, nickname: nickname, headimage: headimage, phoneNum: phoneNum, babyInfo: babyInfo, refreshUI: refreshUI)
    }
    
    func requestMMHPlatform(openid: String?, nickname: String?, headimage: String?, phoneNum: String?, babyInfo: [Any]?, refreshUI: RefreshUI?) {
        
        json["openid"] = openid ?? ""
        json["nickname"] = nickname ?? ""
        json["headimage"] = headimage ?? ""
        json["phoneNum"] = phoneNum ?? ""
        json["logintype"] = 4
        
        if let babyInfo = babyInfo {
            json["babyInfo"] = JSON(babyInfo).description
        } else {
            json["babyInfo"] = ""
        }
        
        requestURL(ServiceURLModel.login, json: json, refreshUI: refreshUI)
    }
    
    override public func requestSucceed(obj: Any?) {
        super.requestSucceed(obj: obj)
    }
    
}

extension String {
    
    func getMd5() -> String {
        
        return self.md5()
    }
    
}
