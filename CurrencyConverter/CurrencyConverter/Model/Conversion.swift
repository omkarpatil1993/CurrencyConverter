//
//  Conversion.swift
//  CurrencyConverter
//
//  Created by Omkar on 01/11/20.
//

import SwiftUI

// For fetching data....
struct Conversion: Decodable {
    
    var rates : [String : Double]
    var date : String
    var base : String
}

