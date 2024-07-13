//
//  ExploreSpeakerFeatured.swift
//  Audiojoy
//
//  Created by Tung Fam on 1/17/19.
//  Copyright © 2019 Pitashi. All rights reserved.
//

import ObjectMapper

struct ExploreSpeakerFeatured: Equatable {
	let contentId: Int
	let contentTitle: String
	let contentAudioUrl: String
	let contentGroupShortName: String
	let speakerImageUrl: String
}

extension ExploreSpeakerFeatured: ImmutableMappable {
	private enum Keys {
		static let ContentId = "ContentId"
		static let ContentTitle = "ContentTitle"
		static let ContentAudioUrl = "ContentAudioUrl"
		static let ContentGroupShortName = "ContentGroupShortName"
		static let SpeakerImageUrl = "SpeakerImageUrl"
	}

	init(map: Map) throws {
		self.contentId = try map.value(Keys.ContentId)
		self.contentTitle = try map.value(Keys.ContentTitle)
		self.contentAudioUrl = try map.value(Keys.ContentAudioUrl)
		self.contentGroupShortName = try map.value(Keys.ContentGroupShortName)
		self.speakerImageUrl = try map.value(Keys.SpeakerImageUrl)
	}

	func mapping(map: Map) {
		self.contentId >>> map[Keys.ContentId]
		self.contentTitle >>> map[Keys.ContentTitle]
		self.contentAudioUrl >>> map[Keys.ContentAudioUrl]
		self.contentGroupShortName >>> map[Keys.ContentGroupShortName]
		self.speakerImageUrl >>> map[Keys.SpeakerImageUrl]
	}
}
