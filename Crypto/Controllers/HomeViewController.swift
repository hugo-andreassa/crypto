//
//  ViewController.swift
//  Crypto
//
//  Created by Virtual Machine on 22/09/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var coins = [CoinAssetModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CoinTableViewCell", bundle: nil), forCellReuseIdentifier: "coinCell")
        
        loadCoins()
    }
    
    func loadCoins() {
        let service = CoinAssetService()
        service.getAllAssets() { coins in
            DispatchQueue.main.async {
                self.coins = coins
                self.tableView.reloadData()
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = coins[(indexPath as NSIndexPath).row]
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath) as! CoinTableViewCell
        cell.nameLabel.text = item.name
        cell.valueLabel.text = String(item.priceUSD)
        // cell.iconImage.text = item
        
        return cell
    }
}
