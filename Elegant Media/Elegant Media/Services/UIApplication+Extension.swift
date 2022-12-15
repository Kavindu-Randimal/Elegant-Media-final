//
//  UIApplication+Extension.swift
//  Elegant Media
//
//  Created by Randimal Geeganage on 2022-12-15.
//

import UIKit
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
