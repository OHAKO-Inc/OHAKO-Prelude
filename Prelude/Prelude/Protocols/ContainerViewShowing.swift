//
//  ContainerViewShowing.swift
//  tagmatch
//
//  Created by Yoshikuni Kato on 2016/09/28.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

protocol ContainerViewShowing {
    func addChildViewController(_ childViewController: UIViewController, to containerView: UIView)
}

extension ContainerViewShowing where Self: UIViewController {
    func addChildViewController(_ childViewController: UIViewController, to containerView: UIView) {
        addChildViewController(childViewController)
        containerView.addFilledSubview(childViewController.view)
        childViewController.didMove(toParentViewController: self)
    }
}
