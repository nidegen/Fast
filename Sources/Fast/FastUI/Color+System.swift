import SwiftUI

public extension Color {
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
}
