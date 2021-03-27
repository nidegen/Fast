//
//  UIImagePickerWrapper.swift
//  Fast
//
//  Created by Nicolas Degen on 05.12.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import SwiftUI

#if canImport(UIKit)
struct UIImagePickerWrapper: UIViewControllerRepresentable {
  @Binding var isShowing: Bool
  @Binding var image: UIImage?
  var completion: ((UIImage) -> Void)?
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<UIImagePickerWrapper>) -> UIImagePickerController {
      let imagePicker = UIImagePickerController()
      imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
      imagePicker.allowsEditing = false
      imagePicker.delegate = context.coordinator
      return imagePicker
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<UIImagePickerWrapper>) {}
  
  func makeCoordinator() -> Coordinator {
      return Coordinator(self)
  }
  
  class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var parent: UIImagePickerWrapper
    
    init(_ parent: UIImagePickerWrapper) {
      self.parent = parent
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      parent.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
      parent.image.map { parent.completion?($0) }
      parent.isShowing = false
      picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      parent.isShowing = false
      picker.dismiss(animated: true, completion: nil)
    }
  }
}

struct UIImagePickerWrapper_Previews: PreviewProvider {
  @State static var isPresenting = false
  @State static var image: UIImage? = UIImage()
  
  static var previews: some View {
    UIImagePickerWrapper(isShowing: $isPresenting, image: $image, completion: { _ in print("Image picked") })
  }
}
#endif
