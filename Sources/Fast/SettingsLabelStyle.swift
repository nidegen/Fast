import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
public struct SettingsLabelStyle: LabelStyle {
  public var color: Color
  public var scale: CGFloat
  public var imageScale: Image.Scale
  
  public init(color: Color = .blue, scale: CGFloat = 1, imageScale: Image.Scale = .medium) {
    self.color = color
    self.scale = scale
    self.imageScale = imageScale
  }
  
  public func makeBody(configuration: Configuration) -> some View {
    Label {
      configuration.title
    } icon: {
      configuration
        .icon
        .settingsIcon(color: color, scale: scale, imageScale: imageScale)
    }
  }
}

public struct SettingsIconModifier: ViewModifier {
  public var color: Color
  public var scale: CGFloat
  public var imageScale: Image.Scale
  
  public init(color: Color = .blue, scale: CGFloat = 1, imageScale: Image.Scale = .medium) {
    self.color = color
    self.scale = scale
    self.imageScale = imageScale
  }
  
  public func body(content: Content) -> some View {
    content
      .imageScale(.medium)
      .foregroundColor(.white)
      .background(
        RoundedRectangle(cornerRadius: 7 * scale)
          .frame(width: 28 * scale, height: 28 * scale)
          .foregroundColor(color)
      )
  }
}

public extension View {
  func settingsIcon(color: Color = .blue, scale: CGFloat = 1, imageScale: Image.Scale = .medium) -> some View {
    modifier(SettingsIconModifier(color: color, scale: scale, imageScale: imageScale))
  }
}
