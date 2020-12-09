import XCTest
@testable import Fast

final class FastTests: XCTestCase {
  struct Tester {
    var didSet: ()->()
    var optionalSet: Set<String>? = ["test"]
  }
  func testInsert()  {
    var control = false
    var tester = Tester {
      control = true
    }
    XCTAssertTrue(tester.optionalSet?.contains("test") ?? false)
    XCTAssertTrue(control)
    tester.optionalSet.insert("flat")
    XCTAssertTrue(tester.optionalSet?.contains("test") ?? false)
    XCTAssertTrue(tester.optionalSet?.contains("flat") ?? false)
  }
}
