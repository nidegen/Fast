import SwiftUI

public struct BannerData {
  public var title:String
  public var detail:String
  public var color: Color
  
  public static var test = BannerData(title: "Title", detail: "Detail", color: .black)
}

public struct BannerView: View {
  public var data: BannerData
  public var body: some View {
      VStack {
        HStack {
          VStack(alignment: .leading, spacing: 2) {
            Text(data.title)
              .bold()
            Text(data.detail)
              .font(Font.system(size: 15, weight: Font.Weight.light, design: Font.Design.default))
          }
          Spacer()
        }
        .foregroundColor(Color.white)
        .padding(12)
        .background(data.color)
        .cornerRadius(8)
        Spacer()
      }
      .padding()
  }
}

public struct BannerView_Previews: PreviewProvider {
  static public var previews: some View {
    BannerView(data: .test)
  }
}

public struct BannerModifier: ViewModifier {
  @Binding var data: BannerData
  @Binding var show: Bool
  
  public var action: (()->())?
  
  public func body(content: Content) -> some View {
    ZStack {
      if show {
        BannerView(data: data)
        .animation(.easeInOut)
        .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
        .onTapGesture {
          withAnimation {
            self.show = false
          }
        }.onAppear(perform: {
          DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            withAnimation {
              self.show = false
            }
          }
        })
      }
      content
    }
  }
}
