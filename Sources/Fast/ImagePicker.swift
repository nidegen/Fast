//
//  ImagePicker.swift
//  Fast
//
//  Created by Nicolas Degen on 05.12.19.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import SwiftUI

#if canImport(UIKit)

@available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, macCatalyst 14, *)
public struct ImagePicker: View {
  @Binding var image: UIImage?
  @State var isPresentingImagePicker = false
  let completion: ((UIImage) -> Void)?
  
  public init(image: Binding<UIImage?>, onSelection completion: ((UIImage) -> Void)? = nil) {
    self.completion = completion
    self._image = image
  }
  
  public var body: some View {
    Button(action: {
      self.isPresentingImagePicker.toggle()
    }) {
      if image != nil {
        Image(uiImage: image!)
          .renderingMode(.original)
          .resizable()
          .aspectRatio(contentMode: .fill)
      } else {
        ZStack {
          Color(.gray)
            .clipShape(Circle())
          Image(systemName: "camera.fill")
            .renderingMode(.template)
            .foregroundColor(.white)
            .background(Color.gray)
        }
      }
    }
    .sheet(isPresented: $isPresentingImagePicker) {
      UIImagePickerWrapper(isShowing: self.$isPresentingImagePicker, image: self.$image, completion: self.completion)
    }
  }
}

@available(iOS 13.0, macOS 11.0, tvOS 13.0, watchOS 6.0, macCatalyst 14, *)
struct ImagePicker_Previews: PreviewProvider {
  @State static var image: UIImage?
  static var previews: some View {
    ImagePicker(image: $image, onSelection: {_ in print("Image picked")})
  }
}

#endif
