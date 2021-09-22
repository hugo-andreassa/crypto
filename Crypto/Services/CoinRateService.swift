//
//  CoinService.swift
//  Crypto
//
//  Created by Virtual Machine on 22/09/21.
//

import Foundation

class CoinRateService {
    
    private let apiKey = NSLocalizedString("ApiKEY", comment: "")
    private let apiUrl = NSLocalizedString("ApiURL", comment: "")
    
    func getSpecificRate(coinType: String, currency: String) {
        guard let url = URL(string: String(format: "%@/%@/%@", apiUrl + "exchangerate", coinType, currency))
        else {
            fatalError("Erro ao inicializar serviço")
        }
        
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
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
                if let coin = self.parseJson(safeData) {
                    print(coin)
                }
            }
        }
        
        task.resume()
    }
    
    func getAllExchanges () {
        guard let url = URL(string: String(format: "%@", apiUrl + "exchanges"))
        else {
            fatalError("Erro ao inicializar serviço")
        }
        
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
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
                print(safeData)
                /*if let coin = self.parseJson(safeData) {
                    print(coin)
                }*/
            }
        }
        
        task.resume()
    }
    
    private func parseJson(_ data: Data) -> CoinRateModel? {
         do {
             let coinData = try JSONDecoder().decode(CoinRateData.self, from: data)
             let coinModel = CoinRateModel(
                coinType: coinData.asset_id_base,
                currency: coinData.asset_id_quote,
                value: coinData.rate,
                date: coinData.time)
             return coinModel
         } catch {
             print(error)
             return nil
         }
     }
}
