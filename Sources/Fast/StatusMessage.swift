import SwiftUI

public struct StatusMessage<Status: View>: ViewModifier {
  var statusContent: () -> Status
  var color: Color
  
  public init(color: Color = .red, @ViewBuilder content: @escaping () -> Status) {
    self.color = color
    self.statusContent = content
  }
  
  public func body(content: Content) -> some View {
    VStack(spacing: 0) {
      ZStack {
        color
          .edgesIgnoringSafeArea([.top])
        statusContent()
      }
      .height(24)
      content
    }
  }
}

extension View {
  public func statusMessage<Content: View>(color: Color = .red, @ViewBuilder  _ content: @escaping () -> Content) -> some View {
    self.modifier(StatusMessage(color: color, content: content))
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  @State static var text = "hehe"
  static var previews: some View {
    NavigationView {
      Form {
        Text(text)
      }
      .navigationBarTitle("Test")
    }
    .statusMessage {
      Button("Test") {
        text = "hihi"
      }
      .buttonStyle(PlainButtonStyle())
    }
  }
}
