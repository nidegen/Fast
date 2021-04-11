import SwiftUI

struct OnFirstAppear: ViewModifier {
  let action: () -> ()
  
  @State private var firstTime = true
  
  func body(content: Content) -> some View {
    content.onAppear {
      if firstTime {
        firstTime = false
        action()
      }
    }
  }
}

extension View {
  func onFirstAppear(action: @escaping ()->()) -> some View {
    modifier(OnFirstAppear(action: action))
  }
}
