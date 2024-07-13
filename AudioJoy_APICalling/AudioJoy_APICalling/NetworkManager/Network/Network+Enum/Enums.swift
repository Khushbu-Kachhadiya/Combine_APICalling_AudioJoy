//
//  Enums.swift
//  AudioJoy_APICalling
//
//  Created by Developer on 11/07/24.
//

import Foundation

// MARK: - APIError
enum APIError: Error {
    case responseError(title: String, error: String)
    case badRequest
    case decodingError
    case invalidURL(urlStr: String)
    case internalServerError
    case internetNotConnected
}

// MARK: - CustomStringConvertible
extension APIError: CustomStringConvertible {
    var description: String {
        switch self {
        case .badRequest:
            return "Api request is bad."
        case .decodingError:
            return "Data could not be decodable."
        case let .invalidURL(urlStr):
            return "\(urlStr) is invalid url."
        case .responseError(_, let error):
            return error
        case .internalServerError:
            return "Internal server error."
        case .internetNotConnected:
            return "Internet connection not Available!"
        }
    }
    
    var title: String {
        switch self {
        case .responseError(let title, _):
            return title
        default:
            return "Error"
        }
    }
}

// MARK: - APIMethod
enum APIMethod: String {
    case get, post, put, patch, delete
}

// MARK: - Request
enum Request {
    case jsonEncoding(_ model: [String: Any]?)
    case queryString(_ dict: [String: Any]?)
    case multiPart(_ multiPart: MultipartRequest)
    case requestPlain

    var jsonBody: [String: Any]? {
        switch self {
        case let .jsonEncoding(model):
            return model
        case .queryString, .multiPart, .requestPlain: return nil
        }
    }

    var queryItem: [URLQueryItem] {
        switch self {
        case .jsonEncoding, .multiPart, .requestPlain:
            return []
        case let .queryString(dict):
            return dict?.asQueryParam ?? []
        }
    }

    var formData: MultipartRequest? {
        switch self {
        case .jsonEncoding, .queryString, .requestPlain: return nil
        case let .multiPart(multiPart):
            return multiPart
        }
    }
}
