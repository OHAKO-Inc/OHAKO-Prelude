//
//  UIAlertController+ImageSelection.swift
//  tagmatch
//
//  Created by Yoshikuni Kato on 2016/10/21.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

extension UIAlertController {
    class func showImageSelectAlertController(_ containerVC: UIViewController, imagePicker: UIImagePickerController) {

        let pickerAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            pickerAlert.addAction(UIAlertAction(title: "アルバムから選択", style: .default, handler: { (_) -> Void in
                imagePicker.sourceType = .photoLibrary
                containerVC.present(imagePicker, animated: true, completion: nil)
            }))
        }

        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            pickerAlert.addAction(UIAlertAction(title: "写真を撮る", style: .default, handler: { (_) -> Void in
                imagePicker.sourceType = .camera
                containerVC.present(imagePicker, animated: true, completion: nil)
            }))
        }

        pickerAlert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
        containerVC.present(pickerAlert, animated: true, completion: nil)
    }
}
