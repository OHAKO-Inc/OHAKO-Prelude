//
//  InputValidator.swift
//  Prelude
//
//  Created by Yoshikuni Kato on 2016/11/07.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import Foundation

struct InputValidator {

    static func validateInputsExistance(_ inputs: [String]) -> Bool {
        return !inputs
            .map { $0.isEmpty }
            .contains(true)
    }
    
    static func validate(target: String, with pattern: String) -> Bool? {
        do {
            let internalRegexp = try NSRegularExpression(pattern: pattern, options: [])
            let matches = internalRegexp.matches(in: target, options: [], range: NSRange(location: 0, length: target.characters.count))
            return matches.count > 0
        } catch _ as NSError {
            return nil
        }
    }
    
}
