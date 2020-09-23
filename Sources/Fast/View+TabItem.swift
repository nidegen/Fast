//
//  View+TabItem.swift
//  Fast
//
//  Created by Nicolas Degen on 28.03.20.
//  Copyright © 2019 Nicolas Degen. All rights reserved.
//

import SwiftUI

#if os(iOS) // use available if compiling for macOS 11
public extension View {
  func tabItem(_ title: String, withIcon iconName: String) -> some View {
    self.tabItem {
      VStack {
        Image(systemName: iconName)
        Text(title)
      }
    }
  }
}
#endif
