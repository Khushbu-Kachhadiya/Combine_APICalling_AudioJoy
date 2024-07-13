//
//  AppCategoryEnvelope.swift
//  Audiojoy
//
//  Created by Anna Korolyova on 8/11/17.
//  Copyright © 2017 Pitashi. All rights reserved.
//

import Foundation
import ObjectMapper

struct AppCategoryEnvelope {
    let identifier: Int
    let imageUrl: String
    let contentGroups: [ContentGroup]
}

// MARK: - ImmutableMappable

extension AppCategoryEnvelope: ImmutableMappable {
    private enum Keys {
        static let Identifier = "cat_info.CategoryId"
        static let ImageUrl = "cat_info.CategoryImageUrl"
        static let ContentGroups = "cat_content_groups"
    }

    init(map: Map) throws {
        self.identifier = try map.value(Keys.Identifier)
        self.imageUrl = try map.value(Keys.ImageUrl)
        self.contentGroups = try map.value(Keys.ContentGroups)
    }

    func mapping(map: Map) {
        self.identifier >>> map[Keys.Identifier]
        self.imageUrl >>> map[Keys.ImageUrl]
        self.contentGroups >>> map[Keys.ContentGroups]
    }
}
