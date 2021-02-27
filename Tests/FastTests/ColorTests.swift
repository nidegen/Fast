import XCTest
@testable import Fast
import SwiftUI

@available(iOS 14.0, *)
final class ColorTests: XCTestCase {
  
  func testInt()  {
    let red = Color(hex256: 0xff0000)
    XCTAssertEqual(red.hexString, "#FF0000FF")
  }
  
  func testHexRGB()  {
    let redRGB = "#FF0000"
    let red = Color(rgb: redRGB)
    XCTAssertEqual(red.hexStringRGB, redRGB)
  }
  
  func testHexRGBA()  {
    let redRGBA = "#FF0000FF"
    let red = Color(rgba: redRGBA)
    XCTAssertEqual(red.hexString, redRGBA)
  }
  
  func testStepper()  {
    let now = Date()
    var nextHour = now
    nextHour.increment(by: .hour)
    nextHour.increment(by: .minute)
    
    let interval = nextHour.timeIntervalSince(now)
    XCTAssertEqual(interval, 60 + 3600)
    
    nextHour.decrement(by: .hour)
    nextHour.decrement(by: .minute)
    
    XCTAssertEqual(nextHour.timeIntervalSince(now), 0)
  }
}
