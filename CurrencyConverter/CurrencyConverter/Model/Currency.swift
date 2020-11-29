//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Omkar on 01/11/20.
//

import SwiftUI

// For displaying data.....
struct Currency: Identifiable {
    
    var id = UUID().uuidString
    var currancyName : String
    var currencyValue : Double
}

//struct CurrencyList: Identifiable {
//    
//    var id = UUID().uuidString
//    var currancyName : String
//    var currencyValue : Double
//}

var currencies = ["USD","AUD","EUR","INR","JPY"]
