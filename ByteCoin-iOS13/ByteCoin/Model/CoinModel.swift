//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Anderson Sales on 16/01/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel: Codable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
