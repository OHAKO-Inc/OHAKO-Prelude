//
//  RoundedButton.swift
//  Prelude
//
//  Created by Yoshikuni Kato on 2016/08/03.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

@IBDesignable open class RoundedButton: UIButton {
    @IBInspectable open var cornerRadius: CGFloat = 2.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = cornerRadius > 0.0
        }
    }
}
