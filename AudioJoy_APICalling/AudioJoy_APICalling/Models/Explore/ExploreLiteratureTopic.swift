//
//  ExploreLiteratureTopic.swift
//  Audiojoy
//
//  Created by Tung Fam on 1/17/19.
//  Copyright © 2019 Pitashi. All rights reserved.
//

import ObjectMapper

struct ExploreLiteratureTopic {
	let name: String
	let identifier: Int
}

extension ExploreLiteratureTopic {
	var exploreTopic: ExploreTopic {
		return ExploreTopic(name: name, identifier: identifier)
	}
}

extension ExploreLiteratureTopic: ImmutableMappable {
	private enum Keys {
		static let CategoryId = "CategoryId"
		static let CategoryName = "CategoryName"
	}

	init(map: Map) throws {
		self.name = try map.value(Keys.CategoryName)
		self.identifier = try map.value(Keys.CategoryId)
	}

	func mapping(map: Map) {
		self.name >>> map[Keys.CategoryName]
		self.identifier >>> map[Keys.CategoryId]
	}
}
