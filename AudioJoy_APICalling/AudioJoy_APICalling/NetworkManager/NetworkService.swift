//
//  NetworkService.swift
//  AudioJoy_APICalling
//
//  Created by Developer on 11/07/24.
//

import Foundation

protocol NetworkService {
    func fetchDailyEnvelope(model:FetchEnvelopePostModel) async throws -> ApiTodayEnvelope
    func postSearch(model:SearchItemPostModel) async throws -> SearchGroups
    func postEmail(model:EmailPostModel) async throws -> PostEmail
    func postPromoCode(code:String) async throws -> PromoCodeStatus // Todo: Change response model once API start working
    
    func getAppExplore(id:Int) async throws -> ExploreEnvelope
    func getTopic(id:Int) async throws -> TopicInfo
    func getCategory(id:Int) async throws -> AppCategoryEnvelope
    func getContentgroup(id:Int) async throws -> ContentGroupEnvelope
    func getContent(id:Int) async throws -> [TrackInfo]
    func getPublisher(id:Int) async throws -> PublisherEnvelope
    func getPromos(appId:Int) async throws -> [Promo]
    func getSounds(appId:Int) async throws -> MeditationSoundsEnvelope
    func getBook(isInSpanish:Bool) async throws -> NetworkingBook
}
