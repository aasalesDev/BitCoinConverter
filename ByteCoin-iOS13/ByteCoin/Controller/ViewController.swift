//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bitCoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    private let coinManager = CoinManager()
    private var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinManager.delegate(delegate: self)
        alert = Alert(controller: self)
        setupDelegatesAndDataSources()
    }
    
    private func setupDelegatesAndDataSources() {
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
    }
}


// MARK: DataSource
extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.numberOfRowsInComponent
    }
}

// MARK:  Delegate

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.getCurrencies(index: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currency = coinManager.getCurrencies(index: row)
        currencyLabel.text = currency
        coinManager.getCoinPrice(for: currency)
    }
}

extension ViewController: CoinManagerProtocol {
    func success() {
        DispatchQueue.main.async {
            self.bitCoinLabel.text = self.coinManager.currencyRate
        }
    }
    
    func error() {
        alert?.showAlert(title: "Attention", message: "Could not convert currency!")
    }
}

