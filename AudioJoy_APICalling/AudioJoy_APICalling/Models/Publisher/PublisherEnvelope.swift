//
//  Publisher.swift
//  Audiojoy
//
//  Created by Anna Korolyova on 8/21/17.
//  Copyright © 2017 Pitashi. All rights reserved.
//

import Foundation
import ObjectMapper

struct PublisherEnvelope {
    let identifier: Int
    let name: String
    let bio: String?
    let websiteUrl: String?
    let imageUrl: String
    let backgroundUrl: String
    let contentGroups: [ContentGroup]
}

// MARK: - ImmutableMappable

extension PublisherEnvelope: ImmutableMappable {
    private enum Keys {
        static let Identifier = "pub_info.PublisherId"
        static let Name = "pub_info.PublisherName"
        static let Bio = "pub_info.PublisherBio"
        static let WebsiteUrl = "pub_info.PublisherWebsiteUrl"
        static let ImageUrl = "pub_info.PublisherImageUrl"
        static let BackgroundUrl = "pub_info.PublisherBkgUrl"
        static let ContentGroups = "content_groups"
    }

    init(map: Map) throws {
        self.identifier = try map.value(Keys.Identifier)
        self.name = try map.value(Keys.Name)
        self.bio = try? map.value(Keys.Bio)
        self.websiteUrl = try? map.value(Keys.WebsiteUrl)
        self.imageUrl = try map.value(Keys.ImageUrl)
        self.backgroundUrl = try map.value(Keys.BackgroundUrl)
        self.contentGroups = try map.value(Keys.ContentGroups)
    }
}

// MARK: - Equatable

extension PublisherEnvelope: Equatable {
    static func == (lhs: PublisherEnvelope, rhs: PublisherEnvelope) -> Bool {
        return lhs.identifier == rhs.identifier &&
            lhs.name == rhs.name &&
            lhs.bio == rhs.bio &&
            lhs.websiteUrl == rhs.websiteUrl &&
            lhs.imageUrl == rhs.imageUrl &&
            lhs.backgroundUrl == rhs.backgroundUrl &&
            lhs.contentGroups == rhs.contentGroups
    }
}
