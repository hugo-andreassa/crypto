//
//  DetailViewController.swift
//  Crypto
//
//  Created by Virtual Machine on 23/09/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var oneHourLabel: UILabel!
    @IBOutlet weak var oneDayLabel: UILabel!
    @IBOutlet weak var oneMonthLabel: UILabel!
    
    var coin: CoinAssetModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCoin()
    }
    
    private func setupCoin() {
        if let safeCoin = coin {
            titleLabel.text = String(format: "%@ - %@",
                                     safeCoin.assetId,
                                     safeCoin.name)
            valueLabel.text = safeCoin.formattedValue
            oneHourLabel.text = safeCoin.formattedVolume1Hrs
            oneDayLabel.text = safeCoin.formattedVolume1Day
            oneMonthLabel.text = safeCoin.formattedVolume1Mth
        }
    }
}
