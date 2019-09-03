//
//  TextInputExtension.swift
//  解决文本框限制字数问题
//
//  Created by 贺东 on 2019/9/3.
//  Copyright © 2019年 贺东. All rights reserved.
//

import UIKit

var textMaxLengthKey = 100
extension UITextView{
    var textMaxLength:Int! {
        set {
            objc_setAssociatedObject(self, &textMaxLengthKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
            print(self)
            NotificationCenter.default.addObserver(self, selector: #selector(textValueChange), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
        }
        get {
            if let rs = objc_getAssociatedObject(self, &textMaxLengthKey) as? Int {
                return rs
            }
            return -1
        }
    }
    
    @objc func textValueChange() {
        if self.textInputMode?.primaryLanguage! == "zh-Hans" {
            let lastValue = self.text.suffix(1)
            if ("\u{4E00}" <= lastValue  && lastValue <= "\u{9FA5}"){
                if self.text.count > self.textMaxLength {
                    self.text = String(describing: self.text.prefix(self.textMaxLength))
                }
            }
        }else{
            if self.text.count > self.textMaxLength {
                self.text = String(describing: self.text.prefix(self.textMaxLength))
            }
        }
    }
}
extension UITextField {
    var textMaxLength:Int! {
        set {
            objc_setAssociatedObject(self, &textMaxLengthKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
            print(self)
            NotificationCenter.default.addObserver(self, selector: #selector(textValueChange), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        }
        get {
            if let rs = objc_getAssociatedObject(self, &textMaxLengthKey) as? Int {
                return rs
            }
            return -1
        }
    }
    @objc func textValueChange() {
        if self.textInputMode?.primaryLanguage! == "zh-Hans" {
            let lastValue = self.text!.suffix(1)
            if ("\u{4E00}" <= lastValue  && lastValue <= "\u{9FA5}"){
                if self.text!.count > self.textMaxLength {
                    self.text = String(describing: self.text!.prefix(self.textMaxLength))
                }
            }
        }else{
            if self.text!.count > self.textMaxLength {
                self.text = String(describing: self.text!.prefix(self.textMaxLength))
            }
        }
    }
}


