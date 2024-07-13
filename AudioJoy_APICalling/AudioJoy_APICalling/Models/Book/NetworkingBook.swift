//
//  NetworkingBook.swift
//  Audiojoy
//
//  Created by Tung Fam on 11/1/18.
//  Copyright © 2018 Pitashi. All rights reserved.
//

// swiftlint:disable identifier_name

import Foundation
import ObjectMapper

struct NetworkingBook {
    let book_info: [NetworkingBookInfo]
    let book_pages: [NetworkingBookSection]
}

extension NetworkingBook: ImmutableMappable {
    private enum Keys {
        static let book_info = "book_info"
        static let book_pages = "book_pages"
    }

    init(map: Map) throws {
        self.book_info = try map.value(Keys.book_info)
        self.book_pages = try map.value(Keys.book_pages)
    }
}

extension NetworkingBook: Equatable {
    static func == (lhs: NetworkingBook, rhs: NetworkingBook) -> Bool {
        return lhs.book_info == rhs.book_info &&
            lhs.book_pages == rhs.book_pages
    }
}

struct NetworkingBookInfo {
    let BookId: Int
    let BookTitle: String
    let BookDescription: String
}

extension NetworkingBookInfo: ImmutableMappable {
    private enum Keys {
        static let BookId = "BookId"
        static let BookTitle = "BookTitle"
        static let BookDescription = "BookDescription"
    }

    init(map: Map) throws {
        self.BookId = try map.value(Keys.BookId)
        self.BookTitle = try map.value(Keys.BookTitle)
        self.BookDescription = try map.value(Keys.BookDescription)
    }
}

extension NetworkingBookInfo: Equatable {
    static func == (lhs: NetworkingBookInfo, rhs: NetworkingBookInfo) -> Bool {
        return lhs.BookId == rhs.BookId &&
            lhs.BookTitle == rhs.BookTitle && 
        lhs.BookDescription == rhs.BookDescription
    }
}

struct NetworkingBookSection {
    let SectionTitle: String
    let SectionId: Int
    let Chapters: [NetworkingBookChapter]
}

extension NetworkingBookSection: ImmutableMappable {
    private enum Keys {
        static let SectionTitle = "SectionTitle"
        static let SectionId = "SectionId"
        static let Chapters = "Chapters"
    }

    init(map: Map) throws {
        self.SectionTitle = try map.value(Keys.SectionTitle)
        self.SectionId = try map.value(Keys.SectionId)
        self.Chapters = try map.value(Keys.Chapters)
    }
}

extension NetworkingBookSection: Equatable {
    static func == (lhs: NetworkingBookSection, rhs: NetworkingBookSection) -> Bool {
        return lhs.SectionTitle == rhs.SectionTitle &&
        lhs.SectionId == rhs.SectionId &&
        lhs.Chapters == rhs.Chapters
    }
}

struct NetworkingBookChapter {
    let ChapterTitle: String
    let ChapterIsFree: Int
    let ChapterNumber: Int?
    let ChapterId: Int
    let Pages: [NetworkingBookPage]
}

extension NetworkingBookChapter: ImmutableMappable {
    private enum Keys {
        static let ChapterTitle = "ChapterTitle"
        static let ChapterIsFree = "ChapterIsFree"
        static let ChapterNumber = "ChapterNumber"
        static let ChapterId = "ChapterId"
        static let Pages = "Pages"
    }

    init(map: Map) throws {
        self.ChapterTitle = try map.value(Keys.ChapterTitle)
        self.ChapterIsFree = try map.value(Keys.ChapterIsFree)
        self.ChapterNumber = try map.value(Keys.ChapterNumber)
        self.ChapterId = try map.value(Keys.ChapterId)
        self.Pages = try map.value(Keys.Pages)
    }
}

extension NetworkingBookChapter: Equatable {
    static func == (lhs: NetworkingBookChapter, rhs: NetworkingBookChapter) -> Bool {
        return lhs.ChapterTitle == rhs.ChapterTitle &&
        lhs.ChapterIsFree == rhs.ChapterIsFree &&
        lhs.ChapterNumber == rhs.ChapterNumber &&
        lhs.ChapterId == rhs.ChapterId &&
        lhs.Pages == rhs.Pages
    }
}

struct NetworkingBookPage {
    let PageId: Int
    let PageNumber: Int?
    let PageText: String
    let PageAudioUrl: String
}

extension NetworkingBookPage: ImmutableMappable {
    private enum Keys {
        static let PageId = "PageId"
        static let PageNumber = "PageNumber"
        static let PageText = "PageText"
        static let PageAudioUrl = "PageAudioUrl"
    }

    init(map: Map) throws {
        self.PageId = try map.value(Keys.PageId)
        self.PageNumber = try map.value(Keys.PageNumber)
        self.PageText = try map.value(Keys.PageText)
        self.PageAudioUrl = try map.value(Keys.PageAudioUrl)
    }
}

extension NetworkingBookPage: Equatable {
    static func == (lhs: NetworkingBookPage, rhs: NetworkingBookPage) -> Bool {
        return lhs.PageId == rhs.PageId &&
        lhs.PageNumber == rhs.PageNumber &&
        lhs.PageText == rhs.PageText &&
        lhs.PageAudioUrl == rhs.PageAudioUrl
    }
}
