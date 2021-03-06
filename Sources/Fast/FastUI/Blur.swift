#if canImport(UIKit)
import SwiftUI
import UIKit

public struct BlurView: UIViewRepresentable {
  
  public init(style: UIBlurEffect.Style) {
    self.style = style
  }
  
  private let style: UIBlurEffect.Style
  
  public typealias Context = UIViewRepresentableContext<BlurView>
  
  public func makeUIView(context: Context) -> UIView {
    let view = UIView(frame: .zero)
    let blurView = createBlurView()
    add(blurView, to: view)
    return view
  }
  
  public func updateUIView(_ uiView: UIView, context: Context) {}
}

private extension BlurView {
  func add(_ blurView: UIVisualEffectView, to view: UIView) {
    view.backgroundColor = .clear
    view.insertSubview(blurView, at: 0)
    NSLayoutConstraint.activate([
      blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
      blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])
  }
  
  func createBlurView() -> UIVisualEffectView {
    let effect = UIBlurEffect(style: style)
    let view = UIVisualEffectView(effect: effect)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }
}

public extension View {
  func blur(_ style: UIBlurEffect.Style) -> some View {
    background(BlurView(style: style))
  }
}

struct Blur_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      Text("No Blur")
      Spacer()
      Text("VM Blur")
        .blur(.extraLight)
      Spacer()
      Text("Blur")
        .padding()
        .blur(.light)
        .cornerRadius(3.0)
    }
    .padding()
  }
}
#endif
