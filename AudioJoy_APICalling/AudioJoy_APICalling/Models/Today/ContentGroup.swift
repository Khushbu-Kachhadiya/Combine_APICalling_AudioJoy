//
//  ContentGroup.swift
//  Audiojoy
//
//  Created by Anna Korolyova on 7/24/17.
//  Copyright © 2017 Pitashi. All rights reserved.
//

import Foundation
import ObjectMapper

struct Offline<T> {
    let value: T
    let isDownloaded: Bool
}

extension Offline: Equatable where T: Equatable {}

typealias OfflineContentGroup = Offline<ContentGroup>

struct ContentGroup {
    let identifier: Int
    let imageUrl: String
    let name: String
    let groupDescription: String?
    let shortName: String?
    let autoplay: Bool?
    let isNew: Bool?
    let isFree: Bool?
    let publisherIdentifier: Int?
    let publisherName: String?
    let publisherImageUrl: String?
    let publisherUrl: String?
    let contentId: Int?
    let contentTitle: String?
}

// MARK: - ImmutableMappable

extension ContentGroup: ImmutableMappable {
    private enum Keys {
        static let Identifier = "ContentGroupId"
        static let ImageUrl = "ContentGroupImageUrl"
        static let Name = "ContentGroupName"
        static let GroupDescription = "ContentGroupDescription"
        static let ShortName = "ContentGroupShortName"
        static let Autoplay = "ContentGroupAutoplay"
        static let IsNew = "ContentGroupIsNew"
        static let IsFree = "ContentGroupIsFree"
        static let PublisherIdentifier = "PublisherId"
        static let PublisherName = "PublisherName"
        static let PublisherImageUrl = "PublisherImageUrl"
        static let PublisherUrl = "PublisherUrl"
        static let ContentId = "ContentId"
        static let ContentTitle = "ContentTitle"
    }

    public init(map: ObjectMapper.Map) throws {
        self.identifier = try map.value(Keys.Identifier)
        self.imageUrl = (try? map.value(Keys.ImageUrl)) ?? ""
        self.name = try map.value(Keys.Name)
        self.groupDescription = try? map.value(Keys.GroupDescription)
        self.shortName = try? map.value(Keys.ShortName)
        self.autoplay = try? map.value(Keys.Autoplay, using: IntToBoolTransform())
        self.isNew = try? map.value(Keys.IsNew, using: IntToBoolTransform())
        self.isFree = try? map.value(Keys.IsFree, using: IntToBoolTransform())
        self.publisherIdentifier = try? map.value(Keys.PublisherIdentifier)
        self.publisherName = try? map.value(Keys.PublisherName)
        self.publisherImageUrl = try? map.value(Keys.PublisherImageUrl)
        self.publisherUrl = try? map.value(Keys.PublisherUrl)
        self.contentId = try? map.value(Keys.ContentId)
        self.contentTitle = try? map.value(Keys.ContentTitle)
    }

    func mapping(map: Map) {
        self.identifier >>> map[Keys.Identifier]
        self.imageUrl >>> map[Keys.ImageUrl]
        self.name >>> map[Keys.Name]
        self.groupDescription >>> map[Keys.GroupDescription]
        self.shortName >>> map[Keys.ShortName]
        self.autoplay >>> map[Keys.Autoplay]
        self.isNew >>> map[Keys.IsNew]
        self.isFree >>> map[Keys.IsFree]
        self.publisherIdentifier >>> map[Keys.PublisherIdentifier]
        self.publisherName >>> map[Keys.PublisherName]
        self.publisherImageUrl >>> map[Keys.PublisherImageUrl]
        self.publisherUrl >>> map[Keys.PublisherUrl]
        self.contentId >>> map[Keys.ContentId]
        self.contentTitle >>> map[Keys.ContentTitle]
    }
}

// MARK: - Equatable

extension ContentGroup: Equatable {
    static func == (lhs: ContentGroup, rhs: ContentGroup) -> Bool {
        return lhs.identifier == rhs.identifier &&
            lhs.imageUrl == rhs.imageUrl &&
            lhs.name == rhs.name &&
            lhs.groupDescription == rhs.groupDescription &&
            lhs.shortName == rhs.shortName &&
            lhs.autoplay == rhs.autoplay &&
            lhs.isNew == rhs.isNew &&
            lhs.isFree == rhs.isFree &&
            lhs.publisherIdentifier == rhs.publisherIdentifier &&
            lhs.publisherName == rhs.publisherName &&
            lhs.publisherImageUrl == rhs.publisherImageUrl &&
            lhs.publisherUrl == rhs.publisherUrl &&
            lhs.contentId == rhs.contentId &&
            lhs.contentTitle == rhs.contentTitle
    }
}
