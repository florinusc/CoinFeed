//
//  CustomError.swift
//  CoinFeed
//
//  Created by Florin Uscatu on 12/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

public enum CustomError: Error {
    case general
    case network
    case custom(message: String)
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .general: return NSLocalizedString("Something went wrong", comment: "General Error")
        case .network: return NSLocalizedString("There was a problem with the network", comment: "Network Error")
        case .custom(let message): return message
        }
    }
}
