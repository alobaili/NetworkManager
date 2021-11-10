//
//  RequestProvider.swift
//  
//
//  Created by Abdulaziz AlObaili on 09/11/2021.
//

import Foundation

public protocol RequestProvider {
    var urlRequest: URLRequest { get }
}
