import SwiftUI

@available(iOS 13.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
public struct SelectableField: ViewModifier {
  var selected: Bool
  var background = Color
    .gray.opacity(0.2)
  public func body(content: Content) -> some View {
    Group {
      if selected {
        content
          .background(
            background.cornerRadius(10))
          .overlay(
            RoundedRectangle(cornerRadius: 10)
              .stroke(Color.blue, lineWidth: 3)
          )
      } else {
          content
            .background(
              background.cornerRadius(10))
      }
    }
    .overlay(
      VStack {
        HStack {
          Spacer()
          if selected {
            Image(systemName: "checkmark.circle.fill")
              .foregroundColor(.blue)
          } else {
            Image(systemName: "circle")
              .foregroundColor(.gray)
          }
        }
        Spacer()
      }
      .padding([.top, .trailing], 5))
    .padding(2)
  }
}

@available(iOS 13.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
extension View {
  public func selectedField(_ selected: Bool) -> some View {
    self.modifier(SelectableField(selected: selected))
  }
}

@available(iOS 13.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
struct SelectableField_Previews: PreviewProvider {
  @State static var selected = true
  static var previews: some View {
    HStack {
      Spacer()
    }
    .padding()
    .onTapGesture {
      selected.toggle()
    }
    .selectedField(selected)
    .padding()
  }
}
