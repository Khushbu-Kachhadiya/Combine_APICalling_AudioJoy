//
//  API.swift
//  AudioJoy_APICalling
//
//  Created by Developer on 11/07/24.
//

import Foundation

// MARK: - API
enum API {
    case fetchDailyEnvelope(model:FetchEnvelopePostModel)
    case postSearch(model:SearchItemPostModel)
    case postEmail(model:EmailPostModel)
    case postPromoCode(code:String)
    
    case getApp(id:Int)
    case getTopic(id:Int)
    case getCategory(id:Int)
    case getContentgroup(id:Int)
    case getContent(id:Int)
    case getPublisher(id:Int)
    case getPromos(appId:Int)
    case getSounds(appId:Int)
    case getBook(isInSpanish:Bool)
}

// MARK: - APIProtocol
extension API: APIProtocol {
    var baseURL: String {
        switch self {
        case .getBook(isInSpanish: let isInSpanish): return isInSpanish ? "https://s3.us-west-1.amazonaws.com/data.audiojoy/SpanishCopy.json" : "https://audiojoy.pitashi.io/"
        default:
            return "https://audiojoy.pitashi.io/"
        }
    }
    
    var path: String {
        switch self {
        case .fetchDailyEnvelope: return "api/aabigbook/v1/postdaily.php"
        case .postSearch: return "api/aabigbook/v1/postsearch.php"
        case .postEmail: return "api/aabigbook/v1/postemail.php"
        case .postPromoCode: return "api/aabigbook/v1/postpromocode.php"
        case .getApp(id: let id): return "api/aabigbook/v1/getapp.php?id=\(id)"
        case .getTopic(id: let id): return "api/aabigbook/v1/gettopic.php?id=\(id)"
        case .getCategory(id: let id): return "api/aabigbook/v1/getcategory.php?id=\(id)"
        case .getContentgroup(id: let id): return "api/aabigbook/v1/getcontentgroup.php?id=\(id)"
        case .getContent(id: let id): return "api/aabigbook/v1/getcontent.php?id=\(id)"
        case .getPublisher(let id): return "api/aabigbook/v1/getpublisher.php?id=\(id)"
        case .getPromos(let appId): return "api/aabigbook/v1/getpromos.php?appid=\(appId)"
        case .getSounds(let appId): return "api/aabigbook/v1/getsounds.php?appid=\(appId)"
        case .getBook(isInSpanish: let isInSpanish): return isInSpanish ? "" : "api/aabigbook/v1/getbook.php?id=1"
        }
    }
    
    var method: APIMethod {
        switch self {
        case .fetchDailyEnvelope, .postSearch, .postEmail, .postPromoCode:
            return .post
        case .getApp, .getTopic, .getCategory, .getContentgroup, .getContent, .getPublisher, .getPromos, .getSounds, .getBook:
            return .get
        }
    }
    
    var task: Request {
        switch self {
        case .fetchDailyEnvelope(model: let model): return .jsonEncoding(model.asDictionary)
        case .postSearch(model: let model): return .jsonEncoding(model.asDictionary)
        case .postEmail(model: let model): return .jsonEncoding(model.asDictionary)
        case .postPromoCode(code: let code): return .jsonEncoding(["promo_code": code])
        case .getApp, .getTopic, .getCategory, .getContentgroup, .getContent, .getPublisher, .getPromos, .getSounds, .getBook: return .requestPlain
        }
    }
    
    var header: [String: String] {
        let username = "api@audiojoy.com"
        let password = "#VE}*b[$9@"
        guard let encodedCredentials = "\(username):\(password)".data(using: .utf8)?.base64EncodedString() else { return [:] }
        
        switch self {
        case .fetchDailyEnvelope, .postSearch, .postEmail, .postPromoCode, .getApp, .getTopic, .getCategory, .getContentgroup, .getContent, .getPublisher, .getPromos, .getSounds:
            return ["Authorization": "Basic \(encodedCredentials)", "Content-Type": "application/json"]
        case .getBook(isInSpanish: let isInSpanish):
            return isInSpanish ? [:] : ["Authorization": "Basic \(encodedCredentials)", "Content-Type": "application/json"]
        }
    }
}
