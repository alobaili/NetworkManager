import XCTest
@testable import NetworkManager

final class NetworkManagerTests: XCTestCase {
    func testSucceedingExecuteShouldNotThrow() async throws {
        let networkManager = NetworkManagerMock(behavior: .succeeding)

        do {
            let _ = try await networkManager.execute(ExampleDecodable())
        } catch {
            XCTFail("A succeeding network request should not throw.")
        }
    }

    func testFailingExecuteShouldThrow() async throws {
        let networkManager = NetworkManagerMock(behavior: .failing)

        do {
            let _ = try await networkManager.execute(ExampleDecodable())
            XCTFail("A failing network request should throw.")
        } catch {
            // If there're no throws, the test is successful.
        }
    }
}
