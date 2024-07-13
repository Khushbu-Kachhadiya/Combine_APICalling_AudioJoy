//
//  ViewController.swift
//  AudioJoy_APICalling
//
//  Created by Developer on 11/07/24.
//

import UIKit

class ViewController: UIViewController {
    private var viewModel = TodayVM()
    private var disposeBag = Bag()
    private var input = KSSubject<TodayVM.Input>()
    
    private var bigBookViewModel = BigBookVM()
    private var bigBookinput = KSSubject<BigBookVM.Input>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //MARK: - Today
        // Uncomment it to run the all today APIs
//        bindTodayViewModel()
//        todayAPIs()
        
        //MARK: - BigBook
        bindBigBookViewModel()
        bigBookAPIs()
    }
    
    func todayAPIs(){
        //MARK: - Fetch envelop API (Today tab)
        input.send(.fetchDailyEnvelope(model: FetchEnvelopePostModel(count: 10, inspirations_seen: [0])))
        
        //MARK: - Search post (AA Big Book tab - on search icon tap)
        input.send(.postSearch(model: SearchItemPostModel(searchString: "forward")))
        
        //MARK: - Post Email
        input.send(.postEmail(model: EmailPostModel(appId: Globals.appConfiguration.identifier, email: "test@yopmail.com")))
        
        //MARK: - Post promo code
        input.send(.postPromoCode(code: "")) //Todo: need to find the code
    }
    
    func bigBookAPIs(){
        //MARK: - Get app
//        bigBookinput.send(.getAppExplore(id: 15))
        
        //MARK: - Get topic
//        bigBookinput.send(.getTopic(id: 100))
        
        //MARK: - Get category
//        bigBookinput.send(.getCategory(id: 34))
        
        //MARK: - Get Contentgroup
//        bigBookinput.send(.getContentgroup(id: 88))
        
        //MARK: - Get Content
//        bigBookinput.send(.getContent(id: 3671))
        
        //MARK: - Get Publisher
//        bigBookinput.send(.getPublisher(id: 31))
        
//        //MARK: - Get Promo
//        bigBookinput.send(.getPromos(appId: Globals.appConfiguration.identifier))
//        
//        //MARK: - Get Sound
//        bigBookinput.send(.getSounds(appId: Globals.appConfiguration.identifier))
        
        //MARK: - Get Book
        bigBookinput.send(.getBook(isInSpanish: true)) // Note: - To get the booklist in the spanish set "isInSpanish" to true other wise it will return list in english
    }
}

//MARK: - API call
extension ViewController{
    private func bindTodayViewModel() {
        viewModel.transform(input: input.eraseToAnyPublisher()).sink { event in
            switch event {
            case let .loader(isLoading): print("isLoading --- : \(isLoading)")
            case let .showError(msg): print("Error --- : \(msg)")
            case .fetchDailyEnvelopeSuccess: print("API call success --- : fetchDailyEnvelopeSuccess")
            case .postSearchSuccess: print("API call success --- : postSearchSuccess")
            case .postEmailSuccess: print("API call success --- : postEmailSuccess")
            case .postPromoCodeSuccess: print("API call success --- : postPromoCodeSuccess")
            }
        }.store(in: &disposeBag)
    }
    
    private func bindBigBookViewModel() {
        bigBookViewModel.transform(input: bigBookinput.eraseToAnyPublisher()).sink { event in
            switch event {
            case let .loader(isLoading): print("isLoading --- : \(isLoading)")
            case let .showError(msg): print("Error --- : \(msg)")
            case .getAppExploreSuccess: print("API call success --- : getAppExploreSuccess")
            case .getTopicSuccess: print("API call success --- : getTopicSuccess")
            case .getCategorySuccess: print("API call success --- : getCategorySuccess")
            case .getContentgroupSuccess: print("API call success --- : getContentgroupSuccess")
            case .getContentSuccess: print("API call success --- : getContentSuccess")
            case .getPublisherSuccess: print("API call success --- : getPublisherSuccess")
            case .getPromosSuccess: print("API call success --- : getPromosSuccess")
            case .getSoundsSuccess: print("API call success --- : getSoundsSuccess")
            case .getBookSuccess: print("API call success --- : getBookSuccess")
            }
        }.store(in: &disposeBag)
    }
}

