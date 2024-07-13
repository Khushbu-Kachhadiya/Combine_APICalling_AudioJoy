//
//  Configuration.swift
//  Audiojoy
//
//  Created by Anna Korolyova on 7/26/17.
//  Copyright © 2017 Pitashi. All rights reserved.
//

import Foundation
import ObjectMapper

struct Configuration {
    let identifier: Int
    let primaryColor: String
    /// Is App Unlocked. True - when user did pay. False - user did not pay.
    var isFree: Bool
    let screens: [Screen]
    let initialScreenType: Screen.ScreenType?
    let settingsInfoItems: [SettingsInfoItem]
    let adWordsIdentifier: String?
    let adWordsInstallLabel: String?
    let adWordsMonthlyLabel: String?
    let adWordsQuarterlyLabel: String?
    let adWordsLifetimeLabel: String?
    let termsOfUseURL: String?
    let privacyPolicyURL: String?
}

// MARK: - ImmutableMappable

extension Configuration: ImmutableMappable {
    private enum Keys {
        static let Identifier = "Identifier"
        static let PrimaryColor = "PrimaryColor"
        static let IsFree = "IsFree"
        static let Screens = "Screens"
        static let InitialScreenType = "InitialScreenType"
        static let SettingsInfoItems = "SettingsInfoItems"
        static let AdWordsIdentifier = "adwords_conversion_id"
        static let AdWordsInstallLabel = "install_label"
        static let AdWordsMonthlyLabel = "purchase_1month_label"
        static let AdWordsQuarterlyLabel = "purchase_3months_label"
        static let AdWordsLifetimeLabel = "purchase_lifetime_label"
        static let TermsOfUseURL = "TermsOfUseURL"
        static let PrivacyPolicyURL = "PrivacyPolicyURL"
    }

    init(map: Map) throws {
        self.identifier = try map.value(Keys.Identifier)
        self.primaryColor = try map.value(Keys.PrimaryColor)
        self.isFree = try map.value(Keys.IsFree)
        self.screens = try map.value(Keys.Screens)
        self.initialScreenType = try? map.value(Keys.InitialScreenType)
        self.settingsInfoItems = try map.value(Keys.SettingsInfoItems)
        self.adWordsIdentifier = try? map.value(Keys.AdWordsIdentifier)
        self.adWordsInstallLabel = try? map.value(Keys.AdWordsInstallLabel)
        self.adWordsMonthlyLabel = try? map.value(Keys.AdWordsMonthlyLabel)
        self.adWordsQuarterlyLabel = try? map.value(Keys.AdWordsQuarterlyLabel)
        self.adWordsLifetimeLabel = try? map.value(Keys.AdWordsLifetimeLabel)
        self.termsOfUseURL = try? map.value(Keys.TermsOfUseURL)
        self.privacyPolicyURL = try? map.value(Keys.PrivacyPolicyURL)
    }
}

// MARK: - Equatable

extension Configuration: Equatable {
    static func == (lhs: Configuration, rhs: Configuration) -> Bool {
        return lhs.identifier == rhs.identifier &&
            lhs.primaryColor == rhs.primaryColor &&
            lhs.isFree == rhs.isFree &&
            lhs.screens == rhs.screens &&
            lhs.initialScreenType == rhs.initialScreenType &&
            lhs.settingsInfoItems == rhs.settingsInfoItems &&
            lhs.adWordsIdentifier == rhs.adWordsIdentifier &&
            lhs.adWordsInstallLabel == rhs.adWordsInstallLabel &&
            lhs.adWordsMonthlyLabel == rhs.adWordsMonthlyLabel &&
            lhs.adWordsQuarterlyLabel == rhs.adWordsQuarterlyLabel &&
            lhs.adWordsLifetimeLabel == rhs.adWordsLifetimeLabel
    }
}
