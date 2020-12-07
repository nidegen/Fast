import Foundation

public extension Optional where Wrapped: SetAlgebra {
  mutating func insert(_ newElement: Wrapped.Element) {
    var newSet = self ?? Wrapped()
    newSet.insert(newElement)
    self = newSet
  }
  
  func contains(_ member: Wrapped.Element) -> Bool {
    self?.contains(member) ?? false
  }
}
