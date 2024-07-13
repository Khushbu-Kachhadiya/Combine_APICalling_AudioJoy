//
//  ExploreTopic.swift
//  Audiojoy
//
//  Created by Tung Fam on 1/15/19.
//  Copyright © 2019 Pitashi. All rights reserved.
//

import ObjectMapper

struct ExploreTopic: Equatable {
	let name: String
	let identifier: Int
}

extension ExploreTopic: ImmutableMappable {
	private enum Keys {
		static let TopicId = "TopicId"
		static let TopicName = "TopicName"
	}

	init(map: Map) throws {
		self.name = try map.value(Keys.TopicName)
		self.identifier = try map.value(Keys.TopicId)
	}

	func mapping(map: Map) {
		self.name >>> map[Keys.TopicName]
		self.identifier >>> map[Keys.TopicId]
	}
}
