import SwiftUI

struct FloatStyle: ButtonStyle {
  var color: Color
  
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .frame(minWidth: 30, maxWidth: .infinity)
      .padding(10)
      .foregroundColor(.white)
      .background(configuration.isPressed ? .white : self.color)
      .cornerRadius(5)
  }
}
