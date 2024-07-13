//
//  Globals.swift
//  AudioJoy_APICalling
//
//  Created by Developer on 11/07/24.
//

import Foundation
import Combine

// MARK: - TypeAlice
typealias TaskBag = Set<TaskCancellable>
typealias Bag = Set<AnyCancellable>
typealias KSSubject<T> = PassthroughSubject<T, Never>
typealias KSAnyPublisher<T> = AnyPublisher<T, Never>

enum Globals{
    static var appConfiguration: Configuration {
        let configuration = Bundle.main.url(forResource: "Configuration", withExtension: "plist")
            .flatMap(NSDictionary.init)
            .flatMap { $0 as? [String: Any] }
            .flatMap { try? Configuration(JSON: $0) }
        
        if let configuration = configuration {
            return configuration
        }
        
        fatalError("Could not load app configuration.")
    }
}
