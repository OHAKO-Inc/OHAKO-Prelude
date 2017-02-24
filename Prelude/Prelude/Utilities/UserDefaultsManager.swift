//
//  UserDefaultsManager.swift
//  tagmatch
//
//  Created by Yoshikuni Kato on 2016/07/08.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import Foundation

protocol UserDefaultsManagerType: class {
    var accessToken: String? { get set }
    var refreshToken: String? { get set }
    func removeCachedProperties()
}

final class UserDefaultsManager: UserDefaultsManagerType {

    enum Key: String {
        case accessToken = "AccessToken"
        case refreshToken = "RefreshToken"
    }

    static let shared: UserDefaultsManagerType = UserDefaultsManager()

    private let userDefaults = UserDefaults.standard

    var accessToken: String? {
        get {
            let key = Key.accessToken.rawValue
            return userDefaults.object(forKey: key) as? String
        }
        set {
            let key = Key.accessToken.rawValue
            newValue == nil ? userDefaults.removeObject(forKey: key) : userDefaults.set(newValue!, forKey: key)
            userDefaults.synchronize()
        }
    }

    var refreshToken: String? {
        get {
            let key = Key.refreshToken.rawValue
            return userDefaults.object(forKey: key) as? String
        }
        set {
            let key = Key.refreshToken.rawValue
            newValue == nil ? userDefaults.removeObject(forKey: key) : userDefaults.set(newValue!, forKey: key)
            userDefaults.synchronize()
        }
    }

    func removeCachedProperties() {
        accessToken = nil
        refreshToken = nil
    }
}
