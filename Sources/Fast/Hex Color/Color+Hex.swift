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
  
  init(hex256argb hex: Int) {
    let components = (
      A: Double((hex >> 24) & 0xff) / 255,
      R: Double((hex >> 16) & 0xff) / 255,
      G: Double((hex >> 08) & 0xff) / 255,
      B: Double((hex >> 00) & 0xff) / 255
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
  
  init(hex16argb hex: Int) {
    let components = (
      A: Double((hex >> 12) & 0xf) / 15,
      R: Double((hex >> 08) & 0xf) / 15,
      G: Double((hex >> 04) & 0xf) / 15,
      B: Double((hex >> 00) & 0xf) / 15
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
  
  
  init?(rgb: String) {
    let string = rgb.uppercased().filter("0123456789ABCDEF".contains)
    if let hexValue = string.hexValue {
      if string.count == 3 {
        self.init(hex16: Int(hexValue))
      } else {
        self.init(hex256: Int(hexValue))
      }
    } else {
      return nil
    }
  }
  
  init?(rgba: String) {
    let string = rgba.uppercased().filter("0123456789ABCDEF".contains)
    if let hexValue = string.hexValue {
      if string.count == 3 {
        self.init(hex16rgba: Int(hexValue))
      } else {
        self.init(hex256rgba: Int(hexValue))
      }
    } else {
      return nil
    }
  }
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
