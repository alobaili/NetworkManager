import Foundation

public struct NetworkManager: Networking {
    public var jsonDecoder: JSONDecoder

    public init(jsonDecoder: JSONDecoder = .init()) {
        self.jsonDecoder = jsonDecoder
    }
}
