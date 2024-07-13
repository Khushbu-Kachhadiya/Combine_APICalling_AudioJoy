//
//  APIService.swift
//  AudioJoy_APICalling
//
//  Created by Developer on 11/07/24.
//

import Foundation
import ObjectMapper

enum APIService {
    static func request<M: ImmutableMappable>(_ rout: APIProtocol) async throws -> M {
        let (data, res) = try await URLSession.shared.data(for: rout.asURLRequest())
        let statusCode = (res as? HTTPURLResponse)?.statusCode ?? 400
        switch statusCode {
        case 200 ... 299:
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                let mapper = Mapper<M>()
                if let result = mapper.map(JSON: json) {
                    return result
                } else {
                    throw APIError.badRequest
                }
            } else {
                throw APIError.badRequest
            }
        case 400:
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                let mapper = Mapper<M>()
                if let result = mapper.map(JSON: json) {
                    return result
                } else {
                    throw APIError.badRequest
                }
            } else {
                throw APIError.badRequest
            }
        default:
            throw APIError.badRequest
        }
    }
    
    static func request<M: ImmutableMappable>(_ rout: APIProtocol) async throws -> [M] {
        let (data, res) = try await URLSession.shared.data(for: rout.asURLRequest())
        let statusCode = (res as? HTTPURLResponse)?.statusCode ?? 400
        switch statusCode {
        case 200 ... 299:
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                let mapper = Mapper<M>()
                let result = try mapper.mapArray(JSONArray: jsonArray)
                return result
            } else {
                throw APIError.badRequest
            }
        default:
            throw APIError.badRequest
        }
    }
}
