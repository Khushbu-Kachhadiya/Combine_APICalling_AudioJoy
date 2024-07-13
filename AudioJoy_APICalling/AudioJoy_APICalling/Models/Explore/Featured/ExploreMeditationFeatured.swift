//
//  ExploreMeditationFeatured.swift
//  Audiojoy
//
//  Created by Tung Fam on 1/17/19.
//  Copyright © 2019 Pitashi. All rights reserved.
//

import ObjectMapper

struct ExploreMeditationFeatured {
	let contentId: Int
	let contentTitle: String
	let audioTime: String
	let audioUrl: String
	let categoryId: Int
	let groupShortName: String
	let imageUrl: String
}

extension ExploreMeditationFeatured: ImmutableMappable {
	private enum Keys {
		static let ContentId = "ContentId"
		static let ContentTitle = "ContentTitle"
		static let ContentAudioTime = "ContentAudioTime"
		static let ContentAudioUrl = "ContentAudioUrl"
		static let CategoryId = "CategoryId"
		static let ContentGroupShortName = "ContentGroupShortName"
		static let MeditationImageUrl = "MeditationImageUrl"
	}

	init(map: Map) throws {
		self.contentId = try map.value(Keys.ContentId)
		self.contentTitle = try map.value(Keys.ContentTitle)
		self.audioTime = try map.value(Keys.ContentAudioTime)
		self.audioUrl = try map.value(Keys.ContentAudioUrl)
		self.categoryId = try map.value(Keys.CategoryId)
		self.groupShortName = try map.value(Keys.ContentGroupShortName)
		self.imageUrl = try map.value(Keys.MeditationImageUrl)
	}

	func mapping(map: Map) {
		self.contentId >>> map[Keys.ContentId]
		self.contentTitle >>> map[Keys.ContentTitle]
		self.audioTime >>> map[Keys.ContentAudioTime]
		self.audioUrl >>> map[Keys.ContentAudioUrl]
		self.categoryId >>> map[Keys.CategoryId]
		self.groupShortName >>> map[Keys.ContentGroupShortName]
		self.imageUrl >>> map[Keys.MeditationImageUrl]
	}
}
