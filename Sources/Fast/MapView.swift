//
//  MapView.swift
//  Fast
//
//  Created by Nicolas Degen on 29.11.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import SwiftUI
import MapKit
import UIKit

struct MapView: UIViewRepresentable {
  @Binding var coordinate: CLLocationCoordinate2D
  
  func makeUIView(context: Context) -> MKMapView {
    let map = MKMapView()
    map.showsCompass = true
    map.showsUserLocation = true
    map.delegate = context.coordinator
    
    let image = UIImage(systemName: "viewfinder.circle")!.withRenderingMode(.alwaysTemplate)
    let imageView = UIImageView(image: image)
    imageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 40)
    imageView.tintColor = .red
    map.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.centerYAnchor.constraint(equalTo: map.centerYAnchor).isActive = true
    imageView.centerXAnchor.constraint(equalTo: map.centerXAnchor).isActive = true
    
    
    let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    map.setRegion(region, animated: true)
    
    return map
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
    
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  final class Coordinator: NSObject, MKMapViewDelegate {
    var control: MapView
    
    init(_ control: MapView) {
      self.control = control
    }
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
      control.coordinate = mapView.centerCoordinate
    }
  }
}
