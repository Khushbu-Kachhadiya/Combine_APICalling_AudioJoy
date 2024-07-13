//
//  Today.swift
//  Audiojoy
//
//  Created by Roman Onyshkevych on 1/23/18.
//  Copyright © 2018 Pitashi. All rights reserved.
//

import UIKit

struct Today: Equatable {
    var date: Date
    var isReflectionCompleted: Bool
    var isSpeakerCompleted: Bool
    var inspiration: TodayInspiration
    var reflection: TodayAdvice
    var speaker: TodayAdvice
}

extension Today: Hashable {
    func hash(into hasher: inout Hasher) {
            hasher.combine(date.timeIntervalSince1970.hashValue ^
            isReflectionCompleted.hashValue ^
            isSpeakerCompleted.hashValue ^
            inspiration.hashValue ^
            reflection.hashValue ^
            speaker.hashValue)
    }
}

struct TodayInspiration: Equatable {
    var identifier: Int
    var text: String
    var imageUrl: URL
}

extension TodayInspiration: Hashable {
    func hash(into hasher: inout Hasher) {
               hasher.combine(identifier.hashValue ^
               text.hashValue ^
               imageUrl.absoluteString.hashValue)
       }
}

struct TodayAdvice: Equatable {
    var identifier: Int
    var contentGroupIdentifier: Int
    var contentGroupShortName: String
    var title: String
    var text: String
    var imageUrl: URL
    var audioUrl: URL
}

extension TodayAdvice: Hashable {
    func hash(into hasher: inout Hasher) {
            hasher.combine(identifier.hashValue ^
            contentGroupIdentifier.hashValue ^
            contentGroupShortName.hashValue ^
            title.hashValue ^
            text.hashValue ^
            imageUrl.absoluteString.hashValue ^
            audioUrl.absoluteString.hashValue)
    }
}

struct TodayChallenge {
    var identifier: Int
    var title: String
    var text: String
    var source: String
    var author: String
    var imageUrl: URL
    var keyword: String
    var unsplashInfo: UnsplashInfo?
}

extension TodayChallenge: Equatable {
    static func == (lhs: TodayChallenge, rhs: TodayChallenge) -> Bool {
        return lhs.identifier == rhs.identifier &&
            lhs.title == rhs.title &&
            lhs.text == rhs.text &&
            lhs.source == rhs.source &&
            lhs.author == rhs.author &&
            lhs.imageUrl.absoluteString == rhs.imageUrl.absoluteString &&
            lhs.keyword == rhs.keyword &&
            lhs.unsplashInfo == rhs.unsplashInfo
    }
}

extension TodayChallenge: Hashable {
    func hash(into hasher: inout Hasher) {
            hasher.combine(identifier.hashValue ^
            title.hashValue ^
            text.hashValue ^
            source.hashValue ^
            author.hashValue ^
            imageUrl.absoluteString.hashValue ^
            keyword.hashValue ^
            (unsplashInfo?.hashValue ?? 0))
    }
}

struct UnsplashInfo {
    var authorname: String?
    var imageUrl: URL?
}

extension UnsplashInfo: Equatable {
    static func == (lhs: UnsplashInfo, rhs: UnsplashInfo) -> Bool {
        return lhs.authorname == rhs.authorname &&
            lhs.imageUrl == rhs.imageUrl
    }
}

extension UnsplashInfo: Hashable {
    func hash(into hasher: inout Hasher) {
            hasher.combine((authorname?.hashValue ?? 0) ^
            (imageUrl?.absoluteString.hashValue ?? 0))
    }
}

struct TodayArticle: Equatable {
    var identifier: Int
    var title: String
    var text: String
    var source: String
    var url: URL
    var imageUrl: URL
    var wasRead: Bool
}
