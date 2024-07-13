//
//  BaseVM.swift
//  AudioJoy_APICalling
//
//  Created by Developer on 11/07/24.
//

import Foundation

@MainActor protocol BaseVM {
    associatedtype Output
    associatedtype Input

    var disposeBag: Bag { get set }
    var networkService: NetworkService { get }
    var output: KSSubject<Output> { get set }

    func transform(input: KSAnyPublisher<Input>) -> KSAnyPublisher<Output>
}
