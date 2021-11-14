//
//  RequestProvider.swift
//  
//
//  Created by Abdulaziz AlObaili on 09/11/2021.
//

import Foundation

/// ``NetworkManager``'s ``Networking/execute(_:)-8t16l`` requires a
/// `RequestProvider` conforming type that provides a
/// [URLRequest](https://developer.apple.com/documentation/foundation/urlrequest).
public protocol RequestProvider {
    var urlRequest: URLRequest { get }
}
