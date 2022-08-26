//
//  HomeViewModel.swift
//  CryptoAPP
//
//  Created by Ivo on 2022/08/26.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portFolioCoins: [CoinModel] = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init () {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.allCoins.append(DeveloperPreview.instance.coin)
//            self.portFolioCoins.append(DeveloperPreview.instance.coin)
//
//        }
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self ](returnedCoins) in
                guard let self = self else {return}
                self.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}
