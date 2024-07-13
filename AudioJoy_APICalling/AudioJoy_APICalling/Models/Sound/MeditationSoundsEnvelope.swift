//
//  MeditationSoundsEnvelope.swift
//  Audiojoy
//
//  Created by Anna Korolyova on 19.09.17.
//  Copyright © 2017 Pitashi. All rights reserved.
//

import Foundation
import ObjectMapper

struct MeditationSoundsEnvelope {
    let sounds: [MeditationSound]
}

extension MeditationSoundsEnvelope: ImmutableMappable {
    private enum Keys {
        static let Sounds = "sounds"
    }

    init(map: Map) throws {
        sounds = try map.value(Keys.Sounds)
    }
}
