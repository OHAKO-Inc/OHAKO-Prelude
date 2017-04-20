//
//  RoundedImageView.swift
//  Prelude
//
//  Created by Yoshikuni Kato on 2016/08/05.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

@IBDesignable open class RoundedImageView: UIImageView {
    @IBInspectable open var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = cornerRadius > 0.0
        }
    }
}
