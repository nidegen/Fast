import XCTest
@testable import Fast
import SwiftUI

@available(iOS 14.0, *)
final class ColorTests: XCTestCase {
  
  func testIntRGB()  {
    let red = Color(hex256: 0xff0000)
    XCTAssertEqual(red.cgColor?.rgb256hex, "#FF0000")
  }
  
  func testIntRGBA()  {
    let red = Color(hex256rgba: 0xff0000ff)
    XCTAssertEqual(red.cgColor?.rgba256hex, "#FF0000FF")
  }
  
  func testIntARG()  {
    let blue = Color(hex256argb: 0xff0000ff)
    XCTAssertEqual(blue.cgColor?.rgba256hex, "#0000FFFF")
  }
  
  func testIntCGColor()  {
    let blue = CGColor.hex256argb(0xff0000ff)
    XCTAssertEqual(blue.rgba256hex, "#0000FFFF")
    XCTAssertEqual(blue.argb256hex, 0xFF0000FF)
  }
  
  func testHexRGB()  {
    let redRGB = "#FF0000"
    let red = Color(rgb: redRGB)
    XCTAssertEqual(red?.cgColor?.rgb256hex, redRGB)
  }
  
  func testHexRGBA()  {
    let redRGBA = "#FF0000FF"
    let red = Color(rgba: redRGBA)
    XCTAssertEqual(red?.cgColor?.rgba256hex, redRGBA)
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
