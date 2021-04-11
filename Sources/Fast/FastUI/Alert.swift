import SwiftUI

public extension Alert {
  init(title: String, message: String, button: String, action: @escaping ()->()) {
    self.init(title: Text(title),
              message: Text(message),
              primaryButton: .default(Text(button), action: action),
              secondaryButton: .cancel())
  }
}

public protocol AlertData: Identifiable {
  var alert: Alert { get }
}

public struct CancelActionAlert: AlertData {
  public let id = UUID().uuidString
  public var title: LocalizedStringKey
  public var buttonTitle: LocalizedStringKey
  public var message: LocalizedStringKey
  public var destructive = false
  public var action: (()->())?
  
  public var alert: Alert {
    return Alert(title: Text(title),
                 message: Text(message),
                 primaryButton: destructive ? .destructive(Text(buttonTitle)) : .default(Text(buttonTitle), action: action),
                 secondaryButton: .cancel())
  }
}

public struct MessageAlert: AlertData {
  public let id = UUID().uuidString
  public var title: LocalizedStringKey
  public var message: LocalizedStringKey
  
  public var alert: Alert {
    return Alert(title: Text(title),
                 message: Text(message))
  }
}

public struct DualActionAlert: AlertData {
  public let id = UUID().uuidString
  public var title: LocalizedStringKey
  public var buttonTitleA: LocalizedStringKey
  public var buttonTitleB: LocalizedStringKey
  public var message: LocalizedStringKey
  public var actionA: (()->())?
  public var actionB: (()->())?
  
  public var alert: Alert {
    return Alert(title: Text(title),
                 message: Text(message),
                 primaryButton: .default(Text(buttonTitleA), action: actionA),
                 secondaryButton: .default(Text(buttonTitleB), action: actionB))
  }
}

public extension View {
  func alert<T: AlertData>(_ data: Binding<T?>) -> some View {
    self.alert(item: data) { data in
      data.alert
    }
  }
}
