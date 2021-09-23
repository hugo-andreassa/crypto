//
//  ViewController.swift
//  Crypto
//
//  Created by Virtual Machine on 22/09/21.
//

import SVProgressHUD
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var coin: CoinAssetModel?
    
    var coins: [CoinAssetModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        tableView.register(UINib(
                nibName: String(describing: CoinTableViewCell.self),
                bundle: nil),
            forCellReuseIdentifier: "coinCell")
        
        loadCoins()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func loadCoins() {
        SVProgressHUD.show()
        
        let service = CoinAssetService()
        service.getAllAssets() { coins in
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
                
                self.coins = coins
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func refreshPressed(_ sender: Any) {
        loadCoins()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HomeToDetailController" {
            let controller = segue.destination as! DetailViewController
            controller.coin = coin
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = coins[indexPath.row]
        self.coin = item
        performSegue(withIdentifier: "HomeToDetailController", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let item = coins[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath) as! CoinTableViewCell
        cell.nameLabel.text = String(format: "%@ - %@",
                                     item.assetId,
                                     item.name)
        cell.valueLabel.text = item.formattedValue
        
        return cell
    }
}

