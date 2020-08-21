//
//  View+Navigating.swift
//  Fast
//
//  Created by Nicolas Degen on 21.08.20.
//  Copyright © 2020 Nicolas Degen. All rights reserved.
//

import SwiftUI

extension View {
  public func navigating<Destination>(isActive: Binding<Bool>, destination: Destination) -> some View where Destination: View {
    self.modifier(NavigatingModifier(isActive: isActive, destination: destination))
  }
}

public struct NavigatingModifier<Destination> : ViewModifier where Destination: View {
  @Binding var isActive: Bool
  
  var destination: Destination
  
  public func body(content: Content) -> some View {
    ZStack() {
      NavigationLink(destination: destination, isActive: $isActive) {
        EmptyView()
      }
      content
    }
  }
}
