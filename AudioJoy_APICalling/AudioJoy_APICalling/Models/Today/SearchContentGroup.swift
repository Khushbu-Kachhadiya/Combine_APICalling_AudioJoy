//
//  SearchContentGroup.swift
//  Audiojoy
//
//  Created by Anna Korolyova on 17.08.17.
//  Copyright © 2017 Pitashi. All rights reserved.
//

import Foundation
import ObjectMapper

struct SearchContentGroup {
    let identifier: Int
    let title: String
    let shortName: String?
}

// MARK: - ImmutableMappable

extension SearchContentGroup: ImmutableMappable {
    private enum Keys {
        static let Identifier = "ContentGroupId"
        static let Name = "ContentGroupName"
        static let ShortName = "ContentGroupShortName"
    }

    public init(map: ObjectMapper.Map) throws {
        self.identifier = try map.value(Keys.Identifier)
        self.title = try map.value(Keys.Name)
        self.shortName = try? map.value(Keys.ShortName)
    }

    func mapping(map: Map) {
        self.identifier >>> map[Keys.Identifier]
        self.title >>> map[Keys.Name]
        self.shortName >>> map[Keys.ShortName]
    }
}

// MARK: - Equatable

extension SearchContentGroup: Equatable {
    static func == (lhs: SearchContentGroup, rhs: SearchContentGroup) -> Bool {
        return lhs.identifier == rhs.identifier &&
            lhs.title == rhs.title &&
            lhs.shortName == rhs.shortName
    }
}
