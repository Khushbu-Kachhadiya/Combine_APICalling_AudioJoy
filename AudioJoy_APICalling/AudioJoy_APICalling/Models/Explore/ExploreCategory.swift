//
//  ExploreCategory.swift
//  Audiojoy
//
//  Created by Tung Fam on 1/15/19.
//  Copyright © 2019 Pitashi. All rights reserved.
//

import ObjectMapper

struct ExploreCategory {
	let identifier: Int
	let name: String
	let topics: [ExploreTopic]
}

extension ExploreCategory: ImmutableMappable {
	private enum Keys {
		static let CategoryId = "CategoryId"
		static let CategoryName = "CategoryName"
		static let Topics = "Topics"
	}

	init(map: Map) throws {
		self.identifier = try map.value(Keys.CategoryId)
		self.name = try map.value(Keys.CategoryName)
		self.topics = try map.value(Keys.Topics)
	}

	func mapping(map: Map) {
		self.identifier >>> map[Keys.CategoryId]
		self.name >>> map[Keys.CategoryName]
		self.topics >>> map[Keys.Topics]
	}
}
