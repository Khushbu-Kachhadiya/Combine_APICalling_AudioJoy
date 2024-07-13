//
//  BigBookVM.swift
//  AudioJoy_APICalling
//
//  Created by Developer on 12/07/24.
//

import Foundation

final class BigBookVM: BaseVM {
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
        case getAppExplore(id:Int)
        case getTopic(id:Int)
        case getCategory(id:Int)
        case getContentgroup(id:Int)
        case getContent(id:Int)
        case getPublisher(id:Int)
        case getPromos(appId:Int)
        case getSounds(appId:Int)
        case getBook(isInSpanish:Bool)
    }

    enum Output {
        case loader(isLoading: Bool)
        case showError(msg:String)
        case getAppExploreSuccess
        case getTopicSuccess
        case getCategorySuccess
        case getContentgroupSuccess
        case getContentSuccess
        case getPublisherSuccess
        case getPromosSuccess
        case getSoundsSuccess
        case getBookSuccess
    }

    // MARK: - Functions
    func transform(input: KSAnyPublisher<Input>) -> KSAnyPublisher<Output> {
        input.sink { [weak self] event in
            switch event {
            case .getAppExplore(id: let id):
                self?.getAppExplore(id: id)
            case .getTopic(id: let id):
                self?.getTopic(id: id)
            case .getCategory(id: let id):
                self?.getCategory(id: id)
            case .getContentgroup(id: let id):
                self?.getContentgroup(id: id)
            case .getContent(id: let id):
                self?.getContent(id: id)
            case .getPublisher(id: let id):
                self?.getPublisher(id: id)
            case .getPromos(appId: let appId):
                self?.getPromos(appId: appId)
            case .getSounds(appId: let appId):
                self?.getSounds(appId: appId)
            case .getBook(isInSpanish: let isInSpanish):
                self?.getBook(isInSpanish: isInSpanish)
            }
        }.store(in: &disposeBag)
        return output.eraseToAnyPublisher()
    }
    
    private func getAppExplore(id:Int) {
        output.send(.loader(isLoading: true))
        Task {
            do {
                let responseModel = try await networkService.getAppExplore(id: id)
                print("***** Response *****: \n\(responseModel)")
                output.send(.loader(isLoading: false))
                output.send(.getAppExploreSuccess)
            } catch let error as APIError {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            } catch {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            }
        }.store(in: &taskDisposeBag)
    }
    
    private func getTopic(id:Int) {
        output.send(.loader(isLoading: true))
        Task {
            do {
                let responseModel = try await networkService.getTopic(id: id)
                print("***** Response *****: \n\(responseModel)")
                output.send(.loader(isLoading: false))
                output.send(.getTopicSuccess)
            } catch let error as APIError {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            } catch {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            }
        }.store(in: &taskDisposeBag)
    }
    
    private func getCategory(id:Int) {
        output.send(.loader(isLoading: true))
        Task {
            do {
                let responseModel = try await networkService.getCategory(id: id)
                print("***** Response *****: \n\(responseModel)")
                output.send(.loader(isLoading: false))
                output.send(.getCategorySuccess)
            } catch let error as APIError {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            } catch {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            }
        }.store(in: &taskDisposeBag)
    }
    
    private func getContentgroup(id:Int) {
        output.send(.loader(isLoading: true))
        Task {
            do {
                let responseModel = try await networkService.getContentgroup(id: id)
                print("***** Response *****: \n\(responseModel)")
                output.send(.loader(isLoading: false))
                output.send(.getContentgroupSuccess)
            } catch let error as APIError {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            } catch {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            }
        }.store(in: &taskDisposeBag)
    }
    
    private func getContent(id:Int) {
        output.send(.loader(isLoading: true))
        Task {
            do {
                let responseModel = try await networkService.getContent(id: id)
                print("***** Response *****: \n\(responseModel)")
                output.send(.loader(isLoading: false))
                output.send(.getContentSuccess)
            } catch let error as APIError {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            } catch {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            }
        }.store(in: &taskDisposeBag)
    }
    
    private func getPublisher(id: Int) {
        output.send(.loader(isLoading: true))
        Task {
            do {
                let responseModel = try await networkService.getPublisher(id: id)
                print("***** Response *****: \n\(responseModel)")
                output.send(.loader(isLoading: false))
                output.send(.getPublisherSuccess)
            } catch let error as APIError {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            } catch {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            }
        }.store(in: &taskDisposeBag)
    }
    
    private func getPromos(appId: Int) {
        output.send(.loader(isLoading: true))
        Task {
            do {
                let responseModel = try await networkService.getPromos(appId: appId)
                print("***** Response *****: \n\(responseModel)")
                output.send(.loader(isLoading: false))
                output.send(.getPromosSuccess)
            } catch let error as APIError {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            } catch {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            }
        }.store(in: &taskDisposeBag)
    }
    
    private func getSounds(appId: Int) {
        output.send(.loader(isLoading: true))
        Task {
            do {
                let responseModel = try await networkService.getSounds(appId: appId)
                print("***** Response *****: \n\(responseModel)")
                output.send(.loader(isLoading: false))
                output.send(.getSoundsSuccess)
            } catch let error as APIError {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            } catch {
                output.send(.loader(isLoading: false))
                output.send(.showError(msg: error.localizedDescription))
            }
        }.store(in: &taskDisposeBag)
    }
    
    private func getBook(isInSpanish:Bool) {
        output.send(.loader(isLoading: true))
        Task {
            do {
                let responseModel = try await networkService.getBook(isInSpanish: isInSpanish)
                print("***** Response *****: \n\(responseModel)")
                output.send(.loader(isLoading: false))
                output.send(.getBookSuccess)
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
