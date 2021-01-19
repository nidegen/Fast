import Foundation

public extension Sequence {
  func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
    return sorted { a, b in
      return a[keyPath: keyPath] < b[keyPath: keyPath]
    }
  }
  
  func mapped<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [T] {
    return compactMap { element in
      return element[keyPath: keyPath]
    }
  }
}
