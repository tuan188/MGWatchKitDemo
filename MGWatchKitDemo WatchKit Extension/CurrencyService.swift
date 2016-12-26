//
//  CurrencyService.swift
//  MGWatchKitDemo
//
//  Created by Tuan Truong on 12/26/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import WatchKit
import Alamofire

class CurrencyService {
    
    func getExchangeRate(from fromCurrency: String, to toCurrency: String, completion: (_ rate: Double, _ error: NSError?) -> Void) {
        let urlParams = [
            "access_key":"2a1feb489caa69ef8c29a74ae61f94ce",
            "currencies": "\(fromCurrency),\(toCurrency)"
            ]
        
        // Fetch Request
        Alamofire.request("http://www.apilayer.net/api/live", method: .get, parameters: urlParams)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Success")
                case .failure(let error):
                    print("Failure")
                }
        }
    }

}
