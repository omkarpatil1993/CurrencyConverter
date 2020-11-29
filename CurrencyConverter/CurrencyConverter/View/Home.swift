//
//  Home.swift
//  CurrencyConverter
//
//  Created by Omkar on 01/11/20.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel = FetchData() 
    var body: some View {
        
        VStack {
            
            if(viewModel.conversionData.isEmpty) {
                
                ProgressView()
            }
            else {
                
                ScrollView{
                    // Fetched Data....
                    LazyVStack (alignment: .leading, spacing: 15, content: {
                        
                        ForEach(viewModel.conversionData) {rate in
                            
                            HStack(spacing: 15) {
                                
                                Text(getFlag(currency: rate.currancyName))
                                    .font(.system(size: 65))
                                
                                VStack(alignment: .leading, spacing: 5, content: {
                                    
                                    Text(rate.currancyName)
                                        .font(.title)
                                        .fontWeight(.bold)
                                    
                                    Text("\(rate.currencyValue)")
                                        .fontWeight(.heavy)
                                })
                            }
                            .padding(.horizontal)
                        }
                    })
                    .padding(.top)
                }
            }
        }
        .toolbar(content: {
            Menu(content: {
                
                ForEach(currencies,id: \.self){name in
                    Button(action: {viewModel.updateData(base: name)}, label:{
                        Text(name)
                    })
                }
            }) {
                Text("Base = \(viewModel.base)")
                    .fontWeight(.heavy)
            }
        })
    }
    
    // Getting Country flag by currency name....
    
    func getFlag(currency: String)->String{
        let base = 127397
        
        var code = currency
        code.removeLast()
        
        var scalar = String.UnicodeScalarView()
        
        for i in code.utf16 {
            scalar.append(UnicodeScalar(base + Int(i))!)
        }
        return String(scalar)
    }
}
