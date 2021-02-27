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
  
  init(hex256rgba hex: Int) {
    let components = (
      R: Double((hex >> 24) & 0xff) / 255,
      G: Double((hex >> 16) & 0xff) / 255,
      B: Double((hex >> 08) & 0xff) / 255,
      A: Double((hex >> 00) & 0xff) / 255
    )
    self.init(
      .sRGB,
      red: components.R,
      green: components.G,
      blue: components.B,
      opacity: components.A
    )
  }
  
  init(hex16rgba hex: Int) {
    let components = (
      R: Double((hex >> 12) & 0xf) / 15,
      G: Double((hex >> 08) & 0xf) / 15,
      B: Double((hex >> 04) & 0xf) / 15,
      A: Double((hex >> 00) & 0xf) / 15
    )
    self.init(
      .sRGB,
      red: components.R,
      green: components.G,
      blue: components.B,
      opacity: components.A
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
  static var systemGray6: Color {
    Color(UIColor.systemGray6)
  }
  // System
  static var systemFill: Color {
    Color(UIColor.systemFill)
  }
  static var label: Color {
    Color(UIColor.label)
  }
  static var systemBackground: Color {
    Color(UIColor.systemBackground)
  }
  static var systemGroupedBackground: Color {
    Color(UIColor.systemGroupedBackground)
  }
  // Secondary System
  static var secondarySystemFill: Color {
    Color(UIColor.secondarySystemFill)
  }
  static var secondaryLabel: Color {
    Color(UIColor.secondaryLabel)
  }
  static var secondarySystemBackground: Color {
    Color(UIColor.secondarySystemBackground)
  }
  static var secondarySystemGroupedBackground: Color {
    Color(UIColor.secondarySystemGroupedBackground)
  }
  // Tertiary System
  static var tertiarySystemFill: Color {
    Color(UIColor.tertiarySystemFill)
  }
  static var tertiaryLabel: Color {
    Color(UIColor.tertiaryLabel)
  }
  static var tertiarySystemBackground: Color {
    Color(UIColor.tertiarySystemBackground)
  }
  static var tertiarySystemGroupedBackground: Color {
    Color(UIColor.tertiarySystemGroupedBackground)
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
  static var systemGray: Color {
    Color(NSColor.systemGray)
  }
  #endif
  
  
  init(rgb: String) {
    let string = rgb.uppercased().filter("0123456789ABCDEF".contains)
    if string.count == 3 {
      self.init(hex16: Int(string.hexValue ?? UInt64.zero))
    }
    self.init(hex256: Int(string.hexValue ?? UInt64.zero))
  }
  
  init(rgba: String) {
    let string = rgba.uppercased().filter("0123456789ABCDEF".contains)
    if string.count == 3 {
      self.init(hex16rgba: Int(string.hexValue ?? UInt64.zero))
    }
    self.init(hex256rgba: Int(string.hexValue ?? UInt64.zero))
  }
  
  @available(iOS 14.0, macOS 11.0, tvOS 13.0, watchOS 6.0, macCatalyst 14, *)
  var hexString: String { self.description }
  @available(iOS 14.0, macOS 11.0, tvOS 13.0, watchOS 6.0, macCatalyst 14, *)
  var hexStringRGB: String { String(self.description.dropLast(2)) }
}


extension String {
  var hexValue: UInt64? {
      let scanner = Scanner(string: self)
      var hexNumber: UInt64 = 0
      
    if scanner.scanHexInt64(&hexNumber) {
      return hexNumber
    }
    return nil
  }
}

extension BinaryInteger {
  var binary: String { .init(self, radix: 2) }
  var hexa: String { .init(self, radix: 16) }
}

extension StringProtocol {
  var dropHashPrefix: SubSequence { hasPrefix("#") ? dropFirst(1) : self[...] }
  var drop0xPrefix: SubSequence { hasPrefix("0x") ? dropFirst(2) : self[...] }
  var drop0bPrefix: SubSequence { hasPrefix("0b") ? dropFirst(2) : self[...] }
  var hexaToDecimal: Int { Int(drop0xPrefix, radix: 16) ?? 0 }
  var hexaToBinary: String { .init(hexaToDecimal, radix: 2) }
  var decimalToHexa: String { .init(Int(self) ?? 0, radix: 16) }
  var decimalToBinary: String { .init(Int(self) ?? 0, radix: 2) }
  var binaryToDecimal: Int { Int(drop0bPrefix, radix: 2) ?? 0 }
  var binaryToHexa: String { .init(binaryToDecimal, radix: 16) }
}
