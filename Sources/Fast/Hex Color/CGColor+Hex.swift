import CoreGraphics
import Foundation

extension CGColor {
  var rgb256hex: String {
    let components = self.components
    let r = UInt8(((components?[0] ?? 0.0) * 255).rounded())
    let g = UInt8(((components?[1] ?? 0.0) * 255).rounded())
    let b = UInt8(((components?[2] ?? 0.0) * 255).rounded())
    
    let hexString = String.init(format: "#%02lX%02lX%02lX", r, g, b)
    return hexString
  }
  
  var rgba256hex: String {
    let components = self.components
    let r = UInt8(((components?[0] ?? 0.0) * 255).rounded())
    let g = UInt8(((components?[1] ?? 0.0) * 255).rounded())
    let b = UInt8(((components?[2] ?? 0.0) * 255).rounded())
    let a = UInt8(((components?[3] ?? 0.0) * 255).rounded())
    
    let hexString = String.init(format: "#%02lX%02lX%02lX%02lX", r, g, b, a)
    return hexString
  }
  
  var argb256hex: UInt32 {
    let components = self.components
    let r = UInt8(((components?[0] ?? 0.0) * 255).rounded())
    let g = UInt8(((components?[1] ?? 0.0) * 255).rounded())
    let b = UInt8(((components?[2] ?? 0.0) * 255).rounded())
    let a = UInt8(((components?[3] ?? 0.0) * 255).rounded())
    
    let data = Data([a, r, g, b])

    return UInt32(bigEndian: data.withUnsafeBytes { $0.load(as: UInt32.self) })
  }
}


extension CGColor {
  static func hex256rgb( _ hex: Int, alpha: CGFloat = 1) -> CGColor {
    let components = (
      R: CGFloat((hex >> 16) & 0xff) / 255,
      G: CGFloat((hex >> 08) & 0xff) / 255,
      B: CGFloat((hex >> 00) & 0xff) / 255
    )
    return CGColor(
      red: components.R,
      green: components.G,
      blue: components.B,
      alpha: alpha
    )
  }
  
  static func hex256rgba(_ hex: Int) -> CGColor {
    let components = (
      R: CGFloat((hex >> 24) & 0xff) / 255,
      G: CGFloat((hex >> 16) & 0xff) / 255,
      B: CGFloat((hex >> 08) & 0xff) / 255,
      A: CGFloat((hex >> 00) & 0xff) / 255
    )
    return CGColor(
      red: components.R,
      green: components.G,
      blue: components.B,
      alpha: components.A
    )
  }
  
  static func hex256argb( _ hex: Int) -> CGColor {
    let components = (
      A: CGFloat((hex >> 24) & 0xff) / 255,
      R: CGFloat((hex >> 16) & 0xff) / 255,
      G: CGFloat((hex >> 08) & 0xff) / 255,
      B: CGFloat((hex >> 00) & 0xff) / 255
    )
    return CGColor(
      red: components.R,
      green: components.G,
      blue: components.B,
      alpha: components.A
    )
  }
}
