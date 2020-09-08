//
//  PhotoPicker.swift
//  Fast
//
//  Created by Nicolas Degen on 04.09.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI
import PhotosUI

@available(iOS 14.0, macOS 11.0, tvOS 13.0, watchOS 6.0, macCatalyst 14, *)
struct PhotoPicker: UIViewControllerRepresentable {
  let configuration: PHPickerConfiguration
  @Binding var isPresented: Bool
  func makeUIViewController(context: Context) -> PHPickerViewController {
    let controller = PHPickerViewController(configuration: configuration)
    controller.delegate = context.coordinator
    return controller
  }
  func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  // Use a Coordinator to act as your PHPickerViewControllerDelegate
  class Coordinator: PHPickerViewControllerDelegate {
    
    private let parent: PhotoPicker
    
    init(_ parent: PhotoPicker) {
      self.parent = parent
    }
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
      print(results)
      parent.isPresented = false // Set isPresented to false because picking has finished.
    }
  }
}
