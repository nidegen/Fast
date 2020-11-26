import Foundation

public extension MutableCollection {
  mutating func updateEach(_ update: (inout Element) -> Void) {
    for i in indices {
      update(&self[i])
    }
  }
  
  mutating func update<PropertyType>(each keyPath: WritableKeyPath<Element, PropertyType>, _ value:  PropertyType) {
    self.updateEach { (item: inout Element) in
      item[keyPath: keyPath] = value
    }
  }
}
