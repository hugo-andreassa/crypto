//
//  CoinExchangeModel.swift
//  Crypto
//
//  Created by Virtual Machine on 22/09/21.
//

import Foundation

struct CoinAssetModel {
    let assetId: String
    let name: String
    let value: Double
    
    var formattedValue: String {
        return FormatterUtils.formatToCurrency(self.value, currency: .us)
    }
    /*let volume_1hrs_usd: Double
    let volume_1day_usd: Double
    let volume_1mth_usd: Double*/
}
