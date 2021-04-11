import SwiftUI

public extension View {
  func height(_ height: CGFloat) -> some View {
    self.frame(height: height)
  }
  
  func width(_ width: CGFloat) -> some View {
    self.frame(width: width)
  }
  
  func infiniteMax() -> some View {
    self.frame(maxWidth: .infinity, maxHeight: .infinity)
  }
  
  func proportional(width: CGFloat, height: CGFloat) -> some View {
    GeometryReader { geometry in
      self.frame(width: geometry.size.width * width, height: geometry.size.height * height)
    }
  }
  
  func proportional(width: CGFloat) -> some View {
    GeometryReader { geometry in
      self.frame(width: geometry.size.width * width)
    }
  }
  
  func proportional(height: CGFloat) -> some View {
    GeometryReader { geometry in
      self.frame(height: geometry.size.height * height)
    }
  }
}
