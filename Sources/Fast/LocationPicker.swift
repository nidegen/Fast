//
//  LocationPicker.swift
//  Fast
//
//  Created by Nicolas Degen on 29.11.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import SwiftUI

import CoreLocation

public struct LocationPicker: View {
  public init(coordinate: Binding<CLLocationCoordinate2D>) {
    self._coordinate = coordinate
  }
  
  @Binding var coordinate: CLLocationCoordinate2D
  
  public var body: some View {
    NavigationLink(destination: MapView(coordinate: $coordinate)) {
      HStack(spacing: 20) {
        Image(systemName: "mappin.circle.fill")
          .renderingMode(.template)
          .imageScale(.large)
          .foregroundColor(.red)
        Text("Location")
        Spacer()
        Text(String(format: "N: %.5f", coordinate.latitude) + " " + String(format: "E: %.5f", coordinate.longitude))
          .font(.footnote)
      }
    }
  }
}

struct LocationPicker_Previews: PreviewProvider {
  @State static var location = CLLocationCoordinate2D(latitude: 44.011286, longitude: 8.4166868)
  
  static var previews: some View {
    LocationPicker(coordinate: $location)
  }
}
