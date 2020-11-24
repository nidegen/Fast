import Foundation

public extension Optional where Wrapped: RangeReplaceableCollection {
  mutating func append(_ newElement: Wrapped.Element) {
    self = (self ?? Wrapped()) + [newElement]
  }
  
  var count: Int {
    return self?.count ?? 0
  }
}
