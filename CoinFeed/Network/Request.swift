//
//  Request.swift
//  CoinFeed
//
//  Created by Florin Uscatu on 13/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

enum Request {
    case tickers
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.coinpaprika.com"
        
        switch self {
        case .tickers:
            components.path = "/v1/tickers"
        }
        
        return components.url
    }

}
