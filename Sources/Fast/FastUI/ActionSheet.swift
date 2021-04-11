import SwiftUI

#if os(iOS) // use available if compiling for macOS 11
public class ActionData: Identifiable  {
  public init(title: String, message: String? = nil, buttons: [ActionSheet.Button]) {
    self.title = title
    self.message = message
    self.buttons = buttons
  }
  
  public let buttons: [ActionSheet.Button]
  public let title: String
  public let message: String?
  public var id: String { title + (message ?? "") }
  
  public var sheet: ActionSheet {
    return ActionSheet(title: Text(title), message: message.map { Text($0) }, buttons: buttons)
  }
}

public extension View {
  func actionSheet<T: ActionData>(_ data: Binding<T?>) -> some View {
    self.actionSheet(item: data) { data in
      data.sheet
    }
  }
}
#endif
