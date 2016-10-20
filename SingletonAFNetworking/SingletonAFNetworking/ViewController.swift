//
//  ViewController.swift
//  SingletonAFNetworking
//
//  Created by zhi zhou on 2016/10/20.
//  Copyright © 2016年 zhi zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     Info.plish 中需要设置：
     App Transport Security Settings ---> Allow Arbitrary Loads
     */
    
    // 点击屏幕来触发请求测试
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NetworkTool.shareInstance.request(method: .get, urlString: "http://httpbin.org/get", parameters: ["project": "test"]) { (result, error) in
            guard error == nil else {
                print("error--->:\(error)")
                return
            }
            print("success:--->\(result)")
        }
    }


}

