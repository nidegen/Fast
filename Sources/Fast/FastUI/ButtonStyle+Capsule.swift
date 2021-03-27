import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
  var color: Color
  var padding: CGFloat = 10
  
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .lineLimit(1)
      .padding(padding)
      .padding(.horizontal, 2 * padding)
      .foregroundColor(.white)
      .background(Capsule().foregroundColor(color))
  }
}

struct CapsuleButtonStyle_Previews: PreviewProvider {
  static var previews: some View {
    Button("Repeat") {
      
    }
    .buttonStyle(CapsuleButtonStyle(color: .red))
    .font(.system(size: 33))
    .frame(width: 400)
  }
}
