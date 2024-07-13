//
//  TrackInfo.swift
//  Audiojoy
//
//  Created by Anna Korolyova on 05.09.17.
//  Copyright © 2017 Pitashi. All rights reserved.
//

import Foundation
import ObjectMapper

struct TrackInfo {
    let identifier: Int
    let title: String
    let trackDescription: String
    let sourceTitle: String?
    let authorName: String?
    let sourceUrl: String?
    let audioUrl: String?
    let contentGroupIdentifier: Int
}

// MARK: - ImmutableMappable

extension TrackInfo: ImmutableMappable {
    private enum Keys {
        static let Identifier = "ContentId"
        static let Title = "ContentTitle"
        static let TrackDescription = "ContentFull"
        static let SourceTitle = "ContentSource"
        static let AuthorName = "ContentAuthor"
        static let SourceUrl = "ContentSourceUrl"
        static let AudioUrl = "ContentAudioUrl"
        static let ContentGroupIdentifier = "ContentGroupId"
    }

    init(map: Map) throws {
        self.identifier = try map.value(Keys.Identifier)
        self.title = try map.value(Keys.Title)
        self.trackDescription = (try? map.value(Keys.TrackDescription)) ?? ""
        self.sourceTitle = try? map.value(Keys.SourceTitle)
        self.authorName = try? map.value(Keys.AuthorName)
        self.sourceUrl = try? map.value(Keys.SourceUrl)
        self.audioUrl = try? map.value(Keys.AudioUrl)
        self.contentGroupIdentifier = (try? map.value(Keys.ContentGroupIdentifier)) ?? 0
    }

    init(trackId: Int, title: String, trackDescription: String = "",
         sourceTitle: String? = nil, authorName: String? = nil, sourceUrl: String? = nil,
         audioUrl: String, contentGroupIdentifier: Int) {
        self.identifier = trackId
        self.title = title
        self.trackDescription = trackDescription
        self.sourceTitle = sourceTitle
        self.authorName = authorName
        self.sourceUrl = sourceUrl
        self.audioUrl = audioUrl
        self.contentGroupIdentifier = contentGroupIdentifier
    }
}
