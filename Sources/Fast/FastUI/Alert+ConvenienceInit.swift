import SwiftUI

public extension Alert {
  init(title: String, message: String, button: String, action: @escaping ()->()) {
    self.init(title: Text(title),
              message: Text(message),
              primaryButton: .default(Text(button), action: action),
              secondaryButton: .cancel())
  }
}
