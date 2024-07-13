//
//  TopicInfo.swift
//  Audiojoy
//
//  Created by Tung Fam on 1/30/19.
//  Copyright © 2019 Pitashi. All rights reserved.
//

import ObjectMapper

struct TopicInfo {
	let identifier: Int
	let tracks: [TopicTrack]
}

extension TopicInfo: ImmutableMappable {
	private enum Keys {
		static let TopicId = "topic_info.TopicId"
		static let TopicTracks = "topic_tracks"
	}

	init(map: Map) throws {
		self.identifier = try map.value(Keys.TopicId)
		self.tracks = try map.value(Keys.TopicTracks)
	}

	func mapping(map: Map) {
		self.identifier >>> map[Keys.TopicId]
		self.tracks >>> map[Keys.TopicTracks]
	}
}
