import SwiftUI

@available(iOS 13.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
public struct SelectedModifier: ViewModifier {
  var selected: Bool
  var showUnselected: Bool = false
  var alignment: Alignment = .bottomTrailing
  
  public func body(content: Content) -> some View {
    content
      .overlay(selectionMark, alignment: alignment)
  }
  
  var selectionMark: some View {
    SelectionMark(selected: selected)
      .padding(5)
      .when(selected || showUnselected)
  }
}

@available(iOS 13.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
public struct SelectionMark: View {
  var selected: Bool
  
  public var body: some View {
    if selected {
      Image(systemName: "checkmark.circle.fill")
        .foregroundColor(.blue)
        .background(Color.white)
        .clipShape(Circle())
    } else {
      Image(systemName: "circle")
        .foregroundColor(.gray)
        .clipShape(Circle())
    }
  }
}

extension View {
  @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)

  public func selected(_ selected: Bool, showUnselected: Bool = false, alignement: Alignment = .bottomTrailing) -> some View {
    self.modifier(SelectedModifier(selected: selected, showUnselected: showUnselected, alignment: alignement))
  }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
struct Selected_Previews: PreviewProvider {
  static var previews: some View {
    Form {
      List {
        HStack {
          SelectionMark(selected: false)
          Text("A")
        }
        HStack {
          SelectionMark(selected: true)
          Text("B")
        }
          .selected(false)
        Text("C")
          .selected(true)
        Text("D")
          .selected(false, showUnselected: true)
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
          .selected(true)
        Color.pink
          .selected(false, showUnselected: true)
        Color.green
          .frame(width: 100, height: 100)
      }
    }
  }
}
