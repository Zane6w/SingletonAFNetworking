//
//  NetworkTool.swift
//  SingletonAFNetworking
//
//  Created by zhi zhou on 2016/10/20.
//  Copyright © 2016年 zhi zhou. All rights reserved.
//

import UIKit

/// 为请求模式定义枚举
enum RequestMode {
    case get
    case post
}

class NetworkTool: AFHTTPSessionManager {
    // 创建单例
    static let shareInstance: NetworkTool = {
        let tool = NetworkTool()
        tool.responseSerializer.acceptableContentTypes?.insert("test/html")
        return tool
    }()
}

extension NetworkTool {
    // MARK:- 封装请求
    func request(method: RequestMode, urlString: String, parameters: [String: Any]?, finishRequest: @escaping (_ result: Any?, _ error: Error?) -> ()) {
        
        let successRequest = {
            (task: URLSessionDataTask, result: Any) in
                finishRequest(result, nil)
            }
        let failureRequest = {
            (task: URLSessionDataTask?, error: Error) in
                finishRequest(nil, error)
        }
        
        // 根据外界的设定请求模式来适配
        if method == .get {
            get(urlString, parameters: parameters, progress: nil, success: successRequest, failure: failureRequest)
        }else{
            post(urlString, parameters: parameters, progress: nil, success: successRequest, failure: failureRequest)
        }
        
    }
    
}
