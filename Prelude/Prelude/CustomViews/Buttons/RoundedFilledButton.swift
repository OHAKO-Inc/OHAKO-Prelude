//
//  RoundedFilledButton.swift
//  Prelude
//
//  Created by Yoshikuni Kato on 2016/08/03.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

@IBDesignable open class RoundedFilledButton: RoundedButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }

    private func commonInit() {
        cornerRadius = 2.0
    }

}
