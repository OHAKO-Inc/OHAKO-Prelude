//
//  UITableView+Scroll.swift
//  Prelude
//
//  Created by Yoshikuni Kato on 2016/10/04.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

public extension UITableView {

    public func scrollToBottom(animated: Bool, viewAnimation: Bool = false) {
        guard numberOfSections > 0 && numberOfRows(inSection: numberOfSections - 1) > 0 else {
            return
        }
        let indexPath = IndexPath(row:  numberOfRows(inSection: numberOfSections - 1)-1, section: numberOfSections - 1)
        self.scrollToRow(at: indexPath, at: .bottom, animated: animated)

        // copied from Dear project
//        UIView.animate(withDuration: 
//            viewAnimation ? 0.1 : 0.0,
//            delay: 0.0,
//            options: [UIViewAnimationOptions.CurveEaseInOut],
//            animations: { () -> Void in
//                self.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Bottom, animated: animated)
//            },
//            completion: nil
//        )
    }
}
