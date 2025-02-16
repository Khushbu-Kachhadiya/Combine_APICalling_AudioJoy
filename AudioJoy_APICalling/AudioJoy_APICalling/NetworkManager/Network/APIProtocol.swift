//
//  APIProtocol.swift
//  AudioJoy_APICalling
//
//  Created by Developer on 11/07/24.
//

import Foundation

// MARK: - APIProtocol
protocol APIProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: APIMethod { get }
    var task: Request { get }
    var header: [String: String] { get }

    func asURLRequest() throws -> URLRequest
}

extension APIProtocol {
    func asURLRequest() throws -> URLRequest {
        guard var urlBuilder = URLComponents(string: baseURL + path) else {
            throw APIError.invalidURL(urlStr: baseURL + path)
        }
        if !task.queryItem.isEmpty {
            urlBuilder.queryItems = task.queryItem
            urlBuilder.percentEncodedQuery = urlBuilder.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        }
        guard let url = urlBuilder.url else {
            throw APIError.invalidURL(urlStr: urlBuilder.url?.absoluteString ?? "")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = header
        urlRequest.httpMethod = method.rawValue.uppercased()
        if let bodyParams = task.jsonBody {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: bodyParams, options: [])
        }
        if let multiPart = task.formData {
            urlRequest.addValue(multiPart.httpContentTypeHeadeValue, forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = multiPart.httpBody
        }
        #if DEBUG
            print("\n***** cURL *****:\n \(urlRequest.curlString)")
        #endif
        return urlRequest
    }
}
