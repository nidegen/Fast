import SwiftUI

@available(iOS 13.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
public struct SelectedModifier: ViewModifier {
  var selected: Bool
  
  public func body(content: Content) -> some View {
    content
      .overlay(overlay, alignment: .topLeading)
  }
  
  var overlay: some View {
    ZStack {
      VStack {
        Spacer()
        HStack {
          Spacer()
          Image(systemName: "checkmark.circle")
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Circle())
        }
      }
      .padding([.bottom, .trailing], 5)
      .when(selected)
    }
  }
}

extension View {
  @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)

  public func selected(_ selected: Bool) -> some View {
    self.modifier(SelectedModifier(selected: selected))
  }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
struct Selected_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      List {
        Text("A")
        Text("B")
          .selected(false)
        Text("C")
          .selected(true)
        Text("D")
      }
      .listRowBackground(Color.green)
      
      
      LazyVGrid(columns: [GridItem(.fixed(100)),
                          GridItem(.fixed(100)),
                          GridItem(.fixed(100)),
      ]) {
        Color.red
          .frame(width: 100, height: 100)
        Color.pink
        Color.green
          .selected(false)
        Color.red
          .overlay(Color.white.opacity(0.2))
          .selected( true)
        Color.pink
        Color.green
          .frame(width: 100, height: 100)
      }
    }
  }
}
