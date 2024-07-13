//
//  Screen.swift
//  Audiojoy
//
//  Created by Anna Korolyova on 8/1/17.
//  Copyright © 2017 Pitashi. All rights reserved.
//

import ObjectMapper

struct Screen {
    enum ScreenType: String {
        case explore
        case myContent
        case playlist
        case sounds
        case timer
        case today
        case settings
        case promos
    }

    let iconName: String
    let title: String
    let type: ScreenType
    let isFree: Bool
    let isMiniPlayerHidden: Bool
}

// MARK: - ImmutableMappable

extension Screen: ImmutableMappable {
    private enum Keys {
        static let IconName = "IconName"
        static let Title = "Title"
        static let ScreenType = "Type"
        static let IsFree = "IsFree"
        static let HideMiniPlayer = "IsMiniPlayerHidden"
    }

    init(map: Map) throws {
        self.iconName = try map.value(Keys.IconName)
        self.title = try map.value(Keys.Title)
        self.type = try map.value(Keys.ScreenType)
        self.isFree = try map.value(Keys.IsFree)

        do {
            self.isMiniPlayerHidden = try map.value(Keys.HideMiniPlayer)
        } catch {
            self.isMiniPlayerHidden = false
        }

    }
}

// MARK: - Equatable

extension Screen: Equatable {
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        return lhs.iconName == rhs.iconName &&
            lhs.title == rhs.title &&
            lhs.type == rhs.type &&
            lhs.isFree == rhs.isFree
    }
}
