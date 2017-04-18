//
//  RoundedBorderView.swift
//  Prelude
//
//  Created by Yoshikuni Kato on 2016/10/07.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

@IBDesignable final class RoundedBorderView: RoundedView {

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
    }

}
