//
//  RoundedView.swift
//  Prelude
//
//  Created by Yoshikuni Kato on 2016/08/18.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

@IBDesignable class RoundedView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = cornerRadius > 0.0
        }
    }
}
