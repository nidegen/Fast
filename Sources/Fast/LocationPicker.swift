import SwiftUI
import MapKit

@available(iOS 14.0, *)
struct LocationPicker: View {
  @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: 47, longitude: 8), latitudinalMeters: 1000, longitudinalMeters: 1000)
  var body: some View {
    ZStack {
      Map(coordinateRegion: $region)
      Circle()
        .allowsHitTesting(false)
        .padding()
        .foregroundColor(.blue)
        .opacity(0.2)
        .allowsHitTesting(false)
    }
  }
}

@available(iOS 14.0, *)
struct LocationPicker_Previews: PreviewProvider {
  static var previews: some View {
    LocationPicker()
  }
}
