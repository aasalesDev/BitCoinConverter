//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerProtocol: AnyObject {
    func success()
    func error()
}

class CoinManager {
    
    private let baseUrl: String = "https://rest.coinapi.io/v1/exchangerate"
    private let key: String = "?apikey=688F2EFE-5FB6-4143-9050-AA647D80632C"
    private let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    private var rate: Double?
    
    weak private var delegate: CoinManagerProtocol?
    
    public func delegate(delegate: CoinManagerProtocol?) {
        self.delegate = delegate
    }

    func getCoinPrice(for currency: String) {
        APIService().getDataWithURLSession (baseUrl: baseUrl, cripto: "/BTC", currency: "/\(currency)", apiKey: key) { result in
            if let response = result {
                self.rate = response.rate
                self.delegate?.success()
            } else {
                self.delegate?.error()
            }
        }
    }
    
    var currencyRate: String? {
        let rateString = "\((round((rate ?? 0) * 100) / 100))"
        return rateString
    }
    
    func getCurrencies(index: Int) -> String {
        return currencyArray[index]
    }
    
    var numberOfRowsInComponent: Int {
        return currencyArray.count
    }
}
