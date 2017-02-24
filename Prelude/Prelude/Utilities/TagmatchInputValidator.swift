//
//  TagmatchInputValidator.swift
//  tagmatch
//
//  Created by Yoshikuni Kato on 2016/11/07.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import Foundation

struct TagmatchInputValidator {

    static func validateInputsExistance(_ inputs: [String]) -> Bool {
        return !inputs
            .map { $0.isEmpty }
            .contains(true)
    }

    static func validateEmail(_ email: String) -> Bool? {
        let pattern = "^[a-zA-Z0-9.!#$%&’*+/=?^_`{\\|}~-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$"
        do {
            let internalRegexp = try NSRegularExpression(pattern: pattern, options: [])
            let matches = internalRegexp.matches(in: email, options: [], range: NSRange(location: 0, length: email.characters.count))
            return matches.count > 0
        } catch _ as NSError {
            return nil
        }
    }

    static func validatePasswordLength(_ password: String) -> Bool {
        let length = password.characters.count
        return (length >= 8) && (length <= 100)
    }

    static func validatePasswordCharacters(_ password: String) -> Bool? {
        let pattern = "\\A[\\x21-\\x7E]+\\z"
        do {
            let internalRegexp = try NSRegularExpression(pattern: pattern, options: [])
            let matches = internalRegexp.matches(in: password, options: [], range: NSRange(location: 0, length: password.characters.count))
            return matches.count > 0
        } catch _ as NSError {
            return nil
        }
    }

    static func validateKatakana(_ string: String) -> Bool? {
        let pattern = "^[ァ-ヾ]+$"
        do {
            let internalRegexp = try NSRegularExpression(pattern: pattern, options: [])
            let matches = internalRegexp.matches(in: string, options: [], range: NSRange(location: 0, length: string.characters.count))
            return matches.count > 0
        } catch _ as NSError {
            return nil
        }
    }
}
