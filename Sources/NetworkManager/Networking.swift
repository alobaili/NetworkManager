//
//  Networking.swift
//  
//
//  Created by Abdulaziz AlObaili on 09/11/2021.
//

import Foundation

/// An abstract layer that defines the properties and functions used by ``NetworkManager``.
public protocol Networking {
    var jsonDecoder: JSONDecoder { get set }
    var requestCachePolicy: URLRequest.CachePolicy { get set }

    func execute<T: Decodable>(_ requestProvider: RequestProvider) async throws -> T
}

public extension Networking {
    func execute<T: Decodable>(_ requestProvider: RequestProvider) async throws -> T {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = requestCachePolicy
        let urlSession = URLSession(configuration: configuration)

        let (data, _) = try await urlSession.data(for: requestProvider.urlRequest)

        let object = try jsonDecoder.decode(T.self, from: data)
        return object
    }
}
