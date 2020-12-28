//
//  View+TabItem.swift
//  Fast
//
//  Created by Nicolas Degen on 28.03.20.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
public extension View {
  @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, macCatalyst 14, *)
  func tabItem(_ title: LocalizedStringKey, withIcon iconName: String) -> some View {
    self.tabItem { Label(title, systemImage: iconName) }
  }
}
