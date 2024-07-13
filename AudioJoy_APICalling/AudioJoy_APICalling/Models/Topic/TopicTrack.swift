//
//  TopicTrack.swift
//  Audiojoy
//
//  Created by Tung Fam on 1/30/19.
//  Copyright © 2019 Pitashi. All rights reserved.
//

import ObjectMapper
import Foundation

struct TopicTrack: Equatable {
	let contentId: Int
	let title: String
    let lowercasedTitle: String
	let audioUrl: URL
	let audioTime: String
	let isFree: Bool
    var presentableDuration: String
    var timeDate: Date
}

private var formatter: DateFormatter = {
    var dateFormatter = DateFormatter()
    dateFormatter.timeZone = .current
    dateFormatter.dateFormat = "HH:mm:ss"
    return dateFormatter
}()

extension TopicTrack: ImmutableMappable {
	private enum Keys {
		static let ContentId = "ContentId"
		static let ContentTitle = "ContentTitle"
		static let ContentAudioUrl = "ContentAudioUrl"
		static let ContentAudioTime = "ContentAudioTime"
		static let ContentIsFree = "ContentIsFree"
	}

	init(map: Map) throws {
		self.contentId = try map.value(Keys.ContentId)
		self.title = try map.value(Keys.ContentTitle)
		self.audioUrl = try map.value(Keys.ContentAudioUrl, using: URLTransform())
		self.audioTime = try map.value(Keys.ContentAudioTime)
		self.isFree = try map.value(Keys.ContentIsFree, using: IntToBoolTransform())
        self.lowercasedTitle = self.title.lowercased()
        let date = formatter.date(from: audioTime)
        self.timeDate = date ?? Date()
        
        guard let timeDate = date else {
            self.presentableDuration = audioTime
            return
        }
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: timeDate)
        let minutes = calendar.component(.minute, from: timeDate)
        let seconds = calendar.component(.second, from: timeDate)
        
        let minTime = String(format: "%02d:%02d", minutes, seconds)
        let duration = (hour > 0 ? String(format: "%02d:", hour) : "") + minTime
        self.presentableDuration = duration
	}

	func mapping(map: Map) {
		self.contentId >>> map[Keys.ContentId]
		self.title >>> map[Keys.ContentTitle]
		self.audioUrl >>> map[Keys.ContentAudioUrl]
		self.audioTime >>> map[Keys.ContentAudioTime]
		self.isFree >>> map[Keys.ContentIsFree]
	}
}
