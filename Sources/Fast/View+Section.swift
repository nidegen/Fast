import SwiftUI

public extension View {
  func section() -> some View {
    Section() {
      self
    }
  }
  
  func section(header: String) -> some View {
    Section(header: Text(header)) {
      self
    }
  }
  
  func section(header: String, footer: String) -> some View {
    Section(header: Text(header), footer: Text(footer)) {
      self
    }
  }
}
