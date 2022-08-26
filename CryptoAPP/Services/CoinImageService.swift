//
//  CoinImageService.swift
//  CryptoAPP
//
//  Created by Ivo on 2022/08/26.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var coinSubscription: AnyCancellable?
    private let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinImage(urlString: coin.image)
    }
    
    private func getCoinImage(urlString: String) {
        guard
            let url = URL(string: urlString)
        else {
            return
        }
        
        coinSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage)  in
                guard let self = self else { return }
                self.image = returnedImage
                self.coinSubscription?.cancel()
            })
    }
}
