//
//  Track.swift
//  Audiojoy
//
//  Created by Anna Korolyova on 30.08.17.
//  Copyright © 2017 Pitashi. All rights reserved.
//

import Foundation
import ObjectMapper

enum TrackType {
    case advice(Track)
    case contentTrack(Track)
}

struct Track {
    let identifier: Int
    let title: String
    let audioUrl: String
    let isFree: Bool?
    var contentAudioTime: String? = nil
}

class IntToBoolTransform: TransformType {
    typealias Object = Bool
    typealias JSON = Int

    public func transformFromJSON(_ value: Any?) -> Bool? {
        guard let value = value as? Int else {
            return nil
        }

        return value != 0
    }

    public func transformToJSON(_ value: Bool?) -> Int? {
        guard let value = value else {
            return nil
        }

        return value ? 1 : 0
    }
}

// MARK: - ImmutableMappable
extension Track: ImmutableMappable {
    private enum Keys {
        static let Identifier = "ContentId"
        static let Title = "ContentTitle"
        static let AudioUrl = "ContentAudioUrl"
        static let IsFree = "ContentIsFree"
        static let ContentAudioTime = "ContentAudioTime"
    }

    init(map: Map) throws {
        self.identifier = try map.value(Keys.Identifier)
        self.title = try map.value(Keys.Title)
        self.audioUrl = (try? map.value(Keys.AudioUrl)) ?? ""
        self.isFree = try? map.value(Keys.IsFree, using: IntToBoolTransform())
        self.contentAudioTime = (try? map.value(Keys.ContentAudioTime)) ?? ""
    }
}

// MARK: - Equatable
extension Track: Equatable {
    static func == (lhs: Track, rhs: Track) -> Bool {
        return lhs.identifier == rhs.identifier &&
        lhs.title == rhs.title &&
        lhs.audioUrl == rhs.audioUrl &&
        lhs.isFree == rhs.isFree
    }
}

extension TrackType: Equatable {
    static func == (lhs: TrackType, rhs: TrackType) -> Bool {
        switch (lhs, rhs) {
        case (.advice(let lTrack), .advice(let rTrack)):
            return lTrack == rTrack
        case (.contentTrack(let lTrack), .contentTrack(let rTrack)):
            return lTrack == rTrack
        default:
            return false
        }
    }
}
