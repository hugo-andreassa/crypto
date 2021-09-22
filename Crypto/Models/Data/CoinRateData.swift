//
//  CoinData.swift
//  Crypto
//
//  Created by Virtual Machine on 22/09/21.
//

import Foundation

struct CoinRateData: Decodable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
