//
//  MKCoordinateRegion+Metric.swift
//  Fast
//
//  Created by Nicolas Degen on 27.08.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import MapKit

public extension MKCoordinateRegion {
  
  var latitudinalMeters: CLLocationDistance {
    let span = self.span
    let center = self.center
    
    let latMin = CLLocation(latitude: center.latitude - span.latitudeDelta * 0.5, longitude: center.longitude)
    let latMax = CLLocation(latitude: center.latitude + span.latitudeDelta * 0.5, longitude: center.longitude)
    
    return latMin.distance(from: latMax)
  }
  
  var longitudeMeters: CLLocationDistance {
    let span = self.span
    let center = self.center
    
    let longMin = CLLocation(latitude: center.latitude, longitude: center.longitude - span.longitudeDelta * 0.5)
    let longMax = CLLocation(latitude: center.latitude, longitude: center.longitude + span.longitudeDelta * 0.5)
    
    return longMin.distance(from: longMax)
  }
}
