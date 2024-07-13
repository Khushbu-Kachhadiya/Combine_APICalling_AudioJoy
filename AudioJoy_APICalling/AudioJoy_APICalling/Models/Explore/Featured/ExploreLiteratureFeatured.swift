//
//  ExploreLiteratureFeatured.swift
//  Audiojoy
//
//  Created by Tung Fam on 1/17/19.
//  Copyright © 2019 Pitashi. All rights reserved.
//

import ObjectMapper

struct ExploreLiteratureFeatured {
	let isFree: Bool
	let contentId: Int
	let contentName: String
	let contentGroupShortName: String
	let imageUrl: String
}

extension ExploreLiteratureFeatured: ImmutableMappable {
	private enum Keys {
		static let ContentGroupIsFree = "ContentGroupIsFree"
		static let ContentGroupId = "ContentGroupId"
		static let ContentGroupName = "ContentGroupName"
		static let ContentGroupShortName = "ContentGroupShortName"
		static let ContentGroupImageUrl = "ContentGroupImageUrl"
	}

	init(map: Map) throws {
		self.isFree = try map.value(Keys.ContentGroupIsFree)
		self.contentId = try map.value(Keys.ContentGroupId)
		self.contentName = try map.value(Keys.ContentGroupName)
		self.contentGroupShortName = try map.value(Keys.ContentGroupShortName)
		self.imageUrl = try map.value(Keys.ContentGroupImageUrl)
	}

	func mapping(map: Map) {
		self.isFree >>> map[Keys.ContentGroupIsFree]
		self.contentId >>> map[Keys.ContentGroupId]
		self.contentName >>> map[Keys.ContentGroupName]
		self.contentGroupShortName >>> map[Keys.ContentGroupShortName]
		self.imageUrl >>> map[Keys.ContentGroupImageUrl]
	}
}
