//
//  ExploreEnvelope.swift
//  Audiojoy
//
//  Created by Tung Fam on 1/15/19.
//  Copyright © 2019 Pitashi. All rights reserved.
//

import Foundation
import ObjectMapper

struct ExploreEnvelope {
	let appInfo: AppInfo
	let speakers: [ExploreCategory]
	let literature: [ExploreLiteratureTopic]
	let meditation: [ExploreCategory]
	let speakerFeatured: [ExploreSpeakerFeatured]
	let literatureFeatured: [ExploreLiteratureFeatured]
	let meditationFeatured: [ExploreMeditationFeatured]
}

extension ExploreEnvelope: ImmutableMappable {
	private enum Keys {
		static let Info = "app_info"
		static let Speakers = "speakers"
		static let Literature = "literature"
		static let Meditation = "meditation"
		static let SpeakerFeatured = "speaker_featured"
		static let LiteratureFeatured = "literature_featured"
		static let MeditationFeatured = "meditation_featured"
	}

	init(map: Map) throws {
		self.appInfo = try map.value(Keys.Info)
		self.speakers = try map.value(Keys.Speakers)
		self.literature = try map.value(Keys.Literature)
		self.meditation = try map.value(Keys.Meditation)
		self.speakerFeatured = try map.value(Keys.SpeakerFeatured)
		self.literatureFeatured = try map.value(Keys.LiteratureFeatured)
		self.meditationFeatured = try map.value(Keys.MeditationFeatured)
	}

	func mapping(map: Map) {
		self.appInfo >>> map[Keys.Info]
		self.speakers >>> map[Keys.Speakers]
		self.meditation >>> map[Keys.Meditation]
		self.speakerFeatured >>> map[Keys.SpeakerFeatured]
		self.literatureFeatured >>> map[Keys.LiteratureFeatured]
		self.meditationFeatured >>> map[Keys.MeditationFeatured]
	}
}
/*
"literature_featured": [
{
"ContentGroupId": 228,
"ContentGroupName": "Motivation & Inspirational Speeches for Life Success, Happiness and Personal Power Vol 2.",
"ContentGroupShortName": "Motivation Talks",
"ContentGroupIsFree": 0,
"ContentGroupIsNew": 0,
"ContentGroupImageUrl": "http://d2q6xzim332bmh.cloudfront.net/data/imgcontentgroup/228.jpg"
},
{
"ContentGroupId": 65,
"ContentGroupName": "Al-Anon Speaker Tapes Vol. 4",
"ContentGroupShortName": "AL-ANON Speakers v4",
"ContentGroupIsFree": 0,
"ContentGroupIsNew": 0,
"ContentGroupImageUrl": "http://d2q6xzim332bmh.cloudfront.net/data/imgcontentgroup/65.jpg"
},
{
"ContentGroupId": 430,
"ContentGroupName": "AA Workshop - How to Recover from Alcoholism; A Step by Step Deep Dive by Bob D.",
"ContentGroupShortName": "How to Recover Workshop",
"ContentGroupIsFree": 0,
"ContentGroupIsNew": 0,
"ContentGroupImageUrl": "http://d2q6xzim332bmh.cloudfront.net/data/imgcontentgroup/430.jpg"
},
{
"ContentGroupId": 38,
"ContentGroupName": "Narcotics Anonymous Speaker Tapes Vol. 2",
"ContentGroupShortName": "NA Speakers v2",
"ContentGroupIsFree": 0,
"ContentGroupIsNew": 0,
"ContentGroupImageUrl": "http://d2q6xzim332bmh.cloudfront.net/data/imgcontentgroup/38.jpg"
}
],

"meditation_featured": [
{
"ContentId": 7818,
"ContentTitle": "Graceful Soft Spoken Whisper Guided Relaxation",
"ContentAudioTime": "00:07:15",
"ContentAudioUrl": "http://d2q6xzim332bmh.cloudfront.net/mp3/7818.mp3",
"CategoryId": 5,
"ContentGroupShortName": "Meditations",
"MeditationImageUrl": "http://d2q6xzim332bmh.cloudfront.net/data/imgcontentgroup/22.jpg"
},
{
"ContentId": 1842,
"ContentTitle": "Loving Practice Of Life",
"ContentAudioTime": "00:03:00",
"ContentAudioUrl": "http://d2q6xzim332bmh.cloudfront.net/mp3/1842.mp3",
"CategoryId": 5,
"ContentGroupShortName": "Meditations",
"MeditationImageUrl": "http://d2q6xzim332bmh.cloudfront.net/data/imgcontentgroup/19.jpg"
},
{
"ContentId": 14330,
"ContentTitle": "Pain Relief And Pain Management - Guided Meditation",
"ContentAudioTime": "00:32:06",
"ContentAudioUrl": "http://d2q6xzim332bmh.cloudfront.net/mp3/14330.mp3",
"CategoryId": 5,
"ContentGroupShortName": "Meditations",
"MeditationImageUrl": "http://d2q6xzim332bmh.cloudfront.net/data/imgcontentgroup/525.jpg"
},
{
"ContentId": 17083,
"ContentTitle": "The Clever Fox",
"ContentAudioTime": "",
"ContentAudioUrl": "http://d2q6xzim332bmh.cloudfront.net/mp3/17083.mp3",
"CategoryId": 5,
"ContentGroupShortName": "Meditations",
"MeditationImageUrl": "http://d2q6xzim332bmh.cloudfront.net/data/imgcontentgroup/645.jpg"
}
]
*/
