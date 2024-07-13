//
//  TodayVM.swift
//  AudioJoy_APICalling
//
//  Created by Developer on 11/07/24.
//

import Foundation

final class TodayVM: BaseVM {
    // MARK: - Properties
    private var taskDisposeBag = TaskBag()
    var disposeBag = Bag()
    var output = KSSubject<Output>()
    var networkService: NetworkService

    // MARK: - LifeCycle
    init(networkService: NetworkService = NetworkManager()) {
        self.networkService = networkService
    }

    // MARK: - Input && Output
    enum Input {
        case fetchDailyEnvelope(model: FetchEnvelopePostModel)
        case postSearch(model: SearchItemPostModel)
        case postEmail(model: EmailPostModel)
        case postPromoCode(code: String)
    }

    enum Output {
        case loader(isLoading: Bool)
        case showError(msg:String)
        case fetchDailyEnvelopeSuccess
        case postSearchSuccess
        case postEmailSuccess
        case postPromoCodeSuccess
    }

    // MARK: - Functions
    func transform(input: KSAnyPublisher<Input>) -> KSAnyPublisher<Output> {
        input.sink { [weak self] event in
            switch event {
            case .fetchDailyEnvelope(model: let model):
                self?.fetchDailyEnvelope(model: model)
            case .postSearch(model: let model):
                self?.postSearch(model: model)
            case .postEmail(model: let model):
                self?.postEmail(model: model)
            case .postPromoCode(code: let code):
                self?.postPromoCode(code: code)
            }
        }.store(in: &disposeBag)
        return output.eraseToAnyPublisher()
    }
    
    private func fetchDailyEnvelope(model: FetchEnvelopePostModel) {
        output.send(.loader(isLoading: true))
        Task {
            do {
                let responseModel = try await networkService.fetchDailyEnvelope(model: model)
                print("***** Response *****: \n \(responseModel)")
                output.send(.loader(isLoading: false))
                output.send(.fetchDailyEnvelopeSuccess)
            } catch let error as APIError {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            } catch {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            }
        }.store(in: &taskDisposeBag)
    }
    
    private func postSearch(model: SearchItemPostModel) {
        output.send(.loader(isLoading: true))
        Task {
            do {
                let responseModel = try await networkService.postSearch(model: model)
                print("***** Response *****: \n \(responseModel)")
                print("Speaker: \(responseModel.speaker) \n\nLiterature: \(responseModel.literature) \n\nMeditation: \(responseModel.meditation)")
                output.send(.loader(isLoading: false))
                output.send(.postSearchSuccess)
            } catch let error as APIError {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            } catch {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            }
        }.store(in: &taskDisposeBag)
    }
    
    private func postEmail(model: EmailPostModel) {
        output.send(.loader(isLoading: true))
        Task {
            do {
                let responseModel = try await networkService.postEmail(model: model)
                print("***** Response *****: \n \(responseModel.status) \n\(responseModel.statusResult)")
                output.send(.loader(isLoading: false))
                output.send(.postEmailSuccess)
            } catch let error as APIError {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            } catch {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            }
        }.store(in: &taskDisposeBag)
    }
    
    private func postPromoCode(code: String) {
        output.send(.loader(isLoading: true))
        Task {
            do {
                let responseModel = try await networkService.postPromoCode(code: code)
                print("***** Response *****: \n \(responseModel)")
                output.send(.loader(isLoading: false))
                output.send(.postSearchSuccess)
            } catch let error as APIError {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            } catch {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            }
        }.store(in: &taskDisposeBag)
    }
}
