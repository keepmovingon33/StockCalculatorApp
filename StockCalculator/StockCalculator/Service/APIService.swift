//
//  APIService.swift
//  StockCalculator
//
//  Created by sky on 1/8/22.
//

import Foundation
import Combine


struct APIService {
    
    var API_KEY: String {
        return keys.randomElement() ?? ""
    }
    
    let keys = ["DFTB4R9AYPABUBPD", "7YHSPM9580Q2NZL9", "DBVGMM7S1SZ2U3LF", "YRWPRSJW29FWZ9NL", "0BVSAQIR0SWKW74H"]
    
    func fetchSymbolsPublisher(keyword: String) -> AnyPublisher<SearchResults, Error> {
        let urlString = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keyword)&apikey=\(API_KEY)"
        
        let url = URL(string: urlString)!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: SearchResults.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
