//
//  MeditationSound.swift
//  Audiojoy
//
//  Created by Anna Korolyova on 19.09.17.
//  Copyright © 2017 Pitashi. All rights reserved.
//

import Foundation
import ObjectMapper

struct MeditationSound {
    let identifier: Int
    let title: String
    let audioUrl: String
    let category: String
    let isFree: Bool
}

extension MeditationSound: ImmutableMappable {
    private enum Keys {
        static let Identifier = "Id"
        static let Title = "SoundTitle"
        static let AudioUrl = "SoundAudioUrl"
        static let Category = "SoundCategory"
        static let IsFree = "SoundIsFree"
    }

    init(map: Map) throws {
        self.identifier = try map.value(Keys.Identifier)
        self.title = try map.value(Keys.Title)
        self.audioUrl = try map.value(Keys.AudioUrl)
        self.category = try map.value(Keys.Category)
        self.isFree = try map.value(Keys.IsFree, using: IntToBoolTransform())
    }
}

extension MeditationSound: Equatable {
    static func == (lhs: MeditationSound, rhs: MeditationSound) -> Bool {
        return lhs.identifier == rhs.identifier &&
            lhs.title == rhs.title &&
            lhs.audioUrl == rhs.audioUrl &&
            lhs.category == rhs.category &&
            lhs.isFree == rhs.isFree
    }
}
