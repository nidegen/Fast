//
//  PHPicker.swift
//  Fast
//
//  Created by Nicolas Degen on 08.09.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import PhotosUI
import SwiftUI

#if canImport(UIKit)
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
struct PHPicker: UIViewControllerRepresentable {
  let configuration: PHPickerConfiguration
  @Binding var isPresented: Bool
  
  var completion: ([PHPickerResult])->()
  
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
    
    private let parent: PHPicker
    
    init(_ parent: PHPicker) {
      self.parent = parent
    }
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
      parent.completion(results)
      parent.isPresented = false
      picker.dismiss(animated: true)
    }
  }
}
#endif
