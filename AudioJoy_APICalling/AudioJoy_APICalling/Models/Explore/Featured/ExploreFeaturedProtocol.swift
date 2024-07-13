//
//  ExploreFeaturedProtocol.swift
//  Audiojoy
//
//  Created by Tung Fam on 1/17/19.
//  Copyright © 2019 Pitashi. All rights reserved.
//

import Foundation

protocol ExploreFeaturedProtocol {
	var title: String { get }
	var identifier: Int { get }
	var imageUrl: String { get }
    var audioUrl: String { get }

}

// MARK: - ExploreSpeakerFeatured

extension ExploreSpeakerFeatured: ExploreFeaturedProtocol {
	var title: String {
		return contentTitle
	}
	var identifier: Int {
		return contentId
	}

	var imageUrl: String {
		return speakerImageUrl
	}
    
    var audioUrl: String {
        return contentAudioUrl
    }
}

// MARK: - ExploreLiteratureFeatured

extension ExploreLiteratureFeatured: ExploreFeaturedProtocol {
	var title: String {
		return contentName
	}
	var identifier: Int {
		return contentId
	}
    
    var audioUrl: String {
        return ""
    }
}

// MARK: - ExploreMeditationFeatured

extension ExploreMeditationFeatured: ExploreFeaturedProtocol {
	var title: String {
		return contentTitle
	}
	var identifier: Int {
		return contentId
	}
}
