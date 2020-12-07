import Foundation

public extension Optional where Wrapped: RangeReplaceableCollection {
  mutating func append(_ newElement: Wrapped.Element) {
    self = (self ?? Wrapped()) + [newElement]
  }
  
  var count: Int {
    return self?.count ?? 0
  }
}

public extension Optional where Wrapped: RangeReplaceableCollection, Wrapped.Element: Equatable {
  func contains(_ member: Wrapped.Element) -> Bool {
    self?.contains(member) ?? false
  }
}

public extension Optional where Wrapped: RangeReplaceableCollection, Wrapped.Element: Equatable {
  mutating func insert(_ member: Wrapped.Element) {
    if !(self?.contains(member) ?? false) {
      self.append(member)
    }
  }
}

public extension RangeReplaceableCollection where Element: Equatable {
  mutating func remove(_ elemnt: Element) {
    self = self.filter {  $0 != elemnt }
  }
}
