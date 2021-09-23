//
//  CoinExchangeService.swift
//  Crypto
//
//  Created by Virtual Machine on 22/09/21.
//

import Foundation

class CoinAssetService {
    
    private let filterCoins = ["BTC","ETH","BNB","XRP","DOGE","USDT","ADA","DOT","LTC","BCH"]
    
    private let apiKey = NSLocalizedString("ApiKEY", comment: "")
    private let apiUrl = NSLocalizedString("ApiURL", comment: "")
    
    func getAllAssets(completionHandler: @escaping ([CoinAssetModel]) -> Void) {
        guard let url = URL(string: String(format: "%@?filter_asset_id=%@", apiUrl + "assets", filterCoins.joined(separator: ";")))
        else { fatalError("Erro ao inicializar serviço") }
        
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: url)
        request.setValue(apiKey, forHTTPHeaderField: "X-CoinAPI-Key")
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            if let e = error {
                print(e)
            }
            
            if (response as! HTTPURLResponse).statusCode > 299 {
                print("Chamada inválida")
            }
                
            if let safeData = data {
                if let coins = self.parseJsonArray(safeData) {
                    completionHandler(coins)
                }
            }
        }
        
        task.resume()
    }
    
    private func parseJsonArray(_ data: Data) -> [CoinAssetModel]? {
         do {
             let coinData = try JSONDecoder().decode([CoinAssetData].self, from: data)
             var list = [CoinAssetModel]()
             for coin in coinData {
                 let coinModel = CoinAssetModel(
                    assetId: coin.asset_id,
                    name: coin.name,
                    value: coin.price_usd,
                    volume1Hrs: coin.volume_1hrs_usd,
                    volume1Day: coin.volume_1day_usd,
                    volume1Mth: coin.volume_1mth_usd)
                 list.append(coinModel)
             }
             
             return list
         } catch {
             print(error)
             return nil
         }
     }
}
