//
//  LocationPickerMap.swift
//  Fast
//
//  Created by Nicolas Degen on 27.08.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI
import MapKit

@available(iOS 14.0, *)
struct LocationPickerMap: View {
  @ObservedObject var model: LocationPickerModel
  
  var body: some View {
    ZStack {
      Map(coordinateRegion: $model.region,
          showsUserLocation: true)
      Group {
        Circle()
          .foregroundColor(Color.blue.opacity(0.1))
          .allowsHitTesting(false)
          .padding()
        Circle()
          .frame(width: 15, height: 15)
          .foregroundColor(.white)
          .padding()
        Circle()
          .frame(width: 11, height: 11)
          .foregroundColor(.blue)
          .padding()
      }
    }
    .onReceive(self.model.$region) { region in
      self.model.radius = CLLocationDistance.minimum(region.latitudinalMeters, region.longitudeMeters) * 0.9
    }
  }
}

@available(iOS 14.0, *)
struct LocationPickerMap_Previews: PreviewProvider {
  @StateObject static var model = LocationPickerModel()
  @State static var distance: CLLocationDistance = 200
  
  static var previews: some View {
    LocationPickerMap(model: model)
  }
}
