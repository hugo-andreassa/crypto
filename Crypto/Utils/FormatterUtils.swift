//
//  FormatterUtils.swift
//  Crypto
//
//  Created by Virtual Machine on 22/09/21.
//

import Foundation

enum Currency: String {
    case br = "pt-BR"
    case us = "en-US"
}

class FormatterUtils {
    static func formatToCurrency(_ value: Double, currency: Currency) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: currency.rawValue)
        formatter.numberStyle = .currency
        
        guard let formattedValue = formatter.string(from: value as NSNumber) else { return "Erro" }
        
        return formattedValue
    }
}
