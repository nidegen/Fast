//
//  File.swift
//  
//
//  Created by Nicolas Degen on 22.08.20.
//

import SwiftUI

extension NavigationView {
  
  func stack() -> some View {
    self.navigationViewStyle(StackNavigationViewStyle())
  }
}
