import SwiftUI

public extension Color {
  init(hex: Int, alpha: Double = 1) {
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
  
  #if canImport(UIKit)
  static var teal: Color {
    Color(UIColor.systemTeal)
  }
  static var indigo: Color {
    Color(UIColor.systemIndigo)
  }
  #elseif canImport(AppKit)
  static var teal: Color {
    Color(NSColor.systemTeal)
  }
  static var indigo: Color {
    Color(NSColor.systemIndigo)
  }
  #endif
}
