import SwiftUI

@available(iOS 13.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
public struct CloseButton: View {
  @Environment(\.colorScheme) var colorscheme
  public var action: ()->()
  
  var xColor: Color {
    colorscheme == .dark ? Color( UIColor.lightGray) : Color( UIColor.darkGray)
  }
  
  var circleColor: Color {
    colorscheme == .dark ? .white : .black
  }
  
  public var body: some View {
    Button(action: action) {
      ZStack {
        Circle()
          .foregroundColor(circleColor)
          .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
          .opacity(0.2)
        Circle()
          .foregroundColor(xColor)
          .frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
          .mask(
            Image(systemName: "xmark.circle.fill")
              .foregroundColor(.black)
              .background(Color.white)
              .compositingGroup()
              .luminanceToAlpha()
              .foregroundColor(.black)
              .clipShape(Circle())
          )
      }
    }
  }
}

public struct CloseButtonOverlay: ViewModifier {
  public var action: ()->()
  public func body(content: Content) -> some View {
    ZStack {
      content
      VStack {
        HStack {
          Spacer()
          CloseButton(action: action)
            .padding()
        }
        Spacer()
      }
    }
  }
}

@available(iOS 13.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
struct CloseButton_Previews: PreviewProvider {
  @State static var text = "Blablabla"
  static var previews: some View {
    VStack {
      Text(text)
      CloseButton {
        text = "NNNNNN"
      }
      
      Text("Test")
    }
    .background(Color(UIColor.systemBackground))
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//    .environment(\.colorScheme, .dark)
  }
}
