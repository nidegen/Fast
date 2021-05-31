import Foundation

struct Blinker: View {
  var onColor = Color.green
  var offColor = Color.clear
  
  @State var blinkingColor = Color.green
  
  var repeatingAnimation = Animation.easeInOut(duration: 0.5).repeatForever()
  
  var body: some View {
    Circle()
      .foregroundColor(blinkingColor)
      .frame(width: 10, height: 10, alignment: .leading)
      .onAppear() {
        withAnimation(self.repeatingAnimation) { self.toggleColor() }
    }
  }
  
  func toggleColor() {
    blinkingColor = (blinkingColor == offColor) ? onColor : offColor
  }
}

struct Blinker_Previews: PreviewProvider {
  static var previews: some View {
    Blinker()
  }
}
