//
//  ContentGroupEnvelope.swift
//  Audiojoy
//
//  Created by Anna Korolyova on 30.08.17.
//  Copyright © 2017 Pitashi. All rights reserved.
//

import Foundation
import ObjectMapper

struct ContentGroupEnvelope {
    let identifier: Int
    let imageUrl: String
    let name: String
    let groupDescription: String?
    let shortName: String
    let autoplay: Bool
    let publisherIdentifier: Int?
    let publisherName: String?
    let publisherImageUrl: String?
    var tracks: [Track]
    let topicId: Int?
    let topicName: String?
}

// MARK: - ImmutableMappable

extension ContentGroupEnvelope: ImmutableMappable {
    private enum Keys {
        static let Identifier = "content_group_info.ContentGroupId"
        static let ImageUrl = "content_group_info.ContentGroupImageUrl"
        static let Name = "content_group_info.ContentGroupName"
        static let ShortName = "content_group_info.ContentGroupShortName"
        static let Autoplay = "content_group_info.ContentGroupAutoplay"
        static let Description = "content_group_info.ContentGroupDescription"
        static let PublisherIdentifier = "content_group_info.PublisherId"
        static let PublisherName = "content_group_info.PublisherName"
        static let PublisherImageUrl = "content_group_info.PublisherImageUrl"
        static let Tracks = "content_group_tracks"
        static let TopicId = "content_group_info.TopicId"
        static let TopicName = "content_group_info.TopicName"
    }

    init(map: Map) throws {
        identifier = (try? map.value(Keys.Identifier)) ?? 0
        imageUrl = try map.value(Keys.ImageUrl)
        name = (try? map.value(Keys.Name)) ?? ""
        groupDescription = try? map.value(Keys.Description)
        shortName = (try? map.value(Keys.ShortName)) ?? ""
        autoplay = (try? map.value(Keys.Autoplay, using: IntToBoolTransform())) ?? false
        publisherIdentifier = try? map.value(Keys.PublisherIdentifier)
        publisherName = try? map.value(Keys.PublisherName)
        publisherImageUrl = try? map.value(Keys.PublisherImageUrl)
        tracks = (try? map.value(Keys.Tracks)) ?? []
        topicId = try? map.value(Keys.TopicId)
        topicName = try? map.value(Keys.TopicName)
    }
}


