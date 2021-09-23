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
    let volume1Hrs: Double
    let volume1Day: Double
    let volume1Mth: Double
    
    private let formatterUtils = FormatterUtils()
    
    var formattedValue: String {
        return formatterUtils.formatToCurrency(self.value, currency: .us)
    }
    var formattedVolume1Hrs: String {
        return formatterUtils.formatToCurrency(self.volume1Hrs, currency: .us)
    }
    var formattedVolume1Day: String {
        return formatterUtils.formatToCurrency(self.volume1Day, currency: .us)
    }
    var formattedVolume1Mth: String {
        return formatterUtils.formatToCurrency(self.volume1Mth, currency: .us)
    }
}
