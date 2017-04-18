//
//  RoundedBorderButton.swift
//  Prelude
//
//  Created by Yoshikuni Kato on 2016/08/03.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

@IBDesignable final class RoundedBorderButton: RoundedButton {

    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            setColor(borderColor)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }

    private func commonInit() {
        cornerRadius = 2.0
        layer.borderWidth = 1.0
        setColor(borderColor)
    }

    func setColor(_ color: UIColor) {
        layer.borderColor = color.cgColor
        setTitleColor(color, for: UIControlState())
    }

}
