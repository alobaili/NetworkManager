import Foundation

public struct NetworkManager: Networking {
    public var requestCachePolicy: URLRequest.CachePolicy
    public var jsonDecoder: JSONDecoder

    public init(
        jsonDecoder: JSONDecoder = .init(),
        requestCachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy
    ) {
        self.jsonDecoder = jsonDecoder
        self.requestCachePolicy = requestCachePolicy
    }
}
