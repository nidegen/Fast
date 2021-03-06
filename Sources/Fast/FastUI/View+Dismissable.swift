//
//  View+Dismissable.swift
//  Fast
//
//  Created by Nicolas Degen on 07.05.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

#if os(iOS) // use available if compiling for macOS 11
public struct DismissableView<Content> : View where Content : View {
  let content: () -> Content
  
  @Environment(\.presentationMode) var presentationMode
  
  var action: (()->())?
  
  public init(action: (()->())? = nil, @ViewBuilder content: @escaping () -> Content) {
    self.content = content
    self.action = action
  }
  
  var trailingItem: some View {
    Button("Done") {
      self.presentationMode.wrappedValue.dismiss()
      self.action?()
    }
  }
  
  var leadingItem: some View {
    Button("Cancel") {
      self.presentationMode.wrappedValue.dismiss()
    }
  }
  
  public var body: some View {
    content()
      .navigationBarItems(leading: leadingItem, trailing: trailingItem)
  }
}

extension View {
  public func dismissable(action: (()->())? = nil) -> some View {
    DismissableView(action: action) {
      self
    }
  }
}

public struct DismissableModifier: ViewModifier {
  var action: (()->())?
  
  public init(action: (()->())? = nil) {
    self.action = action
  }
  
  public func body(content: Content) -> some View {
    DismissableView(action: action) {
      content
    }
  }
}
#endif
