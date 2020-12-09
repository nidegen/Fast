import SwiftUI

@available(iOS 13.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
public struct SelectableField: ViewModifier {
  var selected: Bool
  var background: Color = .systemGray5
  public func body(content: Content) -> some View {
    Group {
      if selected {
        content
          .background(
            background
              .cornerRadius(10)
              .shadow(color: .blue, radius: 2)
          )
          .overlay(
            RoundedRectangle(cornerRadius: 10)
              .stroke(Color.blue, lineWidth: 3)
          )
      } else {
          content
            .background(
              background
                .cornerRadius(10)
                .shadow(radius: 6, y: 2)
            )
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
    .padding(1.5)
  }
}

@available(iOS 13.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
extension View {
  public func selectedField(_ selected: Bool, background: Color = Color
                              .systemGray5) -> some View {
    self.modifier(SelectableField(selected: selected, background: background))
  }
}

@available(iOS 13.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
struct SelectableField_Previews: PreviewProvider {
  @State static var selected = false
  static var previews: some View {
    VStack {
    HStack {
      Spacer()
    }
    .padding()
    .onTapGesture {
      selected.toggle()
    }
    .selectedField(selected)
    .padding()
      HStack {
        Spacer()
      }
      .padding()
      .onTapGesture {
        selected.toggle()
      }
      .selectedField(!selected)
      .padding()
    }
  }
}
