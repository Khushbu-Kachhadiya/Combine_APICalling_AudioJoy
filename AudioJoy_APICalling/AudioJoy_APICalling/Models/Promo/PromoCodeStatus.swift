//
//  PromoCodeStatus.swift
//  Audiojoy
//
//  Created by Baby on 2/8/18.
//  Copyright © 2018 Pitashi. All rights reserved.
//

import ObjectMapper
import Foundation

// MARK: - PromoCodeStatus

struct PromoCodeStatus {
    var codes: ApiPromoCode?
    var statusResult: String?
}

extension PromoCodeStatus: ImmutableMappable {
    private enum Keys {
        static let PromoCodes = "promo_code"
        static let StatusResult = "statusResult"
    }

    init(map: Map) throws {
        self.codes = try? map.value(Keys.PromoCodes)
        self.statusResult = try? map.value(Keys.StatusResult)
    }
}

// MARK: - PromoCode

struct PromoCode {
    var code: String
    var monthSubscription: String
    var quarterSubscription: String
    var lifetimeSubscription: String
    var expirationDate: Date
}

// MARK: - APIPromoCode

struct ApiPromoCode {
    var code: String
    var monthSubscription: String
    var quarterSubscription: String
    var lifetimeSubscription: String

    var asDomain: PromoCode {
        let date = Date().timeRemoved ?? Date()

        return PromoCode(code: code,
                         monthSubscription: monthSubscription,
                         quarterSubscription: quarterSubscription,
                         lifetimeSubscription: lifetimeSubscription,
                         expirationDate: date.dateByAdding(value: Promos.CacheDaysCount))
    }
}

extension ApiPromoCode: ImmutableMappable {
    private enum Keys {
        static let PromoCode = "PromoCode"
        static let MonthSubscription = "IapApple1Month"
        static let QuarterSubscription = "IapApple3Month"
        static let LifetimeSubscription = "IapAppleLifetime"
    }

    init(map: Map) throws {
        self.code = try map.value(Keys.PromoCode)
        self.monthSubscription = try map.value(Keys.MonthSubscription)
        self.quarterSubscription = try map.value(Keys.QuarterSubscription)
        self.lifetimeSubscription = try map.value(Keys.LifetimeSubscription)
    }
}
