//
//  NetworkManagerMock.swift
//  
//
//  Created by Abdulaziz AlObaili on 09/11/2021.
//

@testable import NetworkManager
import Foundation

enum MockBehavior {
    case succeeding
    case failing
}

struct ExampleDecodable: Decodable {}

extension ExampleDecodable: RequestProvider {
    var urlRequest: URLRequest {
        URLRequest(url: .init(string: "")!)
    }
}

struct ExampleError: Error {}

struct NetworkManagerMock: Networking {
    var jsonDecoder: JSONDecoder = .init()
    var requestCachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy

    let behavior: MockBehavior

    func execute(_ requestProvider: RequestProvider) async throws -> ExampleDecodable {
        switch behavior {
            case .succeeding:
                return ExampleDecodable()
            case .failing:
                throw ExampleError()
        }
    }
}
