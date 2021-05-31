import SwiftUI

struct DataLabel<T: StringProtocol> : View {
  var title: T
  var value: T
  var body: some View {
    HStack {
      Text(title)
      Spacer()
      Text(value)
        .foregroundColor(.secondary)
    }
  }
}


struct DataLabel_Previews: PreviewProvider {
  static var previews: some View {
    DataLabel(title: "Title", value: "Value")
  }
}
