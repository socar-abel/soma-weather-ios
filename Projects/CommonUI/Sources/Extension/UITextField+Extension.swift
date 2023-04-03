//
//  UITextField+Extenson.swift
//  CommonUI
//
//  Created by 김상우 on 2023/04/03.
//  Copyright © 2023 soma. All rights reserved.
//

import UIKit

extension UITextField {
    public func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
