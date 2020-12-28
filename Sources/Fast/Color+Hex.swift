import SwiftUI

public extension Color {
  init(hex256 hex: Int, alpha: Double = 1) {
    let components = (
      R: Double((hex >> 16) & 0xff) / 255,
      G: Double((hex >> 08) & 0xff) / 255,
      B: Double((hex >> 00) & 0xff) / 255
    )
    self.init(
      .sRGB,
      red: components.R,
      green: components.G,
      blue: components.B,
      opacity: alpha
    )
  }
  
  init(hex16 hex: Int, alpha: Double = 1) {
    let components = (
      R: Double((hex >> 08) & 0xf) / 15,
      G: Double((hex >> 04) & 0xf) / 15,
      B: Double((hex >> 00) & 0xf) / 15
    )
    self.init(
      .sRGB,
      red: components.R,
      green: components.G,
      blue: components.B,
      opacity: alpha
    )
  }
  
  init(hex: Int, alpha: Double = 1) {
    self.init(hex256: hex)
  }
  
  #if canImport(UIKit)
  static var teal: Color {
    Color(UIColor.systemTeal)
  }
  static var indigo: Color {
    Color(UIColor.systemIndigo)
  }
  static var lightGray: Color {
    Color(UIColor.lightGray)
  }
  static var systemGray: Color {
    Color(UIColor.systemGray)
  }
  static var systemGray2: Color {
    Color(UIColor.systemGray2)
  }
  static var systemGray3: Color {
    Color(UIColor.systemGray3)
  }
  static var systemGray4: Color {
    Color(UIColor.systemGray4)
  }
  static var systemGray5: Color {
    Color(UIColor.systemGray5)
  }
  static var systemBackground: Color {
    Color(UIColor.systemBackground)
  }
  #elseif canImport(AppKit)
  static var lightGray: Color {
    Color(NSColor.lightGray)
  }
  static var teal: Color {
    Color(NSColor.systemTeal)
  }
  static var indigo: Color {
    Color(NSColor.systemIndigo)
  }
  #endif
}
