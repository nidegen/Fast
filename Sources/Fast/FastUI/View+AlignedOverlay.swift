import SwiftUI

extension View {  
  @inlinable public func overlay<Overlay>(alignment: Alignment = .center, @ViewBuilder  _ overlay: () -> Overlay) -> some View where Overlay : View {
    self.overlay(overlay(), alignment: alignment)
  }
}
