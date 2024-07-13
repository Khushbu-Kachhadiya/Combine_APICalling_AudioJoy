//
//  AppInfo.swift
//  Audiojoy
//
//  Created by Anna Korolyova on 7/24/17.
//  Copyright © 2017 Pitashi. All rights reserved.
//

import Foundation
import ObjectMapper

struct AppInfo {
    let identifier: Int
    let unlockQuote: String
    let sharedSecret: String
    let shortLink: String
    let name: String
    let shortName: String
    let monthPurchaseIds: [String]
    let quarterPurchaseIds: [String]
    let lifetimePurchaseIds: [String]
    let webPromoImageUrl: URL
    let appStoreId: String
}

// MARK: - ImmutableMappable

extension AppInfo: ImmutableMappable {
    private enum Keys {
        static let Identifier = "AppId"
        static let UnlockQuote = "AppUnlockQuote"
        static let SharedSecret = "AppSharedSecret"
        static let ShortLink = "AppShortLink"
        static let Name = "AppName"
        static let ShortName = "AppShortName"
        static let MonthPurchaseIds = "IapApple1Month"
        static let QuarterPurchaseIds = "IapApple3Month"
        static let LifetimePurchaseIds = "IapAppleLifetime"
        static let WebPromoImageUrl = "AppWebPromoImageName"
        static let AppStoreId = "AppStoreId"
    }

    init(map: Map) throws {
        self.identifier = try map.value(Keys.Identifier)
        self.unlockQuote = try map.value(Keys.UnlockQuote)
        self.sharedSecret = try map.value(Keys.SharedSecret)
        self.shortLink = try map.value(Keys.ShortLink)
        self.name = try map.value(Keys.Name)
        self.shortName = try map.value(Keys.ShortName)
        self.monthPurchaseIds = try map.value(Keys.MonthPurchaseIds)
        self.quarterPurchaseIds = try map.value(Keys.QuarterPurchaseIds)
        self.lifetimePurchaseIds = try map.value(Keys.LifetimePurchaseIds)
        self.webPromoImageUrl = try map.value(Keys.WebPromoImageUrl, using: URLTransform())
        self.appStoreId = try map.value(Keys.AppStoreId)
    }

    func mapping(map: Map) {
        self.identifier >>> map[Keys.Identifier]
        self.unlockQuote >>> map[Keys.UnlockQuote]
        self.sharedSecret >>> map[Keys.SharedSecret]
        self.shortLink >>> map[Keys.ShortLink]
        self.name >>> map[Keys.Name]
        self.shortName >>> map[Keys.ShortName]
        self.monthPurchaseIds >>> map[Keys.MonthPurchaseIds]
        self.quarterPurchaseIds >>> map[Keys.QuarterPurchaseIds]
        self.lifetimePurchaseIds >>> map[Keys.LifetimePurchaseIds]
        self.webPromoImageUrl >>> (map[Keys.WebPromoImageUrl], URLTransform())
        self.appStoreId >>> map[Keys.AppStoreId]
    }
}
