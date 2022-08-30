import Foundation
import XCTest

extension XCTestCase {

    @discardableResult
    public func runActivity<Result>(_ name: String, block: (XCTActivity) throws -> Result) rethrows -> Result {
        try XCTContext.runActivity(named: name, block: block)
    }

}
extension XCUIElement {

    func assertContains(text: String) {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", text)
        let elementQuery = staticTexts.containing(predicate)
        XCTAssertTrue(elementQuery.count > 0)
    }
}
