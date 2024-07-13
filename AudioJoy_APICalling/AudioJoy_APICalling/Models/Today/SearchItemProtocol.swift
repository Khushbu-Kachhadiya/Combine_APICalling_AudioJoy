//
//  SeachItemProtocol.swift
//  Audiojoy
//
//  Created by Anna Korolyova on 17.08.17.
//  Copyright © 2017 Pitashi. All rights reserved.
//

import UIKit
import ObjectMapper

struct SearchItemPostModel: Codable{
    var searchString:String? = ""
    var searchType:String? = "Content Groups" // SearchType cab be : Content Groups/Tracks/Publishers
    var appIsUnlocked:Bool? = true
}

class SearchGroups: ImmutableMappable {
    let speaker: [Track]
    let literature: [ContentGroup]
    let meditation: [Track]
    
    private enum Keys {
        static let meditation = "meditation"
        static let literature = "literature"
        static let speaker = "speaker"
    }
    
    required public init(map: ObjectMapper.Map) throws {
        self.speaker = try map.value(Keys.speaker)
        self.meditation = try map.value(Keys.meditation)
        self.literature = try map.value(Keys.literature)
    }
}

protocol SearchItemProtocol: ImmutableMappable {
    var title: String { get }
    var subtitle: String? { get }
    var contentAudioTime: String? { get }
}

protocol SearchGroupItemsProtocol: ImmutableMappable {
    var title: String { get }
    var subtitle: String? { get }
    var contentAudioTime: String? { get }
}

extension Track: SearchItemProtocol {
    var subtitle: String? {
        return ""
    }
}

extension ContentGroup: SearchItemProtocol {
    var contentAudioTime: String? {
        return nil
    }
    
    var title: String {
        return self.name
    }
    var subtitle: String? {
        return nil
    }
}

extension SearchContentGroup: SearchItemProtocol {
    var contentAudioTime: String? {
        return nil
    }
    
    var subtitle: String? {
        return nil
    }
}
