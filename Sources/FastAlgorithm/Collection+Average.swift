import Foundation

public extension Sequence where Element: AdditiveArithmetic {
  /// Returns the total sum of all elements in the sequence
  func sum() -> Element { reduce(.zero, +) }
}

public extension Collection where Element: BinaryInteger {
  /// Returns the average of all elements in the array
  func average() -> Element { isEmpty ? .zero : sum() / Element(count) }
  /// Returns the average of all elements in the array as Floating Point type
  func average<T: FloatingPoint>() -> T { isEmpty ? .zero : T(sum()) / T(count) }
}

public extension Collection where Element: BinaryFloatingPoint {
  /// Returns the average of all elements in the array
  func average() -> Element { isEmpty ? .zero : Element(sum()) / Element(count) }
}
