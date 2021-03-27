import SwiftUI

extension View {
  @ViewBuilder
  public func when(_ condition: Bool) -> some View {
    if condition {
      self
    }
  }
}
