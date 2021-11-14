import Foundation

/// A network manager can be used to send a request to a remote resource that sends back a JSON response.
///
/// You call the ``execute(_:)`` function passing a ``RequestProvider`` that that will be used to reach the remote resource.
/// ``execute(_:)`` is a generic function over any `Decodable` type, so you have to explicitly annotate your property with the type.
///
/// ```swift
/// struct User: Decodable {
///     let id: String
/// }
///
/// enum Endpoint: RequestProvider {
///     case users
///
///     var urlRequest: URLRequest {
///         switch self {
///             case .users: return .init(url: URL(string: "https://api.com/users")!)
///         }
///     }
/// }
/// ```
///
/// You then can use the library like so:
/// ```swift
/// let networkManager = NetworkManager()
/// let users: [User] = try await networkManager.execure(Endpoint.users)
/// ```
public struct NetworkManager: Networking {
    public var requestCachePolicy: URLRequest.CachePolicy
    public var jsonDecoder: JSONDecoder

    /// Creates an instance of ``NetworkManager``.
    /// - Parameters:
    ///   - jsonDecoder: The JSON decoder to use for decoding the URL response. If this is omitted, a default one is used.
    ///   - requestCachePolicy: The cache policy for URL requests. The default policy is [useProtocolCaachePolicy](https://developer.apple.com/documentation/foundation/nsurlrequest/cachepolicy/useprotocolcachepolicy).
    public init(
        jsonDecoder: JSONDecoder = .init(),
        requestCachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy
    ) {
        self.jsonDecoder = jsonDecoder
        self.requestCachePolicy = requestCachePolicy
    }
}
