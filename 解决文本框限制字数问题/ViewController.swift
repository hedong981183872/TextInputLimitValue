//
//  ViewController.swift
//  解决文本框限制字数问题
//
//  Created by 贺东 on 2019/9/3.
//  Copyright © 2019年 贺东. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = UIColor.white
        
        let textField = UITextField.init(frame: CGRect.init(x: 20, y: 100, width: 300, height: 40))
        textField.backgroundColor = UIColor.red
        textField.textMaxLength = 10
        self.view.addSubview(textField)
        
        let textView = UITextView.init(frame: CGRect.init(x: 20, y: 200, width: 300, height: 300))
        textView.backgroundColor = UIColor.green
        textView.textMaxLength = 15
        textView.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(textView)
        
    }
}

