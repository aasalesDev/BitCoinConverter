//
//  APIService.swift
//  ByteCoin
//
//  Created by Anderson Sales on 16/01/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

protocol APIServiceProtocol: GenericService {
    func getDataWithURLSession(completion: completion<CoinModel?>)
}

class APIService {
    
    public func getDataWithURLSession(baseUrl: String, cripto: String, currency: String, apiKey: String, onCompletion: @escaping (CoinModel?) -> Void) {
       
        let urlString: String = baseUrl + cripto + currency + apiKey
    
        guard let url: URL = URL(string: urlString) else { return }
                
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                if let apiResponse = try? JSONDecoder().decode(CoinModel.self, from: data) {
                    onCompletion(apiResponse)
                } else {
                    print("Parse Error")
                }
            } else if let error = error {
                print(error.localizedDescription)
                onCompletion(nil)
            }
        }.resume()
    }
}

