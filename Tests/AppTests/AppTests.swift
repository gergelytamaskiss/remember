@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    func testStatus() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

        try app.test(.GET, "status", afterResponse: { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "UP")
        })
    }
}
