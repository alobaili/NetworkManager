//
//  Networking.swift
//  
//
//  Created by Abdulaziz AlObaili on 09/11/2021.
//

import Foundation

public protocol Networking {
    var jsonDecoder: JSONDecoder { get set }

    func execute<T: Decodable>(_ requestProvider: RequestProvider) async throws -> T
}

public extension Networking {
    func execute<T: Decodable>(_ requestProvider: RequestProvider) async throws -> T {
        let (data, _) = try await URLSession.shared.data(for: requestProvider.urlRequest)

        let object = try jsonDecoder.decode(T.self, from: data)
        return object
    }
}
