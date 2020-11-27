import Foundation

public extension Optional where Wrapped: SetAlgebra {
  mutating func insert(_ newElement: Wrapped.Element) {
    if var s = self {
      s.insert(newElement)
    } else {
      var n = Wrapped()
      n.insert(newElement)
      self = n
    }
  }
  
  func contains(_ member: Wrapped.Element) -> Bool {
    self?.contains(member) ?? false
  }
}
