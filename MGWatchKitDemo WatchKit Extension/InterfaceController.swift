//
//  InterfaceController.swift
//  MGWatchKitDemo WatchKit Extension
//
//  Created by Tuan Truong on 12/5/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    @IBOutlet var rateLabel: WKInterfaceLabel!
    
    var currencyService = CurrencyService()

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func refresh() {
        currencyService.getExchangeRate(from: "usd", to: "vnd") { (rate, error) in
            if error == nil {
                self.rateLabel.setText(String(rate))
            }
            else {
                self.rateLabel.setText("Error!!!")
            }
        }
    }
    
    

}
