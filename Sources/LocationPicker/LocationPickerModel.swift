//
//  LocationPickerModel.swift
//  Fast
//
//  Created by Nicolas Degen on 27.08.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import MapKit

class LocationPickerModel: ObservableObject {
  @Published var region: MKCoordinateRegion
  
  init() {
    self.region = MKCoordinateRegion(center: .quaiBrugg,
                                     latitudinalMeters: 2000,
                                     longitudinalMeters: 2000)
  }
  
  @Published var radius: CLLocationDistance = 2000
}
