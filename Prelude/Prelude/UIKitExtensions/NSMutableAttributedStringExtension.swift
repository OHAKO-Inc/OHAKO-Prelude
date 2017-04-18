//
//  NSMutableAttributedStringExtension.swift
//  Prelude
//
//  Created by Yoshikuni Kato on 2016/08/03.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    convenience init(text: String, font: UIFont, lineSpacing: CGFloat = 0.0) {
        self.init(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        //        self.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: self.length))
        self.addAttributes([
            NSFontAttributeName: font,
            NSParagraphStyleAttributeName: paragraphStyle
            ], range: NSRange(location: 0, length: self.length))
    }

}

extension NSAttributedString {
    func boundingRectForUITextView(width: CGFloat) -> CGRect {
        let options = unsafeBitCast(
            NSStringDrawingOptions.usesLineFragmentOrigin.rawValue /* | NSStringDrawingOptions.UsesFontLeading.rawValue */,
            to: NSStringDrawingOptions.self)
        return self.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: options, context: nil)
    }

    func boundingRectForUILabel(width: CGFloat) -> CGRect {
        let options = unsafeBitCast(
            NSStringDrawingOptions.usesLineFragmentOrigin.rawValue |
                NSStringDrawingOptions.truncatesLastVisibleLine.rawValue,
            to: NSStringDrawingOptions.self)
        return self.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: options, context: nil)
    }
}
