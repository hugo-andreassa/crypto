//
//  CoinExchangeData.swift
//  Crypto
//
//  Created by Virtual Machine on 22/09/21.
//

import Foundation

struct CoinAssetData: Decodable {
    let asset_id: String
    let name: String
    let price_usd: Double
    let volume_1hrs_usd: Double
    let volume_1day_usd: Double
    let volume_1mth_usd: Double
}
