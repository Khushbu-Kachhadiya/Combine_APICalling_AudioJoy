//
//  NetworkManager.swift
//  AudioJoy_APICalling
//
//  Created by Developer on 11/07/24.
//

import Foundation

final class NetworkManager: NetworkService {
    func getBook(isInSpanish:Bool) async throws -> NetworkingBook {
        return try await APIService.request(API.getBook(isInSpanish: isInSpanish))
    }
    
    func getPublisher(id: Int) async throws -> PublisherEnvelope {
        return try await APIService.request(API.getPublisher(id: id))
    }
    
    func getPromos(appId: Int) async throws -> [Promo] {
        return try await APIService.request(API.getPromos(appId: appId))
    }
    
    func getSounds(appId: Int) async throws -> MeditationSoundsEnvelope {
        return try await APIService.request(API.getSounds(appId: appId))
    }
    
    func getContent(id: Int) async throws -> [TrackInfo] {
        return try await APIService.request(API.getContent(id: id))
    }
    
    func getContentgroup(id: Int) async throws -> ContentGroupEnvelope {
        return try await APIService.request(API.getContentgroup(id: id))
    }
    
    func getTopic(id: Int) async throws -> TopicInfo {
        return try await APIService.request(API.getTopic(id: id))
    }
    
    func getCategory(id: Int) async throws -> AppCategoryEnvelope {
        return try await APIService.request(API.getCategory(id: id))
    }
    
    func getAppExplore(id: Int) async throws -> ExploreEnvelope {
        return try await APIService.request(API.getApp(id: id))
    }
    
    func postPromoCode(code: String) async throws -> PromoCodeStatus {
        return try await APIService.request(API.postPromoCode(code: code))
    }
    
    func postEmail(model: EmailPostModel) async throws -> PostEmail {
        return try await APIService.request(API.postEmail(model: model))
    }
    
    func postSearch(model: SearchItemPostModel) async throws -> SearchGroups {
        return try await APIService.request(API.postSearch(model: model))
    }
    
    func fetchDailyEnvelope(model: FetchEnvelopePostModel) async throws -> ApiTodayEnvelope {
        return try await APIService.request(API.fetchDailyEnvelope(model: model))
    }
}
