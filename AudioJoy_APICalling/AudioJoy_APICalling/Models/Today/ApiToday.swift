//
//  Today.swift
//  Audiojoy
//
//  Created by Roman Onyshkevych on 1/23/18.
//  Copyright © 2018 Pitashi. All rights reserved.
//

import Foundation
import ObjectMapper

// MARK: - FetchEnvelopePostModel
struct FetchEnvelopePostModel: Codable{
    var count:Int? = 5
    var inspirations_seen:Set<Int> = [0]
}

typealias ZippedTodayParams = (
    ApiTodayInspiration,
    ApiTodayReflection,
    ApiTodaySpeaker
)

struct ApiTodayEnvelope {
    var inspirations: [ApiTodayInspiration]
    var reflection: [ApiTodayReflection]
    var speakers: [ApiTodaySpeaker]

    var zipped: [ZippedTodayParams] {
        let minCount = min(inspirations.count, reflection.count, speakers.count)
        return (0..<minCount)
            .map { index in
                return (inspirations[index], reflection[index], speakers[index])
        }
    }
}

extension ApiTodayEnvelope: ImmutableMappable {
    private enum Keys {
        static let Inspirations = "inspirations"
        static let Reflection = "reflection"
        static let Speakers = "speakers"
    }

    init(map: Map) throws {
        self.inspirations = try map.value(Keys.Inspirations)
        self.reflection = try map.value(Keys.Reflection)
        self.speakers = try map.value(Keys.Speakers)
    }
}

struct ApiTodayInspiration {
    var identifier: Int
    var text: String
    var imageUrl: URL

    var asDomain: TodayInspiration {
        return TodayInspiration(
            identifier: identifier,
            text: text,
            imageUrl: imageUrl
        )
    }
}

extension ApiTodayInspiration: ImmutableMappable {
    private enum Keys {
        static let Identifier = "InspirationId"
        static let Text = "InspirationText"
        static let ImageUrl = "InspirationImageUrl"
    }

    init(map: Map) throws {
        self.identifier = try map.value(Keys.Identifier)
        self.text = try map.value(Keys.Text)
        self.imageUrl = try map.value(Keys.ImageUrl, using: URLTransform())
    }
}

struct ApiTodayReflection {
    var identifier: Int
    var contentGroupIdentifier: Int
    var contentGroupShortName: String
    var title: String
    var text: String
    var imageUrl: URL
    var audioUrl: URL
    var contentDay: String

    var asDomain: TodayAdvice {
        return TodayAdvice.init(
            identifier: identifier,
            contentGroupIdentifier: contentGroupIdentifier,
            contentGroupShortName: contentGroupShortName,
            title: title,
            text: text,
            imageUrl: imageUrl,
            audioUrl: audioUrl
        )
    }
}

extension ApiTodayReflection: ImmutableMappable {
    private enum Keys {
        static let Identifier = "ReflectionId"
        static let ContentGroupIdentifier = "ContentGroupId"
        static let ContentGroupShortName = "ContentGroupShortName"
        static let Title = "ReflectionTitle"
        static let Text = "ReflectionFull"
        static let ImageUrl = "ReflectionImageUrl"
        static let AudioUrl = "ReflectionAudioUrl"
        static let ContentDay = "ContentDay"

    }

    init(map: Map) throws {
        self.identifier = try map.value(Keys.Identifier)
        self.contentGroupIdentifier = try map.value(Keys.ContentGroupIdentifier)
        self.contentGroupShortName = try map.value(Keys.ContentGroupShortName)
        self.title = try map.value(Keys.Title)
        self.text = try map.value(Keys.Text)
        self.imageUrl = try map.value(Keys.ImageUrl, using: URLTransform())
        self.audioUrl = try map.value(Keys.AudioUrl, using: URLTransform())
        self.contentDay = try map.value(Keys.ContentDay)
    }
}

struct ApiTodaySpeaker {
    var identifier: Int
    var contentGroupIdentifier: Int
    var contentGroupShortName: String
    var title: String
    var text: String
    var imageUrl: URL
    var audioUrl: URL

    var asDomain: TodayAdvice {
        return TodayAdvice.init(
            identifier: identifier,
            contentGroupIdentifier: contentGroupIdentifier,
            contentGroupShortName: contentGroupShortName,
            title: title,
            text: text,
            imageUrl: imageUrl,
            audioUrl: audioUrl
        )
    }
}

extension ApiTodaySpeaker: ImmutableMappable {
    private enum Keys {
        static let Identifier = "SpeakerId"
        static let ContentGroupIdentifier = "ContentGroupId"
        static let ContentGroupShortName = "ContentGroupShortName"
        static let Title = "SpeakerTitle"
        static let Text = "SpeakerFull"
        static let ImageUrl = "SpeakerImageUrl"
        static let AudioUrl = "SpeakerAudioUrl"
    }

    init(map: Map) throws {
        self.identifier = try map.value(Keys.Identifier)
        self.contentGroupIdentifier = try map.value(Keys.ContentGroupIdentifier)
        self.contentGroupShortName = try map.value(Keys.ContentGroupShortName)
        self.title = try map.value(Keys.Title)
        self.text = try map.value(Keys.Text)
        self.imageUrl = try map.value(Keys.ImageUrl, using: URLTransform())
        self.audioUrl = try map.value(Keys.AudioUrl, using: URLTransform())
        print("oop \(self.audioUrl)")
    }
}
