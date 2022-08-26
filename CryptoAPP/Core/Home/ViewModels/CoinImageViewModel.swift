//
//  CoinImageViewModel.swift
//  CryptoAPP
//
//  Created by Ivo on 2022/08/26.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoadng: Bool = false
    
    private let dataService: CoinImageService
    private let coin: CoinModel
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.addSubscribers()
        self.isLoadng = true
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoadng = false
            } receiveValue: { [ weak self ](returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

    }
}
