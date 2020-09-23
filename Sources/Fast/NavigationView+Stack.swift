//
//  NavigationView.swift
//  Fast
//
//  Created by Nicolas Degen on 22.08.20.
//

import SwiftUI

#if os(iOS) // use available if compiling for macOS 11
public extension NavigationView {
  func stack() -> some View {
    self.navigationViewStyle(StackNavigationViewStyle())
  }
}
#endif
