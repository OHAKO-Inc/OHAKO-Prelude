//
//  UIImage+Color.swift
//  tagmatch
//
//  Created by Yoshikuni Kato on 2016/07/27.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

extension UIImage {
    class func makeImage(with color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }

        context.setFillColor(color.cgColor)
        context.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}
