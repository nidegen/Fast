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


struct CapsuleButtonStyle_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      
      Button("Repeat") {
        
      }
      .buttonStyle(FloatStyle(color: .blue))
      .font(.system(size: 33))
      
      Button("Repeat") {
        
      }
      .buttonStyle(CapsuleButtonStyle(color: .red))
      .font(.system(size: 33))
      .frame(width: 400)
    }
  }
}
