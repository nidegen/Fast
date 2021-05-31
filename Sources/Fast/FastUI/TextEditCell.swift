

import SwiftUI

struct TextEditCell: View {
  @Binding var text: String
  var body: some View {
    NavigationLink(text, destination: TextEditView(text: text))
    Text(text)
  }
  
  
  struct TextEditView: View {
    @State var intitialText: String
    @Binding var text: String
    
    var body: some View {
      Form {
        HStack {
          TextField("Name", text: $text)
          Spacer()
          Button(systemSymbol: "xmark.circle.fill") {
            text = ""
          }
          .buttonStyle(PlainButtonStyle())
        }
      }
    }
  }
}

struct TextEditCell_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      TextEditCell(text: .constant("Text"))
    }
  }
}
