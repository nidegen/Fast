import SwiftUI

#if os(iOS) // use available if compiling for macOS 11
public struct SheetData: Identifiable  {
  public var id = UUID().uuidString
  public var view: () -> AnyView
  public init(view: @escaping () -> AnyView) {
    self.view = view
  }
}

public extension View {
  func sheet(_ data: Binding<SheetData?>) -> some View {
    self.sheet(item: data) { data in
      data.view()
    }
  }
}
#endif

