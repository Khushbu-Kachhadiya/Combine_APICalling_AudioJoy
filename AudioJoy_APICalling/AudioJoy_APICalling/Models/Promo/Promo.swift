//
//  Promo.swift
//  Audiojoy
//
//  Created by Anna Korolyova on 15.09.17.
//  Copyright © 2017 Pitashi. All rights reserved.
//

import UIKit
import ObjectMapper

struct Promo {
    let title: String
    let description: String
    let link: String
    let iconURL: String
    let backgroundImageURL: String
}

extension Promo: ImmutableMappable {
    private enum Keys {
        static let Title = "PromoTitle"
        static let Description = "PromoDescription"
        static let Link = "PromoLink"
        static let IconURL = "PromoIconUrl"
        static let BackgroundImageURL = "PromoBackgroundImageUrl"
    }

    init(map: Map) throws {
        self.title = try map.value(Keys.Title)
        self.description = try map.value(Keys.Description)
        self.link = try map.value(Keys.Link)
        self.iconURL = try map.value(Keys.IconURL)
        self.backgroundImageURL = try map.value(Keys.BackgroundImageURL)
    }
}
