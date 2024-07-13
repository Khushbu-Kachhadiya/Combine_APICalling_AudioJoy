//
//  SettingsInfoItem.swift
//  Audiojoy
//
//  Created by Anna Korolyova on 8/1/17.
//  Copyright © 2017 Pitashi. All rights reserved.
//

import ObjectMapper
import Foundation

struct SettingsInfoItem: Equatable {
    let title: String
    let url: URL
}

// MARK: - ImmutableMappable

extension SettingsInfoItem: ImmutableMappable {
    private enum Keys {
        static let Title = "Title"
        static let Url = "Url"
    }

    init(map: Map) throws {
        self.title = try map.value(Keys.Title)
        self.url = try map.value(Keys.Url, using: URLTransform())
    }
}
