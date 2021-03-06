//
//  SessionManager.swift
//  CoinFeed
//
//  Created by Florin Uscatu on 13/09/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

final class SessionManager {
    
    func request<T: Decodable>(type _: T.Type, requestType: Request, completion handler: @escaping (Result<T, Error>) -> Void) {
        guard let url = requestType.url else {
            handler(Result.failure(CustomError.network))
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200,
                let data = data
                else {
                    handler(Result.failure(CustomError.network))
                    return
            }
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                handler(Result.success(decodedResponse))
            } catch let error {
                handler(Result.failure(error))
                return
            }
        }.resume()
    }
}
