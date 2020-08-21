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
  
//  public func navigating<Item, Content>(item: Binding<Item?>, @ViewBuilder content: @escaping (Item) -> Content) -> some View where Item : Identifiable, Content : View {
//    
//  }
}

public struct NavigatingItemModifier<Destination, Item> : ViewModifier where Destination: View, Item : Identifiable {
  @Binding var item: Item?
  
  var destination: ((Item) -> Content)
  
  var isActive: Binding<Bool> {
    Binding<Bool>(get: {
      self.item != nil
    }) { isActive in
      self.item = isActive ? self.item : nil
    }
  }
  
  public func body(content: Content) -> some View {
    ZStack() {
      item.map {
        NavigationLink(destination: destination($0), isActive: isActive) {
          EmptyView()
        }
      }
      content
    }
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
