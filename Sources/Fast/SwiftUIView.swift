import SwiftUI

struct SelectedBorder: ViewModifier {
  var body: some View {
    
    VStack {
      HStack {
        VStack(alignment: .leading, spacing: 10) {
          Text("Free")
            .font(.headline)
          Text(" Limited resolution")
            .font(.footnote)
          Text(" 5 Members limit")
            .font(.footnote)
        }
        Spacer()
      }
      .multilineTextAlignment(.leading)
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
      .padding()
      .background(
        Color
        .gray.opacity(0.2).cornerRadius(10)
      )
      .overlay(
          RoundedRectangle(cornerRadius: 10)
              .stroke(Color.blue, lineWidth: 3)
      )
      .padding(2)
      .onTapGesture {
        <#code#>
      }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIView()
  }
}
