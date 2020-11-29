//
//  FetchData.swift
//  CurrencyConverter
//
//  Created by Omkar on 01/11/20.
//

import SwiftUI

class FetchData: ObservableObject {
    
    @Published var conversionData : [Currency] = []
    @Published var base = "USD"
    
    init() {
        fetch()
    }
    
    func fetch() {
        
        let url = "https://api.exchangeratesapi.io/latest?base=\(base)"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, _) in
            
            guard let jsonData = data else{return}
            
            do {
                let conversion = try JSONDecoder().decode(Conversion.self, from:jsonData)
                
                print(conversion)
                // Converting Dictionary to Array of Objects...
                
                DispatchQueue.main.async {
                    // Key will be currency name
                    // Value will be currency value
                    
                    self.conversionData = conversion.rates.compactMap({ (key,value) -> Currency? in
                        
                        return Currency(currancyName: key, currencyValue: value)
                        
                    })
                }
            }
            catch {
                print(error.localizedDescription) 
            }
        }
        .resume()
    }
    
    func updateData(base: String) {
        self.base = base
        self.conversionData.removeAll()
        fetch()
    }
}
