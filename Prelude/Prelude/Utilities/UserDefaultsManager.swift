//
//  UserDefaultsManager.swift
//  tagmatch
//
//  Created by Yoshikuni Kato on 2016/07/08.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift
import Result

protocol UserDefaultsManagerType: class {
    var accessToken: String? { get set }
    var refreshToken: String? { get set }
    var adminNotificationsReadDate: MutableProperty<Date?> { get }

    func removeCachedProperties()
}

final class UserDefaultsManager: UserDefaultsManagerType {

    enum Key: String {
        case accessToken = "AccessToken"
        case refreshToken = "RefreshToken"
        case adminNotificationsReadDate = "AdminNotificationsReadDate"
    }

    static let shared: UserDefaultsManagerType = UserDefaultsManager()

    private let userDefaults = UserDefaults.standard

    let adminNotificationsReadDate: MutableProperty<Date?>

    init() {
        adminNotificationsReadDate = MutableProperty<Date?>(nil)
        adminNotificationsReadDate.value = _adminNotificationsReadDate

        adminNotificationsReadDate
            .signal
            .observeValues { [weak self] date in
                self?._adminNotificationsReadDate = date
        }
    }

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

    // this property is set only by adminNotificationReadDate (MutableProperty)
    private var _adminNotificationsReadDate: Date? {
        get {
            let key = Key.adminNotificationsReadDate.rawValue
            return userDefaults.object(forKey: key) as? Date
        }
        set {
            let key = Key.adminNotificationsReadDate.rawValue
            newValue == nil ? userDefaults.removeObject(forKey: key) : userDefaults.set(newValue!, forKey: key)
            userDefaults.synchronize()
        }
    }

    func removeCachedProperties() {
        accessToken = nil
        refreshToken = nil
        adminNotificationsReadDate.value = nil
    }
}
